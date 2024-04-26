import 'dart:ffi';
import 'dart:math';

import 'package:bmi/core/widgets/toast.dart';
import 'package:bmi/modules/home/model/bmi_entry_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'BMIState.dart';

class BMICubit extends Cubit<BMIState> {
  BMICubit() : super(BMIInitial());
  static BMICubit get(context) => BlocProvider.of(context);
double resultBMI = 20;
  void sendCalculatedBMI(double wight, double hight,int age) {
   resultBMI= (wight / pow(hight.round() / 100, 2)).roundToDouble();

   _addDataToFirestore(BMIEntryModel(
     hight: hight,
     weight: wight,
     age: age,
     timeStamp: DateTime.now().millisecondsSinceEpoch,

   ).toMap());
  }
  void _addDataToFirestore(dynamic data) {
    // Get a Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Add a new document with a generated id
    firestore.collection('BMI_History').add(data).then((value) {
      print("Data added successfully!");
      showToast(text: 'BMI Added Successfully', state: ToastStates.SUCESS);
    }).catchError((error) {
      print("Failed to add data: $error");
      showToast(text: "Failed to add data: $error", state: ToastStates.ERROR);

    });
  }
   List<BMIEntryModel>allBMIS = [];
  //
  var listBMIController= ScrollController();
  initalControllerListener(){
    listBMIController.addListener(() {
      print("scroll :${listBMIController?.position}");
      if (listBMIController?.position.maxScrollExtent == listBMIController.offset) {
       emit(OnPaginationLoading());
       showToast(text: 'More...', state: ToastStates.SUCESS);

        getAllBMIS();
      }


      if (listBMIController.position.minScrollExtent == listBMIController.offset) {
        emit(OnRefrishLoading());
        allBMIS=[];
        showToast(text: 'Refresh', state: ToastStates.SUCESS);
        getAllBMIS();
      }
    });

  }
  getAllBMIS()async {
    if(allBMIS.isEmpty){
    emit(LoadingBMIListState());
    }
    await FirebaseFirestore.instance.collection('BMI_History')
        .orderBy('timeStamp',descending: true).limit(allBMIS.length+10)
        .snapshots()
        .listen((event) {
          if(event.docs.length>allBMIS.length){
          event.docs.getRange(allBMIS.length, event.docs.length).forEach((element) {
        print(allBMIS.length);
        if(allBMIS.contains(BMIEntryModel.fromMap(element.data(),element.id))==false){
        allBMIS.add(BMIEntryModel.fromMap(element.data(),element.id));
        }
        print(allBMIS.length);

      });}
      allBMIS=allBMIS.toSet().toList();

    //  allBMIS=allBMIS.reversed.toList();
      print("len: ${allBMIS.length}");
      emit(SucessBMIListState());
    });
  }


deleteItem({required String id})async{
  emit(DeleteLoadingState());

  await FirebaseFirestore.instance.collection('BMI_History').doc(id).delete().then((value){
   print(allBMIS.length);
    allBMIS.removeWhere((element) => element.id==id);
    showToast(text: "Delete success", state: ToastStates.ERROR);
   print(allBMIS.length);

    emit(DeleteSoccessState());
  }).catchError((e){
    emit(DeleteErrorState());
    showToast(text: "faild to delete", state: ToastStates.ERROR);
  });
}
  updateItem({required String id,dynamic data})async{
    emit(UpdateLoadingState());

    await FirebaseFirestore.instance.collection('BMI_History').doc(id).update(data).then((value){
      allBMIS=[];
      showToast(text: "Update success", state: ToastStates.ERROR);

      emit(UpdateSoccessState());
    }).catchError((e){
      emit(UpdateErrorState());
      showToast(text: "faild to update", state: ToastStates.ERROR);
    });
  }
}
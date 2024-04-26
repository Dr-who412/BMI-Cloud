import 'dart:math';

import 'enum/bmi_status.dart';

class BMIEntryModel {
  final String? id;
  final double weight;
  final double hight;
  final int age;
   String? status;
   int timeStamp;
  BMIEntryModel(
      {this.id,
        required this.timeStamp,
      required this.age,
       this.status,
      required this.weight,
      required this.hight}){
    if((weight / pow(hight.round() / 100, 2))<=18.5){
      status=BMIStatesEnum.UnderWeight.name;
    }else if( (weight / pow(hight.round() / 100, 2))<=25){
      status=BMIStatesEnum.Normal.name;
    }else if( (weight / pow(hight.round() / 100, 2))<=30){
      status=BMIStatesEnum.OverWeight.name;
    }else if( (weight / pow(hight.round() / 100, 2))>30){
      status=BMIStatesEnum.Obesity.name;
    }else{
      status='unknowen';
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'wight': weight,
      'hight': hight,
      'timeStamp': timeStamp,
      'age': age,
      'status': status,
    };
  }

  BMIEntryModel.fromMap(Map<String, dynamic> map, String docId)
      : weight = map['wight'],
        hight = map['hight'],
  id=docId,
        age = map['age'],
        status = map['status'],
        timeStamp = map['timeStamp'];
}

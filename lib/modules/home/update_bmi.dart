import 'package:bmi/core/style/fonts.dart';
import 'package:bmi/modules/home/cubit/BMICubit.dart';
import 'package:bmi/modules/home/cubit/BMIState.dart';
import 'package:bmi/modules/home/widget/bmi_calculation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class UpdateBMI extends StatelessWidget {
  final double hight ;
  final int age ;
  final double wight;
  final String id;
  const UpdateBMI({super.key, required this.hight, required this.age, required this.wight, required this.id});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title:  Text('Update BMI',style: Fonts.size22.copyWith(color: Colors.white,),),
          centerTitle: true,
          backgroundColor: HexColor('#0A1C1C'),
        ),
        body: BlocListener<BMICubit, BMIState>(
  listener: (context, state) {
    // TODO: implement listener
    if(state is UpdateSoccessState){
      Navigator.pop(context);
    }
  },
  child: BMICalculation(
          age: age,
          hight: hight,
          weight: wight,
          id: id,
          update: true,
        ),
),
      
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum BMIStatesEnum{
  UnderWeight(name: 'UnderWeight',color: Colors.redAccent),
  Normal(name: 'Normal',color: Colors.green),
  OverWeight(name: 'OverWeight',color: Colors.yellow),
  Obesity(name: 'Obese',color: Colors.red );

const BMIStatesEnum(
{
  required this.name,
  required this.color
}
);
 final String name;
 final Color color;
}
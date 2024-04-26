import 'package:bmi/core/style/fonts.dart';
import 'package:flutter/material.dart';

class DataCardColumn extends StatelessWidget {
  final String title;
  final String data;
  const DataCardColumn({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return    Expanded(
      child: Column(
        children: [
          Text(title,style: Fonts.size22,),
          const SizedBox(height: 2,),
          Text(data,style: Fonts.size15,),
        ],
      ),
    );
  }
}

import 'dart:math';
import 'package:bmi/core/style/fonts.dart';
import 'package:bmi/modules/auth/auth_layout.dart';
import 'package:bmi/modules/home/widget/bmi_calculation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'bmi_list.dart';
import 'cubit/BMICubit.dart';
import 'cubit/BMIState.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const AuthLayout()));
                  },
                  style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all(Colors.black),
                      elevation: MaterialStateProperty.all(4),
                      backgroundColor: MaterialStateProperty.all(
                        HexColor("#0A1C1C"),
                      ),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ))),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Log out",
                          style: Fonts.size15.copyWith(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        const Icon(
                          Icons.exit_to_app,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )),
            ),
          ],
          backgroundColor: Colors.transparent,
        ),
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: BMICalculation(),
        floatingActionButton: TextButton(
            onPressed: () {
              showModalBottomSheet(
                clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  context: context, builder: (context) => BMIList());
            },
            style: ButtonStyle(
                shadowColor: MaterialStateProperty.all(Colors.black),
                elevation: MaterialStateProperty.all(12),
                backgroundColor: MaterialStateProperty.all(
                  HexColor("#0A1C1C"),
                ),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "All",
                    style: Fonts.size15.copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Image.asset(
                    'assets/icons/bmi.png',
                    width: 24,
                    color: Colors.white,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

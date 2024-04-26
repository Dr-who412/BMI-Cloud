import 'dart:math';

import 'package:bmi/modules/home/cubit/BMICubit.dart';
import 'package:bmi/modules/home/cubit/BMIState.dart';
import 'package:bmi/modules/home/model/bmi_entry_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class BMICalculation extends StatefulWidget {
   double? hight ;
  int? age ;
   double? weight;
   bool? update;
   String? id;
   BMICalculation({super.key, this.hight=150.0,this.id,
     this.age=18, this.weight=75.0,this.update=false});

  @override
  State<BMICalculation> createState() => _BMICalculationState();
}

class _BMICalculationState extends State<BMICalculation> {
   bool isMale = true;
   bool isFemale = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: isFemale
              ? HexColor('#FF94D4').withOpacity(.2)
              : isMale
              ? HexColor('#8CE1FE').withOpacity(.2)
              : Colors.white),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 34,
            ),
            Container(
              margin:
              const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
              width: MediaQuery.of(context).size.width,
              child: Row(
                //mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isMale = true;
                          isFemale = !isMale;
                        });
                      },
                      child: Container(
                        height: 100,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: isMale
                              ? HexColor('#8CE1FE')
                              : HexColor('#8CE1FE').withOpacity(.5),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.male, color: Colors.white),
                            Text(
                              "male",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isFemale = true;
                          isMale = !isFemale;
                        });
                      },
                      child: Container(
                        height: 100,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: isFemale
                              ? HexColor('#FF94D4')
                              : HexColor('#FF94D4').withOpacity(.5),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.female, color: Colors.white),
                            Text(
                              "female",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              margin:
              const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: HexColor('#0A1C1C'),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Hight",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "${   widget.hight?.round()}",
                        style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const Text(
                        "cm",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    ],
                  ),
                  Slider(
                    value: widget.hight!,
                    mouseCursor: MouseCursor.defer,
                    onChanged: (value) {
                      setState(() {
                        widget.hight = value;
                      });
                    },
                    activeColor: HexColor('#3E6864'),
                    max: 220,
                    min: 80,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Age",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 34,
                              color: HexColor("#0A1C1C"))),
                      Text(
                        "${   widget.age}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: HexColor("#0A1C1C")),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                widget.age=     widget.age!+1;
                              });
                            },
                            style: ButtonStyle(
                                shadowColor:
                                MaterialStateProperty.all(Colors.black),
                                elevation: MaterialStateProperty.all(12),
                                backgroundColor: MaterialStateProperty.all(
                                  HexColor("#0A1C1C"),
                                ),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ))),
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            onPressed: () {
                                if(widget.age! >1) {
                                  setState(() {
                                    widget.age= widget.age!-1;
                                  });
                                }
                            },
                            style: ButtonStyle(
                                shadowColor:
                                MaterialStateProperty.all(Colors.black),
                                elevation: MaterialStateProperty.all(12),
                                backgroundColor: MaterialStateProperty.all(
                                  HexColor("#0A1C1C"),
                                ),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ))),
                            color: HexColor("#0A1C1C"),
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Weight",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 34,
                            color: HexColor("#0A1C1C")),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            "${widget.weight}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: HexColor("#0A1C1C")),
                          ),
                          Text(
                            "Kg",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: HexColor("#0A1C1C")),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                widget.weight=  widget.weight!+1;
                              });
                            },
                            style: ButtonStyle(
                                shadowColor:
                                MaterialStateProperty.all(Colors.black),
                                elevation: MaterialStateProperty.all(12),
                                backgroundColor: MaterialStateProperty.all(
                                  HexColor("#0A1C1C"),
                                ),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ))),
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            onPressed: () {
                              if(widget.weight! >4) {
                                setState(() {
                                widget.weight=  widget.weight!-1;
                              });
                              }
                            },
                            style: ButtonStyle(
                                shadowColor:
                                MaterialStateProperty.all(Colors.black),
                                elevation: MaterialStateProperty.all(12),
                                backgroundColor: MaterialStateProperty.all(
                                  HexColor("#0A1C1C"),
                                ),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ))),
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            BlocConsumer<BMICubit, BMIState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 24),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: HexColor('#0A1C1C'),
                      borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    "${(widget.weight! / pow(widget.hight!.round() / 100, 2)).roundToDouble()} BMI",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                );
              },
            ),
            BlocListener<BMICubit, BMIState>(
              listener: (context, state) {
                // TODO: implement listener}

              },
              child: TextButton(
                onPressed: () {
                  if(widget.update==true){

                    BMICubit.get(context).updateItem(id: widget.id!,data: BMIEntryModel(
                      hight: widget.hight!,
                      weight: widget.weight!,
                      age: widget.age!,
                      timeStamp: DateTime.now().millisecondsSinceEpoch,
                    ).toMap());

                  }else {
                    BMICubit.get(context)
                        .sendCalculatedBMI(
                        widget.weight!, widget.hight!, widget.age!);
                  }

                  },
                style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all(Colors.black),
                    elevation: MaterialStateProperty.all(12),
                    backgroundColor:
                    MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ))),
                child: Icon(
                  Icons.send,
                  color: HexColor("#0A1C1C"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:bmi/modules/home/cubit/BMICubit.dart';
import 'package:bmi/modules/home/model/bmi_entry_model.dart';
import 'package:bmi/modules/home/update_bmi.dart';
import 'package:flutter/material.dart';
import 'data_column.dart';

class ItemEntry extends StatelessWidget {
  final BMIEntryModel data;
  const ItemEntry({super.key, required this.data});
  Color setColor() {
    switch (data.status) {
      case 'UnderWeight':
        return Colors.redAccent;
      case 'Normal':
        return Colors.green;
      case 'OverWeight':
        return Colors.yellow;

      case 'Obese':
        return Colors.red;
    }
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    setColor();
    return Card(
      elevation: 8,
      margin: const EdgeInsets.only(left: 8, right: 8, top: 8),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: setColor(),
            width: 2,
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                DataCardColumn(title: 'Age', data: data.age.toString()),
                DataCardColumn(title: 'Hight', data: data.hight.toString()),
                DataCardColumn(title: 'Weight', data: data.weight.toString()),
                DataCardColumn(title: 'Status', data: data.status.toString()),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      BMICubit.get(context).deleteItem(id: data.id!);
                    },
                    icon: const Icon(Icons.delete)),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdateBMI(
                                    hight: data.hight,
                                    age: data.age,
                                    wight: data.weight,
                                    id: data.id!,
                                  )));
                    },
                    icon: const Icon(Icons.edit)),
                Spacer(),
                Text(DateTime.fromMillisecondsSinceEpoch(data.timeStamp)
                    .toString()),
                Icon(
                  Icons.access_time,
                  color: Colors.grey.withOpacity(.5),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

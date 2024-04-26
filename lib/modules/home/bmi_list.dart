import 'package:bmi/core/style/fonts.dart';
import 'package:bmi/modules/home/cubit/BMICubit.dart';
import 'package:bmi/modules/home/cubit/BMIState.dart';
import 'package:bmi/modules/home/widget/item_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BMIList extends StatelessWidget {
  const BMIList({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<BMICubit, BMIState>(
        bloc: BMICubit.get(context)..getAllBMIS(),
        listener: (context, state) {
          // TODO: implement listener
        },

        builder: (context, state) {
          return state is LoadingBMIListState?const Center(child: CircularProgressIndicator(),):

          BMICubit.get(context).allBMIS.isEmpty?Center(child: Text('Empty',style: Fonts.size34.copyWith(color:Colors.black.withOpacity(.5)),),):
          Stack(
            children: [

              ListView.builder(
                controller: BMICubit.get(context).listBMIController,
               padding: const EdgeInsets.symmetric(
                 vertical: 4
               ),
                itemCount: BMICubit.get(context).allBMIS.length,
                itemBuilder: (ctx, index) => ItemEntry(
                  data: BMICubit.get(context).allBMIS[index],
                ),
              ),
              if(state is OnPaginationLoading) const Align(
                  alignment: Alignment.bottomCenter,
                  child: Center(child: CircularProgressIndicator(),)),
              if(state is OnRefrishLoading) const Align(
                  alignment: Alignment.topCenter,
                  child: Center(child: CircularProgressIndicator(),)),
            ],
          );
        },
      );
  }
}

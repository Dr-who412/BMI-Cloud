import 'package:bmi/modules/auth/cubit/auth_cubit.dart';
import 'package:bmi/modules/home/cubit/BMICubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/auth/auth_layout.dart';

class BMI extends StatelessWidget {
  const BMI({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [

        BlocProvider(
            create: (context) => AuthCubit()
        ),
        BlocProvider(
            create: (context) => BMICubit()..initalControllerListener()
        ),
      ],
      child: MaterialApp(
        title: 'BMI-8s',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        home: AuthLayout(),
      ),
    );
  }
}

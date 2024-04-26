import 'package:bmi/core/style/fonts.dart';
import 'package:bmi/modules/auth/cubit/auth_cubit.dart';
import 'package:bmi/modules/auth/cubit/auth_state.dart';
import 'package:bmi/modules/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/icons/bmi.png',height: 100,),
            const SizedBox(height: 24,),
            BlocConsumer<AuthCubit,AuthState>(
              listener: (ctx,state){
                if(state is AuthSuccess){
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (ctx)=>const Home()));
                }
              },
              builder: (ctx,state){
                return state is AuthLoading ?
                Center(child: const CircularProgressIndicator()) : TextButton(
                  onPressed: (){
                    AuthCubit.get(context).signInAnonymously();
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        )
                      )
                    )
                  ),
                  child: Text('Quick Sign-up',style: Fonts.size34.copyWith(
                      fontWeight: FontWeight.bold),),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}

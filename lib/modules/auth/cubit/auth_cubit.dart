import 'package:bmi/core/widgets/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);
  UserCredential? userCredential ;
signInAnonymously()async{
  emit(AuthLoading());

  try {

        userCredential=await FirebaseAuth.instance.signInAnonymously();
    print("Signed in with annonymous account.");
    showToast(text: 'Signed in with annonymous account.',
        state: ToastStates.SUCESS);
    emit(AuthSuccess());
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case "operation-not-allowed":
        print("Anonymous auth hasn't been enabled for this project.");
        showToast(text: "Anonymous auth hasn't been enabled for this project.",
            state: ToastStates.ERROR);
        break;
      default:
        print("Unknown error.");
        showToast(text: "Unknown error.", state: ToastStates.ERROR);
        break;
    }
    emit(AuthError(e.code));

  }
}
}
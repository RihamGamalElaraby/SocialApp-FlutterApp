import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:supermarket/models/loginModel.dart';
import 'loginStates.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(socialLoginInitialStates());
  static LoginCubit get(context) => BlocProvider.of(context);

  // LoginModel? loginModel;
  void userLogin({required String email, required String Password}) async {
    emit(socialLoginLoadingStates());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: Password)
        .then((value) {
      emit(socialLoginSucssesStates(value.user!.uid));
      print(value.user!.email);
    }).catchError((error) {
      emit(socialLoginSErrorStates(error));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isObsecure = true;
  void changePasswordVisibility() {
    isObsecure = !isObsecure;

    suffix =
        isObsecure ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(changePassworsVisibailitystate());
  }
}

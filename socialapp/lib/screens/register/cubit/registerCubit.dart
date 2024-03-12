import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/models/userModel.dart';

import 'registerStates.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(socialRegisterInitialStates());
  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister(
      {required String email,
      required String Password,
      required String name,
      required String phone}) async {
    print('heelo');

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: Password,
    )
        .then((value) {
      if (value.credential != null) {
        print(value.credential!.accessToken);
      }
      print(value.user!.uid);
      userCreate(email: email, name: name, phone: phone, uID: value.user!.uid);

      emit(socialRegisterSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(socialRegisterErrorStates(error.toString()));
    });
  }

  void userCreate({
    required String email,
    required String name,
    required String phone,
    required String uID,
  }) {
    userModel model = userModel(
      name: name,
      phone: phone,
      email: email,
      uID: uID,
      bio: 'Write your bio',
      Cover:
          'https://img.freepik.com/free-photo/smiling-confident-businesswoman-posing-with-arms-folded_1262-20950.jpg?w=740&t=st=1709381281~exp=1709381881~hmac=79f6684d79d3f080a90584de2e971350dcbc18df0e17663a26e21699ea28d306',
      img:
          'https://img.freepik.com/free-photo/smiling-confident-businesswoman-posing-with-arms-folded_1262-20950.jpg?w=740&t=st=1709381281~exp=1709381881~hmac=79f6684d79d3f080a90584de2e971350dcbc18df0e17663a26e21699ea28d306',
      isEmailVerivied: false,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uID)
        .set(model.toMap())
        .then((value) {
      emit(socialCreateUserSuccessStates());
    }).catchError((error) {
      print(error.toString());

      emit(socialCreateUserErrorStates(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isObsecure = true;
  void changePasswordVisibility() {
    isObsecure = !isObsecure;

    suffix =
        isObsecure ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangePasswordRegisterVisibilityState());
  }
}

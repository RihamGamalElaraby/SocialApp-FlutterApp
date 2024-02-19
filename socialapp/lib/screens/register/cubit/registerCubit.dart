import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'registerStates.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(socialRegisterInitialStates());
  static RegisterCubit get(context) => BlocProvider.of(context);

  // LoginModel? loginModel;
  // void userRegister(
  //     {required String email,
  //     required String Password,
  //     required String name,
  //     required String phone}) async {
  //   emit(socialRegisterLoadingStates());
  //   try {
  //     final response = await DioHelper.postData(
  //       url: REGISTER,
  //       data: {
  //         'name': name,
  //         'email': email,
  //         'phone': phone,
  //         'password': Password,
  //       },
  //     );
  //     loginModel = LoginModel.fromjson(response.data);
  //     print(loginModel?.data?.token);
  //     print(loginModel?.status);
  //     print(loginModel?.message);
  //     if (loginModel!.status!) {
  //       emit(socialRegisterSuccessStates(loginModel));
  //     } else {
  //       emit(socialRegisterErrorStates(
  //           loginModel!.message ?? 'Unknown error occurred'));
  //     }
  //   } catch (error) {
  //     print(error.toString());
  //     emit(socialRegisterErrorStates(
  //         'Failed to authenticate. Please try again later.'));
  //   }
  // }

  IconData suffix = Icons.visibility_outlined;
  bool isObsecure = true;
  void changePasswordVisibility() {
    isObsecure = !isObsecure;

    suffix =
        isObsecure ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangePasswordRegisterVisibilityState());
  }
}

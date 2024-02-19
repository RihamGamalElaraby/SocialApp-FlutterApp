import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:supermarket/models/loginModel.dart';
import 'loginStates.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(socialLoginInitialStates());
  static LoginCubit get(context) => BlocProvider.of(context);

  // LoginModel? loginModel;
  // void userLogin({required String email, required String Password}) async {
  //   emit(socialLoginLoadingStates());
  //   try {
  //     final response = await DioHelper.postData(
  //       url: LOGIN,
  //       data: {
  //         'email': email,
  //         'password': Password,
  //       },
  //     );
  //     loginModel = LoginModel.fromjson(response.data);
  //     print(loginModel?.data?.token);
  //     print(loginModel?.status);
  //     print(loginModel?.message);
  //     if (loginModel!.status!) {
  //       emit(socialLoginSucssesStates(loginModel));
  //     } else {
  //       emit(socialLoginSErrorStates(
  //           loginModel!.message ?? 'Unknown error occurred'));
  //     }
  //   } catch (error) {
  //     print(error.toString());
  //     emit(socialLoginSErrorStates(
  //         'Failed to authenticate. Please try again later.'));
  //   }
  // }

  IconData suffix = Icons.visibility_outlined;
  bool isObsecure = true;
  void changePasswordVisibility() {
    isObsecure = !isObsecure;

    suffix =
        isObsecure ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(changePassworsVisibailitystate());
  }
}

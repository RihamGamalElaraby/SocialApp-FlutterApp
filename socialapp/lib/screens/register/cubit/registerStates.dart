abstract class RegisterStates {}

class socialRegisterInitialStates extends RegisterStates {}

class socialRegisterLoadingStates extends RegisterStates {}

class socialRegisterSuccessStates extends RegisterStates {
  // final LoginModel? loginModel;
  // socialRegisterSuccessStates(this.loginModel);
}

class socialRegisterErrorStates extends RegisterStates {
  final String error;
  socialRegisterErrorStates(this.error);
}

class ChangePasswordRegisterVisibilityState extends RegisterStates {}

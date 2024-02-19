abstract class LoginStates {}

class socialLoginInitialStates extends LoginStates {}

class socialLoginLoadingStates extends LoginStates {}

class socialLoginSucssesStates extends LoginStates {}

class socialLoginSErrorStates extends LoginStates {
  final String error;
  socialLoginSErrorStates(this.error);
}

class changePassworsVisibailitystate extends LoginStates {}

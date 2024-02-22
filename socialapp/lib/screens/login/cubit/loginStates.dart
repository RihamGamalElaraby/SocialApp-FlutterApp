abstract class LoginStates {}

class socialLoginInitialStates extends LoginStates {}

class socialLoginLoadingStates extends LoginStates {}

class socialLoginSucssesStates extends LoginStates {
  final String uId;
  socialLoginSucssesStates(this.uId);
}

class socialLoginSErrorStates extends LoginStates {
  final String error;
  socialLoginSErrorStates(this.error);
}

class changePassworsVisibailitystate extends LoginStates {}

abstract class SocialStates {}

class inititalState extends SocialStates {}

class SocialGetUserSuccess extends SocialStates {}

class SocialGetUserError extends SocialStates {
  final String error;
  SocialGetUserError(this.error);
}

class SocialGetUserLoading extends SocialStates {}

class SocialChangeButtomNav extends SocialStates {}

class SocialChangeNewPostState extends SocialStates {}

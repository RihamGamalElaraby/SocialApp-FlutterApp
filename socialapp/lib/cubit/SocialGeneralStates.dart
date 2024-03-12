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

class SocialProfileImgSuccessState extends SocialStates {}

class SocialProfileImgErrorState extends SocialStates {}

class SocialUploadProfileImgSuccessState extends SocialStates {}

class SocialUploadProfileImgErrorState extends SocialStates {}

class SocialCoverImgSuccessState extends SocialStates {}

class SocialCoverImgErrorState extends SocialStates {}

class SocialPostImgGetSuccessState extends SocialStates {}

class SocialPostImgGetErrorState extends SocialStates {}

class SocialUploadCoverImgSuccessState extends SocialStates {}

class SocialUploadCoverImgErrorState extends SocialStates {}

class SocialUpdateError extends SocialStates {}

class SocialUpdateLoading extends SocialStates {}

// create post

class SocialCreatePostError extends SocialStates {}

class SocialCreatePostLoading extends SocialStates {}

class SocialCreatePostSuccess extends SocialStates {}
///////////

class SocialRemovePostImageSuccess extends SocialStates {}

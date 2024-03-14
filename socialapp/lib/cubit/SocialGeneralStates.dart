abstract class SocialStates {}

class inititalState extends SocialStates {}

//   get user
class SocialGetUserSuccess extends SocialStates {}

class SocialGetUserError extends SocialStates {
  final String error;
  SocialGetUserError(this.error);
}

class SocialGetUserLoading extends SocialStates {}

// get all users
class SocialGetAllUserSuccess extends SocialStates {}

class SocialGetAllUserError extends SocialStates {
  final String error;
  SocialGetAllUserError(this.error);
}

class SocialGetAllUserLoading extends SocialStates {}

// nav bar
class SocialChangeButtomNav extends SocialStates {}

//

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

///// get posts
class SocialGetPostsSuccess extends SocialStates {}

class SocialGetPostsError extends SocialStates {
  final String error;
  SocialGetPostsError(this.error);
}

class SocialGetPostsLoading extends SocialStates {}

// like posts
class SocialLikePostsSuccess extends SocialStates {}

class SocialLikePostsError extends SocialStates {
  final String error;
  SocialLikePostsError(this.error);
}

class SocialLikePostsLoading extends SocialStates {}

// comments
class SocialCommentPostsSuccess extends SocialStates {}

class SocialCommentPostsError extends SocialStates {
  final String error;
  SocialCommentPostsError(this.error);
}

class SocialCommentsPostsLoading extends SocialStates {}

//chat
class SocialSendMessageSuccess extends SocialStates {}

class SocialSendMessageError extends SocialStates {}

class SocialGetMessageSuccess extends SocialStates {}

class SocialGetMessageError extends SocialStates {}

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socialapp/components/constants.dart';
import 'package:socialapp/cubit/SocialGeneralStates.dart';
import 'package:socialapp/models/messageModel.dart';
import 'package:socialapp/models/postModel.dart';
import 'package:socialapp/models/userModel.dart';
import 'package:socialapp/screens/chatScreen.dart';
import 'package:socialapp/screens/feedsScreen.dart';
import 'package:socialapp/screens/newPostScreen.dart';
import 'package:socialapp/screens/settingsScreen.dart';
import 'package:socialapp/screens/usersScreen.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(inititalState());
  static SocialCubit get(context) => BlocProvider.of(context);
  userModel? model;

  File? profileimage;
  var picker = ImagePicker();
  bool isImagePickerActive = false;
  Future<void> getProfileImg() async {
    if (isImagePickerActive) {
      return;
    }
    isImagePickerActive = true;
    try {
      final image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        final imageTemp = File(image.path);
        profileimage = imageTemp;
        emit(SocialProfileImgSuccessState());
      } else {
        print('Failed to pick image: error');
        emit(SocialProfileImgErrorState());
      }
    } catch (e) {
      print('Failed to pick image: $e');
      emit(SocialProfileImgErrorState());
    } finally {
      isImagePickerActive = false;
    }
  }

  File? coverImage;
  Future<void> getCoverImg() async {
    if (isImagePickerActive) {
      // Image picker is already active, do not proceed
      return;
    }

    isImagePickerActive = true;

    try {
      final image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        final imageTemp = File(image.path);
        coverImage = imageTemp;
        emit(SocialCoverImgSuccessState());
      } else {
        print('Failed to pick image: error');
        emit(SocialCoverImgErrorState());
      }
    } catch (e) {
      print('Failed to pick image: $e');
      emit(SocialCoverImgErrorState());
    } finally {
      isImagePickerActive = false;
    }
  }

  void getUserData() {
    emit(SocialGetUserLoading());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then(
      (value) {
        print(value.data());
        if (value.data() != null) {
          model = userModel.fromJson(value.data()!);
          emit(SocialGetUserSuccess());
        }
      },
    ).catchError((error) {
      print(error.toString());
      emit(SocialGetUserError(error.toString()));
    });
  }

  int currentIndex = 0;
  List<Widget> screens = [
    const FeedScreen(),
    const ChatScreen(),
    NewPostScreen(),
    const UsersScreen(),
    const SettingsScreen(),
  ];

  List<String> titles = [
    'Home',
    'Chats',
    'newpost',
    'Users',
    'Settings',
  ];

  void changeBottomNav(int index) {
    if (index == 1) getUsers();

    if (index == 2) {
      emit(SocialChangeNewPostState());
    } else {
      currentIndex = index;
      emit(SocialChangeButtomNav());
    }
  }

  final storage = FirebaseStorage.instance;
  void uploadProfileImage({
    required String name,
    required String phone,
    required String bio,
    String? cover,
    String? img,
  }) {
    emit(SocialUpdateLoading());
    storage
        .ref()
        .child('users/${Uri.file(profileimage!.path).pathSegments.last}')
        .putFile(profileimage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        upateuserData(name: name, phone: phone, bio: bio, img: value);
        emit(SocialUploadProfileImgSuccessState()); // Emit success state
      }).catchError((error) {
        emit(SocialUploadProfileImgErrorState());
      });
    }).catchError((error) {
      emit(SocialUploadProfileImgErrorState());
    });
  }

  void uploadCoverImage({
    required String name,
    required String phone,
    required String bio,
    String? cover,
    String? img,
  }) {
    emit(SocialUpdateLoading());

    storage
        .ref()
        .child('users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        upateuserData(name: name, phone: phone, bio: bio, cover: value);
        emit(SocialUploadCoverImgSuccessState()); // Emit success state
      }).catchError((error) {
        emit(SocialUploadCoverImgErrorState());
      });
    }).catchError((error) {
      emit(SocialUploadCoverImgErrorState());
    });
  }

  void upateuserData({
    required String name,
    required String phone,
    required String bio,
    String? cover,
    String? img,
  }) {
    userModel usermodel = userModel(
      name: name,
      phone: phone,
      bio: bio,
      email: model!.email,
      Cover: cover ?? model!.Cover,
      img: img ?? model!.img,
      uID: model!.uID,
      isEmailVerivied: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(model!.uID)
        .update(usermodel.toMap())
        .then((value) {
      model = usermodel; // Update the local model variable
      getUserData();
    }).catchError((error) {
      emit(SocialUpdateError());
    });
  }

  File? postImage;
  Future<void> getpostImg() async {
    if (isImagePickerActive) {
      return;
    }
    isImagePickerActive = true;
    try {
      final image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        final imageTemp = File(image.path);
        postImage = imageTemp;
        emit(SocialPostImgGetSuccessState());
      } else {
        print('Failed to pick image: error');
        emit(SocialCoverImgErrorState());
      }
    } catch (e) {
      print('Failed to pick image: $e');
      emit(SocialCoverImgErrorState());
    } finally {
      isImagePickerActive = false;
    }
  }

  void removePostImage() {
    postImage = null;
    emit(SocialRemovePostImageSuccess());
  }

  void uploadPostImage({
    required String dateTime,
    required String? text,
  }) {
    emit(SocialCreatePostLoading());

    storage
        .ref()
        .child('posts/${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        CreatePost(dateTime: dateTime, text: text, postImage: value);
        emit(SocialCreatePostSuccess()); // Emit success state
      }).catchError((error) {
        emit(SocialCreatePostError());
      });
    }).catchError((error) {
      emit(SocialCreatePostError());
    });
  }

  void CreatePost({
    required String dateTime,
    required String? text,
    String? postImage,
  }) {
    emit(SocialCreatePostLoading());

    PostModel modelpost = PostModel(
      name: model!.name,
      img: model!.img,
      uID: model!.uID,
      dateTime: dateTime,
      text: text,
      postImage: postImage ?? '',
    );
    FirebaseFirestore.instance
        .collection('posts')
        .add(modelpost.toMap())
        .then((value) {
      emit(SocialCreatePostSuccess());
    }).catchError((error) {
      emit(SocialCreatePostError());
    });
  }

  List<PostModel> posts = [];
  List<String> postsID = [];
  List<int> Likes = [];
  List<String> comments = [];

  void getPosts() {
    FirebaseFirestore.instance.collection('posts').get().then((value) {
      for (var element in value.docs) {
        // element.reference.collection('Comments').get().then((value) {
        //   comments.add(value.docs.toString());
        // }).catchError((error) {});
        element.reference.collection('likes').get().then((value) {
          Likes.add(value.docs.length);
          element.id;
          postsID.add(element.id);
          posts.add(PostModel.fromJson(element.data()));
        }).catchError((error) {});
      }
      print(posts.first);
      emit(SocialGetPostsSuccess());
    }).catchError((error) {
      emit(SocialGetPostsError(error.toString()));
    });
  }

  void LikePost(String postID) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postID)
        .collection('likes')
        .doc(model!.uID)
        .set({
      'like': true,
    }).then((value) {
      emit(SocialLikePostsSuccess());
    }).catchError((error) {
      emit(SocialLikePostsError(error.toString()));
    });
  }

  void CommentPost(String postID, String comment) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postID)
        .collection('Comments')
        .doc(model!.uID)
        .set({
      'comment': comment,
    }).then((value) {
      emit(SocialCommentPostsSuccess());
    }).catchError((error) {
      emit(SocialCommentPostsError(error.toString()));
    });
  }

  List<userModel> users = [];
  void getUsers() {
    users = [];
    FirebaseFirestore.instance.collection('users').get().then((value) {
      for (var element in value.docs) {
        if (element.data()['uID'] != model!.uID)
          users.add(userModel.fromJson(element.data()));
      }

      print(users.first);
      emit(SocialGetAllUserSuccess());
    }).catchError((error) {
      emit(SocialGetAllUserError(error.toString()));
    });
  }

  void sendMessage({
    required String? reciverID,
    required String? dateTime,
    required String? text,
  }) {
    MessageModel modelmessage = MessageModel(
      text: text,
      senderID: model!.uID,
      reciverID: reciverID,
      dateTime: dateTime,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(model!.uID)
        .collection('chats')
        .doc(reciverID)
        .collection('messages')
        .add(modelmessage.toMap())
        .then((value) {
      emit(SocialSendMessageSuccess());
    }).catchError((error) {
      emit(SocialSendMessageError());
    });
    FirebaseFirestore.instance
        .collection('users')
        .doc(reciverID)
        .collection('chats')
        .doc(model!.uID)
        .collection('messages')
        .add(modelmessage.toMap())
        .then((value) {
      emit(SocialSendMessageSuccess());
    }).catchError((error) {
      emit(SocialSendMessageError());
    });
  }

  List<MessageModel> messages = [];

  void getMessages({
    required String? reciverID,
  }) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(model!.uID)
        .collection('chats')
        .doc(reciverID)
        .collection('messages')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      messages = [];
      event.docs.forEach((element) {
        messages.add(MessageModel.fromJson(element.data()));
      });
      emit(SocialGetMessageSuccess());
    });
  }
}

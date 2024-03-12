import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socialapp/components/constants.dart';
import 'package:socialapp/cubit/SocialGeneralStates.dart';
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
}

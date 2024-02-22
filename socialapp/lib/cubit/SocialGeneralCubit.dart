import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/components/constants.dart';
import 'package:socialapp/cubit/SocialGeneralStates.dart';
import 'package:socialapp/models/userModel.dart';
import 'package:socialapp/screens/chatScreen.dart';
import 'package:socialapp/screens/feedsScreen.dart';
import 'package:socialapp/screens/settingsScreen.dart';
import 'package:socialapp/screens/usersScreen.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(inititalState());
  static SocialCubit get(context) => BlocProvider.of(context);

  userModel? model;
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
    FeedScreen(),
    ChatScreen(),
    UsersScreen(),
    SettingsScreen(),
  ];

  List<String> titles = [
    'Home',
    'Chats',
    'Users',
    'Settings',
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(SocialChangeButtomNav());
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/Layout/socialLayout.dart';
import 'package:socialapp/cahceHelper/cache_helper.dart';
import 'package:socialapp/cubit/SocialGeneralCubit.dart';
import 'package:socialapp/cubit/SocialGeneralStates.dart';
import 'package:socialapp/screens/login/cubit/loginCubit.dart';
import 'package:socialapp/screens/register/cubit/registerCubit.dart';

import 'components/constants.dart';
import 'firebase_options.dart';
import 'screens/login/cubit/blocObserver.dart';
import 'screens/login/loginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();

  uId = CacheHelper.getData(key: 'uId');
  Widget widget;
  if (uId != null) {
    widget = SocialLayOutScreen();
  } else {
    widget = LoginScreen();
  }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => LoginCubit())),
        BlocProvider(create: ((context) => RegisterCubit())),
        BlocProvider(create: ((context) => SocialCubit()..getUserData())),
        // BlocProvider(create: ((context) => SearchCubit())),
      ],
      child: MyApp(
        startWidget: widget,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;

  MyApp({this.startWidget});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return MaterialApp(
          title: 'SuperApp',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: startWidget,
        );
      },
    );
  }
}

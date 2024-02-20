import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/screens/login/cubit/loginCubit.dart';
import 'package:socialapp/screens/register/cubit/registerCubit.dart';

import 'firebase_options.dart';
import 'screens/login/cubit/blocObserver.dart';
import 'screens/login/loginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiBlocProvider(
      child: MyApp(),
      providers: [
        BlocProvider(create: ((context) => LoginCubit())),
        BlocProvider(create: ((context) => RegisterCubit())),
        // BlocProvider(create: ((context) => SearchCubit())),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SuperApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}

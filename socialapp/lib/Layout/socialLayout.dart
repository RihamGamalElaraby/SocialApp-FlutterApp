import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/cubit/SocialGeneralCubit.dart';
import 'package:socialapp/cubit/SocialGeneralStates.dart';

class SocialLayOutScreen extends StatelessWidget {
  const SocialLayOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        return Scaffold(
          appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.notification_add)),
                IconButton(onPressed: () {}, icon: Icon(Icons.search))
              ],
              title: Text(
                cubit.titles[cubit.currentIndex],
              )),
          body: cubit.screens[cubit.currentIndex],
          // ConditionalBuilder(
          //   condition: SocialCubit.get(context).model != null,
          //   builder: (context) {
          //     // var model = SocialCubit.get(context).model;
          //     return Column(children: [
          //       // if (SocialCubit.get(context).model!.isEmailVerivied = false)
          //       // if (!FirebaseAuth.instance.currentUser!.emailVerified)
          //       //   Container(
          //       //     height: 50,
          //       //     color: Colors.pinkAccent[100]!.withOpacity(0.5),
          //       //     child: Padding(
          //       //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //       //       child: Row(
          //       //         children: [
          //       //           Icon(Icons.warning),
          //       //           SizedBox(
          //       //             width: 5.0,
          //       //           ),
          //       //           Expanded(child: Text('Please verify your email')),
          //       //           SizedBox(
          //       //             width: 20.0,
          //       //           ),
          //       //           ElevatedButton(
          //       //               onPressed: () {
          //       //                 FirebaseAuth.instance.currentUser!
          //       //                     .sendEmailVerification()
          //       //                     .then((value) {
          //       //                   Fluttertoast.showToast(
          //       //                       msg: 'Check your mail',
          //       //                       toastLength: Toast.LENGTH_LONG,
          //       //                       gravity: ToastGravity.CENTER,
          //       //                       timeInSecForIosWeb: 5,
          //       //                       backgroundColor: Colors.green,
          //       //                       textColor: Colors.black,
          //       //                       fontSize: 16.0);
          //       //                 }).catchError((error) {});
          //       //               },
          //       //               child: Text('Send email verification'))
          //       //         ],
          //       //       ),
          //       //     ),
          //       //   )
          //     ]);
          //   },
          //   fallback: (context) => Center(child: CircularProgressIndicator()),
          // ),
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.purpleAccent,
              unselectedItemColor: Colors.grey,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Users'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'Setting'),
              ]),
        );
      },
    );
  }
}

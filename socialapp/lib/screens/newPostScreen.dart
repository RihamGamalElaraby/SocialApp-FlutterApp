import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/cubit/SocialGeneralCubit.dart';
import 'package:socialapp/cubit/SocialGeneralStates.dart';

class NewPostScreen extends StatelessWidget {
  NewPostScreen({super.key});
  var textController = TextEditingController();
  var now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final postImage = SocialCubit.get(context).postImage;

          //     var postImageBackGrounf;
          // if (postImage == null && PostModel != null) {
          //   postImageBackGrounf = NetworkImage(postImage.toString());
          // } else if (postImage != null) {
          //   postImageBackGrounf = FileImage(postImage);
          // }
          return Scaffold(
              appBar: AppBar(
                actions: [
                  OutlinedButton(
                    onPressed: () {
                      if (SocialCubit.get(context).postImage == null) {
                        SocialCubit.get(context).CreatePost(
                            dateTime: now.toString(),
                            text: textController.text);
                      } else {
                        SocialCubit.get(context).uploadPostImage(
                            dateTime: now.toString(),
                            text: textController.text);
                      }
                    },
                    child: const Text('Post'),
                  )
                ],
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_left),
                ),
                titleSpacing: 0.0,
                title: const Text(
                  'Create Post',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  if (state is SocialCreatePostLoading)
                    const LinearProgressIndicator(),
                  if (state is SocialCreatePostLoading)
                    const SizedBox(
                      height: 20,
                    ),
                  const Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        radius: 25.0,
                        backgroundImage: NetworkImage(
                            'https://img.freepik.com/free-photo/woman-beach-with-her-baby-enjoying-sunset_52683-144131.jpg?w=826&t=st=1709139774~exp=1709140374~hmac=8d5b19c1146e6ef66276e03ff36a3f0012ab93b8c465e41cc3473cbc0cdc723e'),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              'Riham Elaraby',
                              style: TextStyle(fontSize: 19, height: 1.4),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: textController,
                      // onFieldSubmitted: (value) {
                      // if (formKey.currentState!.validate()) {
                      // // LoginCubit.get(context).userLogin(
                      //     email: emailController.text,
                      //     Password: passwarController.text);
                      // }
                      // },
                      // obscureText: LoginCubit.get(context).isObsecure,
                      // validator: (value) {
                      //   if (value == null) {
                      //     return 'please enter your passward';
                      //   }
                      //   return null;
                      // },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        // label: const Text('Passward'),
                        // focusedErrorBorder: const OutlineInputBorder(
                        //   borderSide: BorderSide(color: Colors.black, width: 5.0),
                        //   borderRadius: BorderRadius.all(Radius.circular(10)),
                        // ),
                        // enabledBorder: const OutlineInputBorder(
                        //   borderSide: BorderSide(color: Colors.teal, width: 2.0),
                        // ),
                        // border: OutlineInputBorder(
                        //     borderRadius: BorderRadius.circular(20)),
                        // prefixIcon: IconButton(
                        // icon: const Icon(Icons.lock),
                        // onPressed: () {},
                        // ),
                        hintText: 'Whar is on your mind now..',
                        // suffixIcon: IconButton(
                        // icon: Icon(LoginCubit.get(context).suffix),
                        // onPressed: () {
                        // LoginCubit.get(context)
                        // .changePasswordVisibility();
                        // },
                      ),
                      // ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (SocialCubit.get(context).postImage != null)
                    Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        Container(
                          height: 120,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            image: DecorationImage(
                              image: FileImage(postImage!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            onPressed: () {
                              SocialCubit.get(context).removePostImage();
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            SocialCubit.get(context).getpostImg();
                          },
                          child: const Row(
                            children: [
                              Text('Add Photos'),
                              SizedBox(
                                width: 4,
                              ),
                              Icon(Icons.add_a_photo_rounded)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const Text(
                            'Tags #',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      )
                    ],
                  )
                ]),
              ));
        });
  }
}

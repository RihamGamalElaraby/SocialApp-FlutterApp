import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/cubit/SocialGeneralCubit.dart';
import 'package:socialapp/cubit/SocialGeneralStates.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final userModel = SocialCubit.get(context).model;
        final profileImage = SocialCubit.get(context).profileimage;
        final coverImage = SocialCubit.get(context).coverImage;

        final nameController = TextEditingController(text: userModel!.name);
        final bioController = TextEditingController(text: userModel.bio);
        final phoneController = TextEditingController(text: userModel.phone);

        ImageProvider<Object>? backgroundImage;
        if (profileImage == null && userModel != null) {
          backgroundImage = NetworkImage(userModel.img.toString());
        } else if (profileImage != null) {
          backgroundImage = FileImage(profileImage);
        }

        var coverBackgroundImage;
        if (coverImage == null && userModel != null) {
          coverBackgroundImage = NetworkImage(userModel.Cover.toString());
        } else if (coverImage != null) {
          coverBackgroundImage = FileImage(coverImage);
        }

        return Scaffold(
          appBar: AppBar(
            actions: [
              OutlinedButton(
                onPressed: () {
                  SocialCubit.get(context).upateuserData(
                      name: nameController.text,
                      phone: phoneController.text,
                      bio: bioController.text);
                },
                child: const Text('UPDATE'),
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
              'Edit Profile',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (state is SocialUpdateLoading) LinearProgressIndicator(),
                  Container(
                    height: 190,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                height: 120,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4),
                                    topRight: Radius.circular(4),
                                  ),
                                  image: DecorationImage(
                                    image: coverBackgroundImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                child: IconButton(
                                  onPressed: () {
                                    SocialCubit.get(context).getCoverImg();
                                  },
                                  icon: const Icon(
                                    Icons.camera_alt,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 65.0,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 60.0,
                                backgroundImage: backgroundImage,
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                onPressed: () {
                                  SocialCubit.get(context).getProfileImg();
                                },
                                icon: const Icon(
                                  Icons.camera_alt,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  if (SocialCubit.get(context).profileimage != null ||
                      SocialCubit.get(context).coverImage != null)
                    Row(
                      children: [
                        if (SocialCubit.get(context).profileimage != null)
                          Expanded(
                            child: Column(
                              children: [
                                OutlinedButton(
                                  onPressed: () {
                                    SocialCubit.get(context).uploadProfileImage(
                                        name: nameController.text,
                                        phone: phoneController.text,
                                        bio: bioController.text);
                                  },
                                  child: const Text('Upload Profile'),
                                ),
                                state is SocialUpdateLoading
                                    ? LinearProgressIndicator()
                                    : SizedBox(),
                              ],
                            ),
                          ),
                        SizedBox(
                          width: 5,
                        ),
                        if (SocialCubit.get(context).coverImage != null)
                          Expanded(
                            child: Column(
                              children: [
                                OutlinedButton(
                                  onPressed: () {
                                    SocialCubit.get(context).uploadCoverImage(
                                        name: nameController.text,
                                        phone: phoneController.text,
                                        bio: bioController.text);
                                    // SocialCubit.get(context).upateuserData(
                                    // name: nameController.text,
                                    // phone: phoneController.text,
                                    // bio: bioController.text);
                                  },
                                  child: const Text('Upload Cover'),
                                ),
                                state is SocialUpdateLoading
                                    ? LinearProgressIndicator()
                                    : SizedBox(),
                              ],
                            ),
                          )
                      ],
                    ),
                  const SizedBox(
                    height: 7,
                  ),
                  TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      label: Text('Name'),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 5.0),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal, width: 2.0),
                      ),
                      border: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(20),
                          ),
                      prefixIcon: Icon(Icons.person_3_outlined),
                      hintText: 'Name',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your phone';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      label: Text('phone'),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 5.0),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal, width: 2.0),
                      ),
                      border: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(20),
                          ),
                      prefixIcon: Icon(Icons.phone),
                      hintText: 'phone',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: bioController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Bio';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      label: Text('Bio'),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 5.0),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal, width: 2.0),
                      ),
                      border: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(20),
                          ),
                      prefixIcon: Icon(Icons.info),
                      hintText: 'Bio',
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

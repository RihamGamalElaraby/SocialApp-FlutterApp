import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/cubit/SocialGeneralCubit.dart';
import 'package:socialapp/cubit/SocialGeneralStates.dart';
import 'package:socialapp/models/postModel.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
              condition: SocialCubit.get(context).posts.isNotEmpty &&
                  SocialCubit.get(context).model != null,
              fallback: (context) {
                return const Center(child: CircularProgressIndicator());
              },
              builder: (context) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 20.0,
                        margin: EdgeInsets.all(5),
                        child: Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              Image(
                                image: NetworkImage(
                                    'https://img.freepik.com/free-photo/close-up-young-happy-family-spending-time-together_329181-15884.jpg?w=826&t=st=1708565798~exp=1708566398~hmac=95591f4a7c00087def860ec1f33e418ff097c997492f23ba671326cb13501287'),
                                fit: BoxFit.cover,
                                height: 200,
                                width: double.infinity,
                              ),
                              Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text(
                                  'communicate with friends',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ]),
                      ),
                      ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        itemBuilder: (context, index) => buildPostitem(context,
                            SocialCubit.get(context).posts[index], index),
                        itemCount: SocialCubit.get(context).posts.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                );
              });
        });
  }

  Widget buildPostitem(BuildContext context, PostModel model, int index) =>
      Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 20.0,
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage('${model.img}'),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${model.name}',
                              style: const TextStyle(fontSize: 18, height: 1.4),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                        Text(
                          '${model.dateTime}',
                          style: const TextStyle(fontSize: 14, height: 1.4),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey,
                ),
              ),
              Text(
                '${model.text}',
                style: const TextStyle(),
              ),
              if (model.postImage != '')
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage('${model.img}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.add_reaction_outlined),
                              const SizedBox(
                                width: 7,
                              ),
                              Text(
                                '${SocialCubit.get(context).Likes[index] ?? '0'}',
                                style: const TextStyle(fontSize: 14),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Icon(Icons.chat),
                              const SizedBox(
                                width: 7,
                              ),
                              Text(
                                '${SocialCubit.get(context).comments.length}  Comment',
                                style: const TextStyle(fontSize: 14),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 15.0,
                            backgroundImage: NetworkImage(
                                '${SocialCubit.get(context).model!.img}'),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {},
                            child: SizedBox(
                              height: 40,
                              width: 250,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Write a comment',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      SocialCubit.get(context)
                          .LikePost(SocialCubit.get(context).postsID[index]);
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.add_reaction_outlined),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          'Like',
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

///////////////////////
}



 // SizedBox(
              //   width: double.infinity,
              //   child: Wrap(
              //     children: [
              // SizedBox(
              //   height: 25,
              //   child: OutlinedButton(
              //       onPressed: () {},
              //       child: const Padding(
              //         padding: EdgeInsets.all(0.0),
              //         child: Text(
              //           '#software',
              //           style: TextStyle(color: Colors.blue),
              //         ),
              //       )),
              // ),
              // SizedBox(
              //   height: 25,
              //   child: OutlinedButton(
              //       onPressed: () {},
              //       child: const Padding(
              //         padding: EdgeInsets.all(0.0),
              //         child: Text(
              //           '#software',
              //           style: TextStyle(color: Colors.blue),
              //         ),
              //       )),
              // ),
              // SizedBox(
              //   height: 25,
              //   child: OutlinedButton(
              //       onPressed: () {},
              //       child: const Padding(
              //         padding: EdgeInsets.all(0.0),
              //         child: Text(
              //           '#software',
              //           style: TextStyle(color: Colors.blue),
              //         ),
              //       )),
              // ),
              // SizedBox(
              //   height: 25,
              //   child: OutlinedButton(
              //       onPressed: () {},
              //       child: const Padding(
              //         padding: EdgeInsets.all(0.0),
              //         child: Text(
              //           '#software',
              //           style: TextStyle(color: Colors.blue),
              //         ),
              //       )),
              // ),
              // SizedBox(
              //   height: 25,
              //   child: OutlinedButton(
              //       onPressed: () {},
              //       child: const Padding(
              //         padding: EdgeInsets.all(0.0),
              //         child: Text(
              //           '#software',
              //           style: TextStyle(color: Colors.blue),
              //         ),
              //       )),
              // ),
              // SizedBox(
              //   height: 25,
              //   child: OutlinedButton(
              //       onPressed: () {},
              //       child: const Padding(
              //         padding: EdgeInsets.all(0.0),
              //         child: Text(
              //           '#software',
              //           style: TextStyle(color: Colors.blue),
              //         ),
              //       )),
              // ),
              //     SizedBox(
              //       height: 25,
              //       child: OutlinedButton(
              //           onPressed: () {},
              //           child: const Padding(
              //             padding: EdgeInsets.all(0.0),
              //             child: Text(
              //               '#software',
              //               style: TextStyle(color: Colors.blue),
              //  ),
              //           )
              //           ),
              //     ),
              // ],
              // ),
              // ),
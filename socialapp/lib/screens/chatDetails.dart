import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/cubit/SocialGeneralCubit.dart';
import 'package:socialapp/cubit/SocialGeneralStates.dart';
import 'package:socialapp/models/messageModel.dart';
import 'package:socialapp/models/userModel.dart';

class ChatDetils extends StatelessWidget {
  userModel? model;
  ChatDetils({super.key, this.model});
  var messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      SocialCubit.get(context).getMessages(reciverID: model!.uID);
      return BlocConsumer<SocialCubit, SocialStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                titleSpacing: 0.0,
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage('${model!.img}'),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text('${model!.name}')
                  ],
                ),
              ),
              body: ConditionalBuilder(
                condition: SocialCubit.get(context).messages.length > 0,
                fallback: (context) =>
                    Center(child: CircularProgressIndicator()),
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            var messege =
                                SocialCubit.get(context).messages[index];
                            if (SocialCubit.get(context).model!.uID ==
                                messege.senderID)
                              return buildMyMessage(messege);
                            return buildMessages(messege);
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 15,
                            );
                          },
                          itemCount: SocialCubit.get(context).messages.length,
                        ),
                      ),
                      Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.grey, width: 1)),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: messageController,
                                decoration: InputDecoration(
                                    hintText: '  write here...',
                                    border: InputBorder.none),
                              ),
                            ),
                            Container(
                              height: 40,
                              color: Colors.teal[400],
                              child: MaterialButton(
                                minWidth: 1.0,
                                onPressed: () {
                                  SocialCubit.get(context).sendMessage(
                                      reciverID: model!.uID,
                                      dateTime: DateTime.now().toString(),
                                      text: messageController.text);
                                  messageController.clear();
                                },
                                child: Icon(
                                  Icons.send,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
    });
  }

  Widget buildMessages(MessageModel message) => Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(10.0),
                  topEnd: Radius.circular(10.0),
                  topStart: Radius.circular(10.0),
                )),
            child: Text('${message.text}')),
      );

  Widget buildMyMessage(MessageModel message) => Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            decoration: BoxDecoration(
                color: Colors.teal[400],
                borderRadius: BorderRadiusDirectional.only(
                  bottomStart: Radius.circular(10.0),
                  topEnd: Radius.circular(10.0),
                  topStart: Radius.circular(10.0),
                )),
            child: Text('${message.text}')),
      );
}

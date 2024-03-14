import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/components/reusable.dart';
import 'package:socialapp/cubit/SocialGeneralCubit.dart';
import 'package:socialapp/cubit/SocialGeneralStates.dart';
import 'package:socialapp/models/userModel.dart';
import 'package:socialapp/screens/chatDetails.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: SocialCubit.get(context).users.isNotEmpty,
            builder: (context) => ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildChatItem(
                    SocialCubit.get(context).users[index], context),
                separatorBuilder: (context, index) => const Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                itemCount: SocialCubit.get(context).users.length),
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        });
  }

  Widget buildChatItem(userModel model, context) => InkWell(
        onTap: () {
          navigatTo(
              context,
              ChatDetils(
                model: model,
              ));
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage('${model.img}'),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                '${model.name}',
                style: const TextStyle(fontSize: 19, height: 1.4),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
      );
}

import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 20.0,
          margin: EdgeInsets.all(5),
          child: Stack(alignment: AlignmentDirectional.bottomEnd, children: [
            Image(
              image: NetworkImage(
                  'https://img.freepik.com/free-photo/close-up-young-happy-family-spending-time-together_329181-15884.jpg?w=826&t=st=1708565798~exp=1708566398~hmac=95591f4a7c00087def860ec1f33e418ff097c997492f23ba671326cb13501287'),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
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
        Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 20.0,
          margin: EdgeInsets.all(5),
          child: Column(
            children: [],
          ),
        ),
      ],
    );
  }
}

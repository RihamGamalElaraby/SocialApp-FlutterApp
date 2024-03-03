import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 180,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://img.freepik.com/free-photo/close-up-young-happy-family-spending-time-together_329181-15884.jpg?w=826&t=st=1708565798~exp=1708566398~hmac=95591f4a7c00087def860ec1f33e418ff097c997492f23ba671326cb13501287'),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 65.0,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 60.0,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-photo/woman-beach-with-her-baby-enjoying-sunset_52683-144131.jpg?w=826&t=st=1709139774~exp=1709140374~hmac=8d5b19c1146e6ef66276e03ff36a3f0012ab93b8c465e41cc3473cbc0cdc723e'),
                  ),
                ),
              ],
            ),
          ),
          Text(
            'Reham Elaraby',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            'Bio',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          )
, ],
      ),
    );
  }
}

import 'package:flutter/material.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      //   actions: [
      //     InkWell(
      //       onTap: () {
      //         Navigator.pop(
      //           context,
      //           MaterialPageRoute(builder: (context) => MainScreen()),
      //         );
      //       },
      //       child: const Text('متابعة ', style: TextStyle(color: Colors.white)),
      //     ),
      //   ],
      // ),
      body: Center(
        child: Text('dwbfshjdvwuf'),
      ),
    );
  }
}

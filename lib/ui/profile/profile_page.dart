import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const route = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text('Profile'),
      actions: [
        IconButton(onPressed: (){}, icon: const Icon(Icons.settings))
      ],
    ));
  }
}

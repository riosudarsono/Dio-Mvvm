import 'package:dio_mvvm/ui/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const route = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Row(
              children: const [Text("data")],
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () { context.pushNamed(LoginPage.route);},
                icon: const Icon(Icons.logout),
                label: const Text("Logout")),
          )
        ],
      ),
    );
  }
}

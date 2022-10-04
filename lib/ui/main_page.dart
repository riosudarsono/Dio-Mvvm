import 'package:dio_mvvm/ui/main_vm.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainVM>.reactive(
        viewModelBuilder: () => MainVM(),
        builder: (context, viewModel, child) {
          return Scaffold(
            body: viewModel.getPages(),
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                )
              ],
              onTap: viewModel.onItemTapped,
              currentIndex: viewModel.selectedIndex,
            ),
          );
        });
  }
}

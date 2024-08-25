import 'package:eriell_test/presentation/screens/auth/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:eriell_test/presentation/screens/home/category_table.dart';
import 'package:eriell_test/presentation/screens/home/home.dart';
import 'package:eriell_test/presentation/screens/home/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  String pageTitle = 'Dashboard';
  String appBarImage = '';

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      // Determine the current page based on the selected index
      Widget currentPage = const HomeScreen();

      if (_selectedPageIndex == 0) {
        currentPage = const HomeScreen();
        pageTitle = 'Dashboard';
        appBarImage = 'assets/images/activity.png';
      }
      if (_selectedPageIndex == 1) {
        currentPage = const ProfileScreen();
        pageTitle = 'Profile';
        appBarImage = 'assets/images/user.png';
      }

      bool isPortrait = orientation == Orientation.portrait;

      return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset(appBarImage, scale: 14),
              const SizedBox(width: 8),
              Text(
                pageTitle,
                style: const TextStyle(fontSize: 25),
              ),
            ],
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          actions: [
            pageTitle.contains('Profile')
                ? IconButton(
                    onPressed: () {
                      context.read<SignInBloc>().add(SignOutRequired());
                    },
                    icon: const Icon(CupertinoIcons.arrow_right_to_line),
                  )
                : IconButton(
                    icon: const Icon(CupertinoIcons.bolt_horizontal_circle),
                    onPressed: () {},
                  ),
            const SizedBox(width: 8),
          ],
        ),
        body: _selectedPageIndex == 0
            ? (isPortrait
                ? currentPage // Show full HomeScreen content in portrait mode
                : const CategoryTable()) // Show only table in landscape mode for HomeScreen
            : currentPage, // Show customized ProfileScreen based on orientation
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).colorScheme.primary,
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled),
              label: 'Profile',
            ),
          ],
        ),
      );
    });
  }
}

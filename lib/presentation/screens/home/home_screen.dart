import 'package:assignment_lufick/presentation/screens/home/profile_screen.dart';
import 'package:assignment_lufick/presentation/screens/home/user_feed_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  static const routeName = "home";
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex=0;
  final List<Widget> myWidgets = [
    const UserFeedScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentIndex=value;
          });
        },
        items:const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_fill),label: 'Profile'),

        ]
        ),
        body: myWidgets[currentIndex],
    );
  }
}

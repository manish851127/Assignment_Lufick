import 'package:assignment_lufick/presentation/screens/home/profile_screen.dart';
import 'package:assignment_lufick/presentation/screens/home/user_feed_screen.dart';
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
    ColorScheme mycolor= Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle: TextStyle(color: Colors.black,fontSize: 14),
        fixedColor: mycolor.onPrimary,
        onTap: (value) {
          setState(() {
            currentIndex=value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person,color: mycolor.onPrimary,),label: 'Profile'),

        ]
        ),
        body: myWidgets[currentIndex],
    );
  }
}

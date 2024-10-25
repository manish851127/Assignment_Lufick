import 'dart:async';

import 'package:assignment_lufick/presentation/screens/auth/login_screen.dart';
import 'package:assignment_lufick/presentation/screens/home/home_screen.dart';
import 'package:assignment_lufick/user_cubit/user_cubit.dart';
import 'package:assignment_lufick/user_cubit/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
  static const routeName='spash';
}

class _SplashScreenState extends State<SplashScreen> {
  
  void goToNextScreen(){
    UserState userState= BlocProvider.of<UserCubit>(context).state;
    if (userState is UserLoggedInState) {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    } else if (userState is UserLoggedOutState) {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    } else if (userState is UserErrorState) {
      Navigator.popUntil(context, (value) => value.isFirst);
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    }
  }
  
  @override
  void initState() {
   Timer(Duration(milliseconds: 1000), (){
      goToNextScreen();
   });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.greenAccent,
          child: Text('Welcome to Our App....',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),))
      ),
    );
  }
}
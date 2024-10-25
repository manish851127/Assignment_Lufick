import 'package:assignment_lufick/presentation/screens/auth/login_screen.dart';
import 'package:assignment_lufick/presentation/screens/auth/signup_screen.dart';
import 'package:assignment_lufick/presentation/screens/home/home_screen.dart';
import 'package:assignment_lufick/presentation/screens/home/profile_screen.dart';
import 'package:assignment_lufick/presentation/screens/home/user_feed_screen.dart';
import 'package:assignment_lufick/presentation/screens/other/expense_details_page.dart';
import 'package:assignment_lufick/presentation/screens/splash/spash_screen.dart';
import 'package:flutter/cupertino.dart';

class Routes{
  static Route? onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case UserFeedScreen.routeName:return CupertinoPageRoute(
        builder: (context)=> const UserFeedScreen() );

      case HomeScreen.routeName:return CupertinoPageRoute(
        builder: (context)=> const HomeScreen() );

      case ProfileScreen.routeName:return CupertinoPageRoute(
        builder: (context)=> const ProfileScreen() );  

      case LoginScreen.routeName:return CupertinoPageRoute(
        builder: (context)=> const LoginScreen() );  

      case SpashScreen.routeName:return CupertinoPageRoute(
        builder: (context)=> const SpashScreen() );  

      case SignUpScreen.routeName:return CupertinoPageRoute(
        builder: (context)=> const SignUpScreen() );
 
      case ExpenseDetailsPage.routeName:
        final args = settings.arguments as Map<String, dynamic>;
        final String title = args['title'];   // Extract 'name'
        final int expense = args['expense']; 
       return CupertinoPageRoute(
        builder: (context)=> ExpenseDetailsPage(expense: expense, title: title,));

        
        default: return null;
    }
  }
}
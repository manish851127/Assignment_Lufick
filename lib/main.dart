import 'package:assignment_lufick/core/dart_theme.dart';
import 'package:assignment_lufick/core/light_theme.dart';
import 'package:assignment_lufick/core/routes.dart';
import 'package:assignment_lufick/presentation/screens/auth/login_screen.dart';
import 'package:assignment_lufick/presentation/screens/home/home_screen.dart';
import 'package:assignment_lufick/presentation/screens/splash/slpash_screen.dart';
import 'package:assignment_lufick/user_cubit/user_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>  UserCubit())
      ],
      
      child: MaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,      
        onGenerateRoute: Routes.onGenerateRoute,
        initialRoute: SplashScreen.routeName,   
      ),
    );
  }
}


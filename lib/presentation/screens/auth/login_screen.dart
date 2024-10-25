import 'package:assignment_lufick/presentation/screens/auth/signup_screen.dart';
import 'package:assignment_lufick/presentation/screens/home/home_screen.dart';
import 'package:assignment_lufick/presentation/widgets/link_button.dart';
import 'package:assignment_lufick/presentation/widgets/primary_button.dart';
import 'package:assignment_lufick/presentation/widgets/space_widget.dart';
import 'package:assignment_lufick/user_cubit/user_cubit.dart';
import 'package:assignment_lufick/user_cubit/user_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/primary_textfield.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
   static const routeName="login";
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();
  final _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
   
    return  BlocConsumer<UserCubit,UserState>(
      listener: (context,state) {
          if(state is UserLoggedInState) {
            // Navigate to the home page on successful login
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          } else if (state is UserErrorState) {
            // Optionally, show an error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
            }
      },
      builder: (context, state) {
       return  Scaffold(
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    const Text(
                      'Log In',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 38,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                    const Space(),
                    PrimaryTextfield(
                      labelText: "Email Address",
                      textEditingController:_emailController ,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Email address is required";
                        }
                        if (!EmailValidator.validate(value)) {
                          return "Invalid Email";
                        }
                        return null;
                      },
                    ),
                    const Space(),
                    PrimaryTextfield(
                      validator: (value) {
                        
                        if (value == null || value.trim().isEmpty) {
                          return "Password is required";
                        }
                        return null;
                      },
                      obscureText: true,
                      labelText: "Password",
                      textEditingController: _passwordController ,
                    ),
                    const Space(
                      size: -5.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        LinkButton(
                          buttonName: "Forget Password",
                          function: () {},
                        )
                      ],
                    ),
                    const Space(),
                    PrimaryButton(
                        buttonName: "Log in",
                      function: (){
                        if(_formKey.currentState!.validate()){
                              String email=_emailController.text.trim();
                              String password=_passwordController.text.trim();
                              context.read<UserCubit>().signInUserEmailAndPassword(email, password);
                         }
                      }
                     ),
                    const Space(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Dont't have a account? ",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                        ),
                        LinkButton(
                          buttonName: "Sign Up",
                          function: () {
                            Navigator.pushNamed(context, SignUpScreen.routeName);
                          },
                        )
                      ],
                    ),
                                    const Space(),
                     PrimaryButton(
                      function: (){
                        context.read<UserCubit>().signInWithGoogle(); // Call sign-in method
                      },
                      buttonName: 'Log In using google')
                  ],
                ),
              ),
            )),
          );
      },
          
      
    );
  
  }
}

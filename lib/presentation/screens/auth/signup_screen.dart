

import 'package:assignment_lufick/presentation/screens/auth/login_screen.dart';
import 'package:assignment_lufick/presentation/screens/home/home_screen.dart';
import 'package:assignment_lufick/presentation/widgets/link_button.dart';
import 'package:assignment_lufick/presentation/widgets/primary_button.dart';
import 'package:assignment_lufick/presentation/widgets/primary_textfield.dart';
import 'package:assignment_lufick/presentation/widgets/space_widget.dart';
import 'package:assignment_lufick/user_cubit/user_cubit.dart';
import 'package:assignment_lufick/user_cubit/user_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String routeName="signUp";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
final _emailController=TextEditingController() ;
final _passwordController=TextEditingController() ;
final _rPasswordController=TextEditingController() ;


final _formKey= GlobalKey<FormState>();

final instance=FirebaseAuth.instance;



  @override
  Widget build(BuildContext context) {
    return  Builder(
      builder: (context) {
        return BlocConsumer<UserCubit,UserState>(
          listener: (context, state) {
            if (state is UserLoadingState) {
              // Show a loading indicator
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is UserLoggedInState) {
              // Hide loading and navigate to another page, like login or home
              Navigator.pop(context);  // Close the loading dialog
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Registration successful!")),
              );
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);  // Redirect to login page
            } else if (state is UserErrorState) {
              // Hide loading and show error message
              Navigator.pop(context);  // Close the loading dialog
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },

          builder: (context,state) {
            
            return Scaffold(
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                    children: [
                    
                    const  Text('Sign Up',textAlign:TextAlign.center, style: TextStyle(
                        fontSize: 38,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold
                      ),),
                    
                     const Space(),
                  
                     SizedBox(height: 5,),
                    
                     PrimaryTextfield(
                      labelText: "Email Address", 
                      textEditingController: _emailController,
                      validator: (value) {
                        if(value == null || value.trim().isEmpty){
                          return "Email address is required";
                        }
                        if(!EmailValidator.validate(value)){
                          return "Invalid Email";
                        }
                        return null;
                      },
                      ),
                    
                     const Space(),
                    
                     PrimaryTextfield(
                      validator: (value) {
                        if(value == null || value.trim().isEmpty){
                          return "Password is required";
                        }
                        return null;
                      },
                      obscureText: true,
                      labelText: "Password", 
                      textEditingController:_passwordController ,
                      ),
                            
                       const Space(),
                    
                     PrimaryTextfield(
                      validator: (value) {
                        if(value == null || value.trim().isEmpty){
                          return "Password is required";
                        }
                        return null;
                      },
                      obscureText: true,
                      labelText: "Re-enter Password", 
                      textEditingController:_rPasswordController ,
                      ),
                    
                     const Space(size: -5.0,),
                    
                    PrimaryButton(
                      buttonName: "Create Account",
                      function: (){
                        if(_formKey.currentState!.validate()){


                        String email=_emailController.text.trim();
                        String password=_passwordController.text.trim();
                        context.read<UserCubit>().registerUser(email, password);
                        }
                            
                      }),
                    
                     const Space(),
                     
                    
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       const  Text("Already have an account? ", style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold
                      ),),
                      LinkButton(buttonName: "Sign In",function: (){
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      },)
                     ],
                     ),
                    
                    ],
                          ),
                  ),
                ),
              );
          }
        );
      }
    );
  }
}
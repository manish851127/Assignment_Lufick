import 'package:assignment_lufick/core/ui.dart';
import 'package:assignment_lufick/presentation/widgets/space_widget.dart';
import 'package:assignment_lufick/user_cubit/user_cubit.dart';
import 'package:assignment_lufick/user_cubit/user_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
  static const routeName = "profile";
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      final userCubit = context.read<UserCubit>(); // Access the UserCubit
      return Scaffold(
        appBar: AppBar(
          title: const Text('My Profile',style: TextStyle(fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
             const Row(
              children: [
                 Text(
                  'Welcome',
                  style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.grey),
                  ),
                  Space(),
                
              ],),

              Column(children: [
                Text(
                  '${userCubit.userCredential!.user!.displayName }',
                  style: TextStyles.heading1,
                  ),
              Text(
                  '${userCubit.userCredential!.user!.email }',
                  style: TextStyles.body1,
                  ),
                  Space(),
               ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network('${userCubit.userCredential!.user!.photoURL}'),
               )
              ],),
              
            ],
          ),
        ),
      );
    });
  }
}

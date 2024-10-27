import 'package:assignment_lufick/presentation/screens/auth/login_screen.dart';
import 'package:assignment_lufick/presentation/widgets/space_widget.dart';
import 'package:assignment_lufick/logic/cubit/user_cubit/user_cubit.dart';
import 'package:assignment_lufick/logic/cubit/user_cubit/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
  static const routeName = "profile";
}

class _ProfileScreenState extends State<ProfileScreen> {
  final nameController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      if (state is UserLoggedInState) {
        final user = state.user; // Get the user from the state
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'My Profile',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    context.read<UserCubit>().signOut();
                    // Optional: Navigate to login screen if you wish
                    Navigator.pushReplacementNamed(
                        context, LoginScreen.routeName);
                  },
                  icon:const Icon(Icons.logout_outlined)),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    Space(),
                  ],
                ),
                Column(
                  children: [

                    Text(
                      user.displayName ?? 'no data found',
                      style: const TextStyle(
                          fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      user.email ?? 'No Email',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal),
                    ),
                    const Space(),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: user.photoURL != null
                          ? Image.network(user.photoURL!)
                          : const Icon(
                              Icons.account_circle,
                              size: 100,
                              color: Colors.grey,
                            ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      } else {
        // Handle loading or error states if needed
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}

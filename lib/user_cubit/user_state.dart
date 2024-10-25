import 'package:firebase_auth/firebase_auth.dart';

abstract class UserState {
  
}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoggedInState extends UserState {
  final User user;

  UserLoggedInState(this.user);
}

class UserLoggedOutState extends UserState {}

class UserErrorState extends UserState {
  final String error;
  UserErrorState(this.error);
}

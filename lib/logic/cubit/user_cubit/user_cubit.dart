import 'package:assignment_lufick/logic/cubit/user_cubit/user_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserCredential? userCredential;
  UserCubit() : super(UserInitialState()){
        _checkUserStatus();
  }


  // Check initial auth status and emit corresponding state
  Future<void> _checkUserStatus() async {
    final User? user = _auth.currentUser;
    if (user != null) {
      emit(UserLoggedInState(user));
    } else {
      emit(UserLoggedOutState());
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      emit(UserLoadingState());
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      userCredential = await _auth.signInWithCredential(credential);

      print(userCredential!.user!.displayName);
      
      emit(UserLoggedInState(userCredential!.user!));
    } on FirebaseAuthException catch (e) {
      emit(UserErrorState("Firebase Auth error: ${e.message}"));
    } catch (e) {
      emit(UserErrorState("An unknown error occurred: $e"));
    }
  }


  void signInUserEmailAndPassword(String email, String password) async{
     try{
      emit(UserLoadingState());
       await _auth.signInWithEmailAndPassword(email: email, password: password);
       emit(UserLoggedInState(_auth.currentUser!));
     }
     catch(e){
      emit(UserErrorState("Error: $e"));
     }
  }
  
  
  void registerUser(String email, String password) async{
     try{
      emit(UserLoadingState());
       await _auth.createUserWithEmailAndPassword(email: email, password: password);
       emit(UserLoggedInState(_auth.currentUser!));
     }
     catch(e){
      emit(UserErrorState("Some error found"));
     }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await GoogleSignIn().signOut();
    emit(UserLoggedOutState());
  }
}

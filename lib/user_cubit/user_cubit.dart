import 'package:assignment_lufick/user_cubit/user_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserCredential? userCredential;
  UserCubit() : super(UserInitialState());

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
    emit(UserLoggedOutState());
  }
}

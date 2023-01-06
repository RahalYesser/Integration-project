import 'package:firebase_auth/firebase_auth.dart';
import '/core/firebase/firebase_service.dart';
import '/features/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class UserDataSource {
  Future<UserCredential> registerUser(UserModel userModel);
  Future<UserCredential> signInUser(UserModel userModel);
  Future<void> signOutUser();
  Future<void>? updateUserName(String userName);
}

class UserDataSourceImpl implements UserDataSource {
  final FirebaseService firebaseService;
  final db = FirebaseFirestore.instance;




  Future<void> createUser(UserCredential credential, UserModel user) async {
  await db.collection('users').doc(firebaseService.getAuth().currentUser?.uid).set({
    "uid": credential.user?.uid,
    "name": user.name,
    "email": user.email,
    "password":user.password
  });
}


  UserDataSourceImpl({required this.firebaseService});
  @override

  Future<UserCredential> registerUser(UserModel userModel) {
  return firebaseService.getAuth().createUserWithEmailAndPassword(
      email: userModel.email, password: userModel.password).then((credential) {
    createUser(credential, userModel);
    return credential;
  });

}

  @override
  Future<UserCredential> signInUser(UserModel userModel) {
    return firebaseService.getAuth().signInWithEmailAndPassword(
        email: userModel.email, password: userModel.password);
  }

  @override
  Future<void> signOutUser() {
    return firebaseService.getAuth().signOut();
  }

  @override
  Future<void>? updateUserName(String userName) {
    return firebaseService.getAuth().currentUser?.updateDisplayName(userName);
  }




}

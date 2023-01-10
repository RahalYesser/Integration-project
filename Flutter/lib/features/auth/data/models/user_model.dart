import 'package:firebase_auth/firebase_auth.dart';
import '/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {String? uid,
      required String name,
      required String email,
      required String password})
      : super(
            uid: uid,
            name: name,
            email: email,
            password: password);




  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        uid: json['uid'],
        name: json['name'],
        email: json['email'],
        password: json['password']);
  }

  
  Map<String, dynamic> toMap() {
  return {
    'uid': uid,
    'name': name,
    'email': email,
    'password': password,
  };
}
factory UserModel.fromMap(Map<String, dynamic> map) {
  return UserModel(
    uid: map['uid'],
    name: map['name'],
    email: map['email'],
    password: map['password']
  );
}


  factory UserModel.fromFirebaseAuth(User user) {
    return UserModel(
        uid: user.uid,
        name: user.displayName!,
        email: user.email!,
        password: "");
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'password': password
    };
  }
}


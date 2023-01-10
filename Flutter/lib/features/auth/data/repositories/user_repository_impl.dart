import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '/core/failures/auth_failures.dart';
import '/core/failures/failures.dart';
import '/core/network/network_info.dart';
import '/features/auth/data/datasources/user_data_source.dart';
import '/features/auth/data/models/user_model.dart';
import '/features/auth/domain/entities/user_entity.dart';
import '/features/auth/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource userDataSource;
  final NetwortkInfo networkInfo;
  

  UserRepositoryImpl({required this.userDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, Unit>> registerUser(UserEntity user) async {
    UserModel userModel = UserModel(
        uid: user.uid,
        name: user.name,
        email: user.email,
        password: user.password);

    if (await networkInfo.isConnected) {
      try {
        final credential = await userDataSource.registerUser(userModel);
        
        return Right(unit);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          return Left(RegisterUserWeakPwdFailure());
        } else if (e.code == 'email-already-in-use') {
          return Left(RegisterUserUsedEmailFailure());
        } else {
          return Left(RegisterUserFailure());
        }
      } catch (e) {
        return Left(RegisterUserFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> signIn(UserEntity user) async {
    UserModel userModel = UserModel(
        uid: user.uid,
        name: user.name,
        email: user.email,
        password: user.password);

    if (await networkInfo.isConnected) {
      try {
        final credential = await userDataSource.signInUser(userModel);
        return Right(unit);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          return Left(SignInUserNotFoundFailure());
        } else if (e.code == 'wrong-password') {
          return Left(SignInWrongPwdFailure());
        } else {
          return Left(SignInFailure());
        }
      } catch (e) {
        return Left(SignInFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    if (await networkInfo.isConnected) {
      await FirebaseAuth.instance.signOut();
      print("signoout");
      return Right(unit);
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateUser(UserEntity user) async {
    UserModel userModel = UserModel(
        uid: user.uid,
        name: user.name,
        email: user.email,
        
        password: user.password);
    if (await networkInfo.isConnected) {
      await FirebaseAuth.instance.currentUser
          ?.updateDisplayName(userModel.name);
      await FirebaseAuth.instance.currentUser?.updateEmail(userModel.email);
      
      return Right(unit);
    } else {
      return Left(OfflineFailure());
    }
  }


}



import 'package:dartz/dartz.dart';
import '/core/failures/failures.dart';
import '/features/auth/domain/entities/user_entity.dart';
import '/features/auth/domain/repositories/user_repository.dart';

class SignInUserUseCase {
  final UserRepository userRepository;

  SignInUserUseCase(this.userRepository);

  Future<Either<Failure, Unit>> call(UserEntity user) async {
    return await userRepository.signIn(user);
  }
}

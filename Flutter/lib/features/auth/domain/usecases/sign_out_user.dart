import 'package:dartz/dartz.dart';
import '/core/failures/failures.dart';
import '/features/auth/domain/repositories/user_repository.dart';

class SignOutUserUseCase {
  final UserRepository userRepository;

  SignOutUserUseCase(this.userRepository);

  Future<Either<Failure, Unit>> call() async {
    return await userRepository.signOut();
  }
}

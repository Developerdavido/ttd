

import 'package:test_driven_development/core/usecases/usecase.dart';
import 'package:test_driven_development/core/utils/typedef.dart';
import 'package:test_driven_development/src/authentication/domain/repositories/authentication_repository.dart';

import '../entities/user.dart';

class FetchUsers extends UseCaseWithoutParams<List<User>> {
  const FetchUsers(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<List<User>> call() async => _repository.getUsers();

}


import 'package:test_driven_development/core/usecases/usecase.dart';
import 'package:test_driven_development/core/utils/typedef.dart';
import 'package:test_driven_development/src/authentication/domain/repositories/authentication_repository.dart';

import '../entities/user.dart';

class GetUser extends UseCaseWithParams<User, int> {

  final AuthenticationRepository _repository;

  const GetUser(this._repository);
  @override
  ResultFuture<User> call(int params) async => _repository.getUserById(id: params);

}
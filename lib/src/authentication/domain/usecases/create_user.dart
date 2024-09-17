import 'package:equatable/equatable.dart';
import 'package:test_driven_development/core/usecases/usecase.dart';
import 'package:test_driven_development/src/authentication/domain/repositories/authentication_repository.dart';

import '../../../../core/utils/typedef.dart';


/// Since we are likely to have different usecases that will either return a particular type, we can create a usecase folder in core
/// that will hold on the particular usecase function types. In situations where we may have multiple types being returned, we can create a 
/// [typedef] for those parameters
class CreateUser extends UseCaseWithParams<void, CreateUserParams>{
  final AuthenticationRepository _repository;

  const CreateUser(this._repository);


  @override
  ResultVoid call(params) async => _repository.createUser(name: params.name, createdAt: params.createdAt, avatar: params.avatar);
}


//create the params needed for this create user usecase to function properly using the abstract class
class CreateUserParams extends Equatable {
  final String createdAt;
  final String name;
  final String avatar;

  const CreateUserParams({
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  const CreateUserParams.empty() :
      this(createdAt: '_empty.createdAt', name: '_empty.name', avatar: '_empty.avatar');

  @override
  // TODO: implement props
  List<Object?> get props => [createdAt, name, avatar];

}

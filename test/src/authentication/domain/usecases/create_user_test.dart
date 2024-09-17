import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_driven_development/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:test_driven_development/src/authentication/domain/usecases/create_user.dart';

import 'authentication_repository.mock.dart';

/// when unit testing the usecases, three questions must be answered
/// 1. What does the class depend on
/// answer: --  Authentication repository
/// 2. How can we create a fake version of the dependency
/// anser: --  Use mocktail
/// 3. How do we control what our dependencies do
/// Answer -- Using mocktail apis



void main() {
  late CreateUser usecase;
  late AuthenticationRepository repository;


  setUp(() {
    repository = MockAuthenticationRepository();
    usecase = CreateUser(repository);
  });

  const params = CreateUserParams.empty();

  test("Should call the [AuthenticationRepository.createUser]", () async {
    ///when writing tests, we follow three main steps});
    //Arrange
    when(() => repository.createUser(name: any(named: 'name'), createdAt: any(named: 'createdAt'), avatar: any(named: 'avatar')))
        .thenAnswer((_) async => const Right(null));
    //Act
    final result = await usecase(params);
    //Assert === this is to make sure that the top use case was called
    expect(result, equals(const Right<dynamic, void>(null)));
    ///How do we know that the call was made to ensure that the usecase really called the repository
    verify(()=> repository.createUser(name: params.name, createdAt: params.createdAt, avatar: params.avatar)).called(1);
    ///verify that there was no more calls with the repository again
    verifyNoMoreInteractions(repository);
  });
}

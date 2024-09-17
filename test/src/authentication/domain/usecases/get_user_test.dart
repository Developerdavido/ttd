



import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_driven_development/src/authentication/domain/entities/user.dart';
import 'package:test_driven_development/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:test_driven_development/src/authentication/domain/usecases/get_user.dart';

import 'authentication_repository.mock.dart';

void main() {
  late GetUser usecase;
  late AuthenticationRepository repository;


  setUp(() {
    repository = MockAuthenticationRepository();
    usecase = GetUser(repository);
  });

  const tResponse = User.empty();
  const param = 1;
  test("Should call the [AuthenticationRepository.getUser]", () async {
    //Arrange
    when(()=> repository.getUserById(id: any(named: 'id'))).thenAnswer((_) async => const Right(tResponse));
    final result = await usecase(param);
    //Assert
    expect(result, equals(const Right<dynamic, User>(tResponse)));
    //verify
    verify(()=> repository.getUserById(id: param)).called(1);
    //check that no more response was made
    verifyNoMoreInteractions(repository);
  });
}
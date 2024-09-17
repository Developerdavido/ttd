

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_driven_development/src/authentication/domain/entities/user.dart';
import 'package:test_driven_development/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:test_driven_development/src/authentication/domain/usecases/fetch_users.dart';

import 'authentication_repository.mock.dart';


  void main() {
    late AuthenticationRepository repository;
    late FetchUsers usecase;

    //this will setup our variables needed to carry out this test once for each test case
    setUp(() {
      repository = MockAuthenticationRepository();
      usecase = FetchUsers(repository);
    });

    const testResponse = [User.empty()];

    //Now lets create the test to check if the api call is made during fetch users
    test("Should call the [Authentication.fetchUsers] and return [List<User>]", () async {
      //Arrange
      when(()=> repository.getUsers()).thenAnswer((_) async => const Right(testResponse));
      //Act
      final result = await usecase();
      //Assert
      expect(result, equals(const Right<dynamic, List<User>>(testResponse)));
      //check that the call was made only once to the repository
      verify(()=> repository.getUsers()).called(1);
      //verify that not other interaction have veen made
      verifyNoMoreInteractions(repository);
    });
  }

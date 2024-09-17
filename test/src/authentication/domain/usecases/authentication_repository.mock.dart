

//this creates a mock of the dependency our class is dependent on. so it creates a mock object of the dependent repository
import 'package:mocktail/mocktail.dart';
import 'package:test_driven_development/core/utils/typedef.dart';
import 'package:test_driven_development/src/authentication/domain/entities/user.dart';
import 'package:test_driven_development/src/authentication/domain/repositories/authentication_repository.dart';

class MockAuthenticationRepository extends Mock implements AuthenticationRepository {}
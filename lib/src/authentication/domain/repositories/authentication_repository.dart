
//this serves as an interface or a contract layer that shows the different functions that are attributed to the class

import 'package:dartz/dartz.dart';
import 'package:test_driven_development/core/errors/failure.dart';
import 'package:test_driven_development/core/utils/typedef.dart';

import '../entities/user.dart';


abstract class AuthenticationRepository{
  const AuthenticationRepository();

  ///create user contract
  ///Here we use loose coupling to ensure that in the event that a change is made in the failure contract, we do not have to make any change
  ResultVoid createUser({required String name, required String createdAt, required String avatar});


  //create get users contract
 ResultFuture<List<User>> getUsers();

  //get user by id
  ResultFuture<User> getUserById({required int id});
}
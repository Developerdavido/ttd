

import 'package:dartz/dartz.dart';
import '../../src/authentication/domain/entities/user.dart';
import '../errors/failure.dart';


///[typedef] allows for the type definition :) creating types that will be consistent throughout the app
///it allows the creation of generic types
typedef ResultFuture<T> =  Future<Either<Failure, T>>;

typedef ResultVoid = ResultFuture<void>;

typedef DataMap = Map<String, dynamic>;


import 'dart:convert';

import 'package:test_driven_development/core/utils/typedef.dart';
import 'package:test_driven_development/src/authentication/domain/entities/user.dart';

class UserModel extends User {
  const UserModel(
      {required super.id,
      required super.createdAt,
      required super.name,
      required super.avatar});

  //create a usermodel object from the api source
  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source) as DataMap);

  //this is the assignment to a usermodel object from the map
  UserModel.fromMap(DataMap map)
      : this(
            id: map['id'] as int,
            name: map['name'] as String,
            createdAt: map['createdAt'] as String,
            avatar: map['avatar'] as String);

  //get the toJson String
  String toJson() => jsonEncode(toMap());

  //assign the data  to a data map
  DataMap toMap() => {'id': id, 'name': name, 'createdAt': createdAt, 'avatar': avatar};

  ///copywith allows the creation of a new object from the class with new values
  UserModel copywith({
    String? avatar,
    int? id,
    String? createdAt,
    String? name,
  }) {
    return UserModel(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name,
        avatar: avatar ?? this.avatar);
  }
}

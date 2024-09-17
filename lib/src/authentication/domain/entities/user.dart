import 'package:equatable/equatable.dart';

///this is the entity needed for this feature
class User extends Equatable {
  final int id;
  final String createdAt;
  final String name;
  final String avatar;

  const User(
      {required this.id,
      required this.createdAt,
      required this.name,
      required this.avatar});

  const User.empty()
      : this(
            id: 1,
            createdAt: '_empty.createdAt',
            name: '_empty.name',
            avatar: '_empty.avatar');

  @override
  // TODO: implement props
  //it gets a list of props that can be used for the equality check
  List<Object?> get props => [id];
}

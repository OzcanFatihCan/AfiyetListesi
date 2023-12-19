// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable {
  const MyUserEntity({
    required this.id,
    required this.email,
    required this.name,
    this.picture,
  });

  final String id;
  final String email;
  final String name;
  final String? picture;

  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'picture': picture,
    };
  }

  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
        id: doc['id'] as String,
        email: doc['email'] as String,
        name: doc['name'] as String,
        picture: doc['picture'] as String?);
  }

  @override
  List<Object?> get props => [id, email, name, picture];

  @override
  String toString() {
    return '''UserEntity: {
      id: $id
      email: $email
      name: $name
      picture: $picture
    }''';
  }
}

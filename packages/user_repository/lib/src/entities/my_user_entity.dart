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

  @override
  List<Object?> get props => [id, email, name, picture];
}

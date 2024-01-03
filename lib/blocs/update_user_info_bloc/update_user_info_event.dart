part of 'update_user_info_bloc.dart';

abstract class UpdateUserInfoEvent extends Equatable {
  const UpdateUserInfoEvent();

  @override
  List<Object> get props => [];
}

class UploadPicture extends UpdateUserInfoEvent {
  const UploadPicture(this.file, this.userId);
  final String file;
  final String userId;

  @override
  List<Object> get props => [file, userId];
}

class UpdateUserData extends UpdateUserInfoEvent {
  const UpdateUserData(this.name, this.userId);
  final String name;
  final String userId;

  @override
  List<Object> get props => [name, userId];
}

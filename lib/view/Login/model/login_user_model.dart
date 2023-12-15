class UserModel {
  String? userName;
  String? userEmail;
  String? userPasw;
  String? userPhoto;

  UserModel({this.userName, this.userEmail, this.userPasw, this.userPhoto});

  UserModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    userEmail = json['userEmail'];
    userPasw = json['userPasw'];
    userPhoto = json['userPhoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['userEmail'] = userEmail;
    data['userPasw'] = userPasw;
    data['userPhoto'] = userPhoto;
    return data;
  }
}

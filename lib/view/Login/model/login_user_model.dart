class LoginUserModel {
  String? userId;
  String? userName;
  String? userEmail;
  String? userPasw;
  String? userPhoto;

  LoginUserModel(
      {this.userId,
      this.userName,
      this.userEmail,
      this.userPasw,
      this.userPhoto});

  LoginUserModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userName = json['userName'];
    userEmail = json['userEmail'];
    userPasw = json['userPasw'];
    userPhoto = json['userPhoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['userName'] = userName;
    data['userEmail'] = userEmail;
    data['userPasw'] = userPasw;
    data['userPhoto'] = userPhoto;
    return data;
  }
}

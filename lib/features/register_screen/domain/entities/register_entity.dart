class RegisterEntity {
  bool? status;
  int? resultCode;

  RegisterEntity({this.status, this.resultCode});

  RegisterEntity.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    resultCode = json['resultCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['resultCode'] = this.resultCode;
    return data;
  }
}

// class RegisterEntity {
//   UserEntity? user;
//   String? token;
//
//   RegisterEntity({ this.user, this.token});
//
//   RegisterEntity.fromJson(Map<String, dynamic> json) {
//     user = json['user'] != null ? new UserEntity.fromJson(json['user']) : null;
//     token = json['token'];
//   }
//
// }
//
// class UserEntity {
//   String? name;
//   String? email;
//
//   UserEntity({this.name, this.email});
//
//   UserEntity.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     email = json['email'];
//   }
//
//
// }

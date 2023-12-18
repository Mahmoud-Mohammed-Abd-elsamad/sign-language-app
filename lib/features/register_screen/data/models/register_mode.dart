import 'package:sigin_lang_app/features/register_screen/domain/entities/register_entity.dart';

class RegisterModel extends RegisterEntity {
  String? message;

  RegisterModel({super.status, super.resultCode, this.message});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    resultCode = json['resultCode'];
    message = json['message'];
  }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['status'] = this.status;
//   data['resultCode'] = this.resultCode;
//   data['message'] = this.message;
//   return data;
// }
}

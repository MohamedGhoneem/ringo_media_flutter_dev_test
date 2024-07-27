import 'package:app_fundamentals/app_fundamentals.dart';
class SuccessModel implements BaseModel {
  bool? success;
  String? message;

  SuccessModel({this.success, this.message});

  SuccessModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    return data;
  }

}

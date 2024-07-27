import 'user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    super.userId,
    super.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json['userId'] as String?,
        name: json['name'] as String?,


  );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'userId': userId,
        'name': name,
      };
}

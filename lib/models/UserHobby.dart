import 'package:plg_test/models/User.dart';
import 'package:plg_test/models/Hobby.dart';

class UserHobby {
  final int id;
  final User user;
  final Hobby hobby;

  UserHobby({
    required this.id,
    required this.user,
    required this.hobby,
  });

  factory UserHobby.fromJson(Map<String, dynamic> json) {
    return UserHobby(
      id: json['id'],
      user: User.fromJson(json['user']),
      hobby: Hobby.fromJson(json['hobby']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user.toJson(),
      'hobby': hobby.toJson(),
    };
  }
}

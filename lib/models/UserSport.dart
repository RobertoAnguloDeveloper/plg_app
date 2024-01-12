import 'package:plg_test/models/User.dart';
import 'package:plg_test/models/Sport.dart';

class UserSport {
  final int id;
  final User user;
  final Sport sport;

  UserSport({
    required this.id,
    required this.user,
    required this.sport,
  });

  factory UserSport.fromJson(Map<String, dynamic> json) {
    return UserSport(
      id: json['id'],
      user: User.fromJson(json['user']),
      sport: Sport.fromJson(json['sport']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user.toJson(),
      'sport': sport.toJson(),
    };
  }
}


class User {
  final int id;
  final String username;
  final String password;
  final String email;

  User({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      password: json['password'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'email': email,
    };
  }
}

class UserRole {
  final int id;
  final String roleName;
  final String roleDescription;

  UserRole({
    required this.id,
    required this.roleName,
    required this.roleDescription,
  });

  // Factoría para crear un objeto UserRole desde un mapa JSON
  factory UserRole.fromJson(Map<String, dynamic> json) {
    return UserRole(
      id: json['id'],
      roleName: json['roleName'],
      roleDescription: json['roleDescription'],
    );
  }
}
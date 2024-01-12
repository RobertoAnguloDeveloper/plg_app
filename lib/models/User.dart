class User {
  final int id;
  final String username;
  final String password;
  final String email;
  final int role; // Permitir nulos ya que algunos usuarios no tienen un rol

  User({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    print("from Json");
    print(json);
    return User(
        id: json['userId'],
        username: json['username'],
        password: json['password'],
        email: json['email'],
        role: json['roleId']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'email': email,
      'role': role // Asegúrate de llamar a toJson() solo si el rol no es nulo
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

  factory UserRole.fromJson(Map<String, dynamic> json) {
    return UserRole(
      id: json['id'],
      roleName: json['roleName'],
      roleDescription: json['roleDescription'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'roleName': roleName,
      'roleDescription': roleDescription,
    };
  }
}

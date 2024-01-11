class Role {
  final int id;
  final String roleName;
  final String roleDescription;

  Role({
    required this.id,
    required this.roleName,
    required this.roleDescription,
  });

  // Factoría para crear un objeto Role desde un mapa JSON
  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'],
      roleName: json['roleName'],
      roleDescription: json['roleDescription'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'roleName': roleName,
      'roleDescription': roleDescription
    };
  }
}

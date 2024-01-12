class Hobby {
  final int id;
  final String hobbyName;

  Hobby({
    required this.id,
    required this.hobbyName,
  });

  factory Hobby.fromJson(Map<String, dynamic> json) {
    return Hobby(
      id: json['id'],
      hobbyName: json['hobbieName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'hobbieName': hobbyName,
    };
  }
}

class Sport {
  final int id;
  final String sportName;

  Sport({
    required this.id,
    required this.sportName,
  });

  factory Sport.fromJson(Map<String, dynamic> json) {
    return Sport(
      id: json['id'],
      sportName: json['sportName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sportName': sportName,
    };
  }
}

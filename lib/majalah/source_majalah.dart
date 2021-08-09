class SourceMajalah {
  final String id;
  final String name;

  SourceMajalah({required this.id, required this.name});

  factory SourceMajalah.fromJson(Map<String, dynamic> json) {
    return SourceMajalah(id: json['id'], name: json['name']);
  }
}

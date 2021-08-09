class TabloidSource {
  final String id;
  final String name;

  TabloidSource({required this.id, required this.name});

  factory TabloidSource.fromJson(Map<String, dynamic> json) {
    return TabloidSource(id: json['id'], name: json['name']);
  }
}


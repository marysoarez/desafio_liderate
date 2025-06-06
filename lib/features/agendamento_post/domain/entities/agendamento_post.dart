class AgendamentoPost {
  final String id;
  final String title;
  final String description;
  final DateTime dateTime;
  final List<String> imagePaths;

  AgendamentoPost({
    required this.id,
    required this.title,
    required this.description,
    required this.dateTime,
    this.imagePaths = const [],
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'dateTime': dateTime.toIso8601String(),
    'imagePaths': imagePaths,
  };

  factory AgendamentoPost.fromJson(Map<String, dynamic> json) => AgendamentoPost(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    dateTime: DateTime.parse(json['dateTime']),
    imagePaths: List<String>.from(json['imagePaths'] ?? []),
  );
}

class Note {
  final String? id;
  String title;
  String description; 
  String? folderId;

  Note({required this.title, required this.description, this.id, this.folderId});

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description
  };

  Note.fromJson(String noteId, Map<String, dynamic> json) : this(
    id: noteId,
    title: json['title']! as String,
    description: json['description']! as String,
  );
}
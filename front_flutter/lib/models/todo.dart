class Todo {
  final int id;
  final String title;
  final String description;
  final String image;

  Todo(
      {required this.id,
      required this.title,
      required this.description,
      required this.image});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        image: json['image']);
  }
}

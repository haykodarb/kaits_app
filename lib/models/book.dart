import 'dart:convert';

class Book {
  final int id;
  final int ownerId;
  final String author;
  final String title;
  final String editorial;
  final String language;
  final bool isAvailable;

  Book({
    required this.id,
    required this.ownerId,
    required this.author,
    required this.title,
    required this.editorial,
    required this.language,
    required this.isAvailable,
  });

  static List<Book> getListOfBooks(List<dynamic> payload) {
    return payload
        .map(
          (element) => Book(
            author: element['author'],
            editorial: element['editorial'],
            id: element['id'],
            isAvailable: element['isAvailable'] == 1,
            language: element['language'],
            ownerId: element['ownerId'],
            title: element['title'],
          ),
        )
        .toList();
  }

  @override
  String toString() {
    return jsonEncode({
      'author': author,
      'title': title,
      'editorial': editorial,
      'isAvailable': isAvailable,
      'id': id,
      'ownerId': ownerId,
      'language': language,
    });
  }
}

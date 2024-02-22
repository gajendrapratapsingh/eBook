import 'book_data.dart';

class Book {
  final String? name;
  final String? author;
  final String? coverImage;
  final double? rating;

  Book({this.author, this.coverImage, this.name, this.rating});

  static List<Book> get allBooks {
    return allBooks1;
  }
}

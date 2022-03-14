class Book {
  String title;
  String subtitle;
  String publisher;
  String publishedDate;
  String description;
  String? averageRating;
  String imageUrl;

  Book({
    required this.averageRating,
    required this.description,
    required this.imageUrl,
    required this.publishedDate,
    required this.publisher,
    required this.subtitle,
    required this.title,
  });

  factory Book.fromJson(Map json) {
    return Book(
      averageRating: json['volumeInfo']['averageRating'] == null
          ? 'Not Available'
          : json['volumeInfo']['averageRating'].toString(),
      description: json['volumeInfo']['description'] ?? 'No description',
      imageUrl: json['volumeInfo']['imageLinks']['thumbnail'] ??
          'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930',
      publishedDate: json['volumeInfo']['publishedDate'] ?? 'Not available',
      publisher: json['volumeInfo']['publisher'] ?? 'not available',
      subtitle: json['volumeInfo']['subtitle'] ?? 'not available',
      title: json['volumeInfo']['title'] ?? 'not available',
    );
  }
  // volumeInfo
}

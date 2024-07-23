class BookRequest {
  final int id; //ID 필드 추가
  final String title;
  final String author;
  final String translator;
  final String bookNumber;
  final double efficiency;
  final String status;
  final String library; // 도서관 정보 추가

  BookRequest({
    required this.id,
    required this.title,
    required this.author,
    required this.translator,
    required this.bookNumber,
    required this.efficiency,
    required this.status,
    required this.library, //도서관 정보 추가
  });


  factory BookRequest.fromJson(Map<String, dynamic> json) {
    return BookRequest(
      id: json['id'], //JSON에서 ID 필드 가져오기
      title: json['title'],
      author: json['author'],
      translator: json['translator'],
      bookNumber: json['bookNumber'],
      efficiency: (json['efficiency'] as num).toDouble(), // JSON에서 double로 변환
      status: json['status'],
      library: json['library'], //JSON에서 도서관 정보 가져오기
    );
  }
}
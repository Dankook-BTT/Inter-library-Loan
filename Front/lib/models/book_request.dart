//도서 목록에 들어갈 모델들 모아놓은 파일임

class BookRequest {
  final int id; //ID 필드 추가
  final String title; //도서 제목 필드 추가
  final String author; //도서 저자 필드 추가
  final String translator; //도서 번역가 필드 추가
  final String bookNumber; //도서 고유번호(ISBN같은 거)를 나타내는 필드
  final double efficiency; //도서 요청의 효율성을 나타내는 필드 추가
  final String status; //도서 요청의 현재 상태(대기/승인,,etc) 필드 추가
  final String library; // 도서관 정보 추가

  //BookRequest 생성자: 필수 필드를 받아 객체를 초기화
  //'required' 키워드는 해당 필드가 반드시 제공되어야 함을 나타냄
  BookRequest({
    required this.id, //고유 ID
    required this.title, //제목
    required this.author, //저자
    required this.translator, //번역가
    required this.bookNumber, //도서 번호
    required this.efficiency, //효율성 점수
    required this.status, //상태
    required this.library, //도서관 정보 추가
  });

  //BookRequest 클래스 내 JSON 데이터를 객체로 반환하는 팩토리 생성자
  //factory BookRequest.fromJSON: 이 부분은 팩토리 생성자로, JSON데이터를 받아 BookRequest 객체 생성
  //Map<String, dynamic> json: JSON 형식의 데이터를 담고 있는 맵. BookRequest 객체를 담기 위해 필요한 데이터를 포함
  factory BookRequest.fromJson(Map<String, dynamic> json) {
    return BookRequest(
      id: json['id'], //JSON에서 ID 필드 가져오기
      title: json['title'], //JSON에서 title 필드 초기화
      author: json['author'], //JSON에서 author 필드 초기화
      translator: json['translator'], //JSON에서 translator 필드 초기화
      bookNumber: json['bookNumber'], //JSON에서 bookNumber 필드 초기화
      efficiency: (json['efficiency'] as num).toDouble(), // JSON에서 double로 변환
      status: json['status'], //JSON에서 status 필드 초기화
      library: json['library'], //JSON에서 도서관 정보 가져오기
    );
  }
}
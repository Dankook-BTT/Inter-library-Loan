//이건 도서 목록 모델과 분류를 하기 위해서
//사용자(여기선 사서) 모델을 구현한 다트 파일임

// user_model.dart

class UserModel {
  // 공통적으로 요구되는 사용자 정보
  final String id; // 로그인 ID
  final String? name; // 사용자 이름
  final String role; // 사용자 역할 (예: admin, user)
  final String? email; // 사용자 이메일
  final String lib; // 소속 도서관 정보

  // 로그인에 사용되는 정보
  final String password; // 로그인 비밀번호

  //UserModel 생성자: 필수 필드를 받아 객체를 초기화
  //'required' 키워드는 해당 필드가 반드시 제공되어야 함을 나타냄
  UserModel({
    required this.id,
    required this.password,
    required this.name,
    required this.role,
    required this.email,
    required this.lib,
  });

  // 공통적으로 요구되는 JSON 데이터를 사용자 모델로 변환하는 메서드
  // UserModel 클래스 내 JSON 데이터를 객체로 반환하는 팩토리 생성자
  // factory UserModel.fromJSON: 이 부분은 팩토리 생성자로, JSON데이터를 받아 UserRequest 객체 생성
  // Map<String, dynamic> json: JSON 형식의 데이터를 담고 있는 맵. UserRequest 객체를 담기 위해 필요한 데이터를 포함
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      password: json['password'], // 비밀번호는 로그인 시 필요
      name: json['name'],
      role: json['role'],
      email: json['email'],
      lib: json['lib'],
    );
  }

  // 사용자 모델을 공통적으로 요구되는 JSON 형태로 변환하는 메서드
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'password': password, // 비밀번호 포함
      'name': name,
      'role': role,
      'email': email,
      'lib': lib,
    };
  }

  // 로그인에 사용되는 JSON 데이터를 생성하는 메서드
  Map<String, dynamic> toLoginJson() {
    return {
      'id': id,
      'password': password,
    };
  }

  // 개인정보에 사용되는 JSON 데이터를 생성하는 메서드
  Map<String, dynamic> toPersonalInfoJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'lib': lib,
      'role': role,
    };
  }


  // 사용자가 admin인지 확인하는 메서드
  bool isAdmin() {
    return role == 'admin';
  }
}

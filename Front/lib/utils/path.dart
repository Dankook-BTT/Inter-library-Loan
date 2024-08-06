// constants.dart

class ApiPath {
  static const String baseUrl = 'https://dankook2021.azurewebsites.net';

  // Auth 관련 엔드포인트
  static const String sendEmailForId = '$baseUrl/send-email';
  static const String login = '$baseUrl/';
  static const String signup = '$baseUrl/admin/admin_approval/sign-up-cont/sign-up';
  static const String idCheck = '$baseUrl/id-Check';
  static const String pwCheck = '$baseUrl/pw-Check';

  // Admin 관련 엔드포인트
  static const String adminApproval = '$baseUrl/admin/admin-approval';
  static const String createAdmin = '$baseUrl/admin';
  static const String dataScreen = '$baseUrl/admin/data-screen';
  static const String adminSignUpControl ='$baseUrl/admin/admin-approval/sign-up-cont';

  // 기타 엔드포인트들
  static const String bookRequest = '$baseUrl/main/book-request';
  static const String requestList = '$baseUrl/main/request-list';
  static const String aiRecommendation = '$baseUrl/main/ai-recommendation';
}

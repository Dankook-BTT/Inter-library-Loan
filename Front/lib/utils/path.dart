// constants.dart

class ApiPath {
  static const String baseUrl = 'https://dankook2021.azurewebsites.net';

  // Auth 관련 엔드포인트
  static const String sendEmailForId = '$baseUrl/send-email';
  static const String login = '$baseUrl/';
  static const String idCheck = '$baseUrl/id-Check';
  static const String pwCheck = '$baseUrl/pw-Check';

  // Admin 관련 엔드포인트
  static const String baseAdminUrl = '/admin';
  static const String adminApprovalUrl = '$baseAdminUrl/admin_approval';
  static const String signUpContUrl = '$adminApprovalUrl/sign-up-cont';
  static const String signUpUrl = '$signUpContUrl/sign-up';
  static const String dataUrl = '$baseAdminUrl/data_screen';

  // 기타 엔드포인트들
  static const String bookRequest = '$baseUrl/main/book-request';
  static const String requestList = '$baseUrl/main/request-list';
  static const String aiRecommendation = '$baseUrl/main/ai-recommendation';
  static const String myPage = '$baseUrl/main/myPage';
}

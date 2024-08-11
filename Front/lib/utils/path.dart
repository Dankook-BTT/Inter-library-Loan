// constants.dart

class AppPath {
  static const String baseUrl = 'https://dankook2021.azurewebsites.net/';

  // Auth 관련 엔드포인트
  static const String sendEmailForIdUrl = '$baseUrl/send-email';
  static const String idCheckUrl = '$baseUrl/id-check';  // 라우트와 일관성 유지
  static const String pwCheckUrl = '$baseUrl/pw-check';  // 라우트와 일관성 유지

  // Admin 관련 엔드포인트
  static const String baseAdminUrl = '/admin';
  static const String adminApprovalUrl = '$baseAdminUrl/admin-approval';
  static const String signUpContUrl = '$adminApprovalUrl/sign-up-cont';
  static const String signUpUrl = '$signUpContUrl/sign-up';
  static const String dataUrl = '$baseAdminUrl/data-screen';

  // 기타 엔드포인트들
  static const String bookRequestUrl = '$baseUrl/main/book-request';
  static const String requestListUrl = '$baseUrl/main/request-list';
  static const String aiRecommendationUrl = '$baseUrl/main/ai-recommendation';
  static const String myPageUrl = '$baseUrl/main/myPage';
}

class AppRoutes {
  // Auth 관련 라우트
  static const String sendEmailForId = '/send-email';
  static const String login = '/';
  static const String idCheck = '/id-check';
  static const String pwCheck = '/pw-check';

  // Admin 관련 라우트
  static const String baseAdmin = '/admin';
  static const String adminApproval = '$baseAdmin/admin-approval';
  static const String signUpCont = '$adminApproval/sign-up-cont';
  static const String signUp = '$signUpCont/sign-up';
  static const String data = '$baseAdmin/data-screen';

  // 기타 라우트
  static const String bookRequest = '/main/book-request';
  static const String requestList = '/main/request-list';
  static const String aiRecommendation = '/main/ai-recommendation';
  static const String myPage = '/main/myPage';
}

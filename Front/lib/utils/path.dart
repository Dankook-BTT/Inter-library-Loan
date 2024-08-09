// constants.dart

class AppPath {
  static const String baseUrl = 'https://dankook2021.azurewebsites.net/login';

  // Auth 관련 엔드포인트
  static const String sendEmailForIdUrl = '$baseUrl/send-email';
  static const String loginUrl = '$baseUrl/main';
  static const String idCheckUrl = '$baseUrl/id-Check';
  static const String pwCheckUrl = '$baseUrl/pw-Check';

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

  //여기서부턴 app routes들
  static const String sendEmailForId = '/send-email';
  static const String login = '/main';
  static const String idCheck = '/id-Check';
  static const String pwCheck = '/pw-Check';

  // Admin 관련 엔드포인트
  static const String baseAdmin = '/admin';
  static const String adminApproval = '/admin/admin_approval';
  static const String signUpCont = '/admin/admin_approval/sign-up-cont';
  static const String signUp = '/admin/admin_approval/sign-up-cont/sign-up';
  static const String data = '/admin/data_screen';

  // 기타 엔드포인트들
  static const String bookRequest = '/main/book-request';
  static const String requestList = '/main/request-list';
  static const String aiRecommendation = '/main/ai-recommendation';
  static const String myPage = '/main/myPage';
}
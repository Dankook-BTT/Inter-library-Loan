import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/book_request.dart';

class ApiService {
  static const String apiUrl = 'https://yourapi.com'; //API 기본 URL

  //도서 요청 목록을 서버에서 가져오는 메서드
  Future<List<BookRequest>> fetchBookRequests() async {
    try { //API 요청을 보낼 URL
      final response = await http.get(
          Uri.parse('https://yourapi.com/requests'));

      if (response.statusCode == 200) {
        //응답이 성공적일 경우
        List<dynamic> data = json.decode(response.body);
        List<BookRequest> requests = data.map((item) =>
            BookRequest.fromJson(item)).toList();
        print('Loaded book requests: $requests'); //데이터 출력
        return requests;
      } else {
        //응답이 성공적이지 않은 경우 예외를 발생
        throw Exception('Failed to load book requests');
      }
    } catch (e) {
      //네트워크 오류 또는 기타 오류 처리
      print('Error fetching book requests: $e');
      throw Exception('Failed to load book requests');
    }
  }

  //도서 요청의 상태를 업데이트하는 메서드
  Future<void> updateBookRequestStatus(int id, String status) async{
    try{
      final response = await http.put(
        Uri.parse('$apiUrl/requests/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'status': status,
        }),
      );

      if (response.statusCode != 200) {
          //상태 코드가 200이 아닌 경우 예외 발생
        throw Exception('Failed to update book request status');
        }
    } catch (e) {
      //네트워크 오류 또는 기타 오류 처리
      print('Error updating book request status: $e');
      throw Exception('Failed to update book request status');
    }
  }




  //AI 추천 도서 목록을 서버에서 가져오는 메서드
  Future<List<String>> fetchAIRecommendations() async {
    try {
      final response = await http.get(Uri.parse('$apiUrl/ai-recommendations'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.cast<String>();
      } else {
        throw Exception('Failed to load AI recommendations');
      }
    } catch (e) {
        // 네트워크 오류 또는 기타 오류 처리
      print('Error fetching AI recommendations: $e');
      throw Exception('Failed to load AI recommendations');
    }
  }
}

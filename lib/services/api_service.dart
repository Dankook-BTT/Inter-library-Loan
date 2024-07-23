import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/book_request.dart';

class ApiService {
  static const String apiUrl = 'https://yourapi.com'; //API 기본 URL

  Future<List<BookRequest>> fetchBookRequests() async {
    // Replace with your API endpoint
    final response = await http.get(Uri.parse('https://yourapi.com/requests'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<BookRequest> requests = data.map((item) => BookRequest.fromJson(item)).toList();
      print('Loaded book requests: $requests'); //데이터 출력
      return requests;
    } else {
      throw Exception('Failed to load book requests');
    }
  }

  Future<void> updateBookRequestStatus(int id, String status) async{
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
      throw Exception('Failed to update book request status');
    }
  }
  Future<List<String>> fetchAIRecommendations() async {
    final response = await http.get(Uri.parse('$apiUrl/ai-recommendations'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.cast<String>();
    } else {
      throw Exception('Failed to load AI recommendations');
    }
  }
}
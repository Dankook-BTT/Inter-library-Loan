import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/book_request.dart';
import '../widgets/book_request_card.dart';

class AIRecommendationScreen extends StatefulWidget {
  @override
  _AIRecommendationScreenState createState() => _AIRecommendationScreenState();
}

class _AIRecommendationScreenState extends State<AIRecommendationScreen> {
  late Future<List<String>> futureAIRecommendations;
  late Future<List<BookRequest>> futureBookRequests;

  @override
  void initState() {
    super.initState();
    futureAIRecommendations = ApiService().fetchAIRecommendations();
    futureBookRequests = ApiService().fetchBookRequests();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AI Recommendation'),
      ),
      body: Column(
        children: [
          FutureBuilder<List<String>>(
            future: futureAIRecommendations,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Failed to load AI recommendations'));
              } else if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(8.0),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data![index]),
                      );
                    },
                  ),
                );
              } else {
                return Center(child: Text('No AI recommendations found'));
              }
            },
          ),
          Divider(), // 구분선 추가
          FutureBuilder<List<BookRequest>>(
            future: futureBookRequests,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Failed to load book requests'));
              } else if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(8.0),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 30.0), // 간격 추가
                        child: BookRequestCard(
                          bookRequest: snapshot.data![index],
                          onStatusChanged: () {
                            setState(() {
                              futureBookRequests = ApiService().fetchBookRequests();
                            });
                          },
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Center(child: Text('No book requests found'));
              }
            },
          ),
        ],
      ),
    );
  }
}

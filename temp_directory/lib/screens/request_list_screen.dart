import 'package:flutter/material.dart';
import '../models/book_request.dart';
import '../services/api_service.dart';
import '../widgets/book_request_card.dart';

class RequestListScreen extends StatefulWidget {
  @override
  _RequestListScreenState createState() => _RequestListScreenState();
}

class _RequestListScreenState extends State<RequestListScreen> {
  late Future<List<BookRequest>> futureBookRequests;

  @override
  void initState() {
    super.initState();
    futureBookRequests = ApiService().fetchBookRequests();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request List'),
      ),
      body: FutureBuilder<List<BookRequest>>(
        future: futureBookRequests,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load book requests'));
          } else if (snapshot.hasData) {
            return ListView.builder(
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
            );
          } else {
            return Center(child: Text('No book requests found'));
          }
        },
      ),
    );
  }
}
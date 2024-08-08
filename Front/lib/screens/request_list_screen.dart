import 'package:flutter/material.dart';
import '../models/book_request.dart';
import '../services/api_service.dart';
import '../widgets/book_request_card.dart';
import 'package:inter_library_loan_new/utils/path.dart';

class RequestListScreen extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Request List Screen Content',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // 여기에 요청 리스트 관련 콘텐츠를 추가할 수 있습니다.
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, ApiPath.myPage);
              },
              child: Text('Go to My Page'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, ApiPath.aiRecommendation);
              },
              child: Text('Go to AI Recommendation'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, ApiPath.dataUrl);
              },
              child: Text('Go to Data Screen'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, ApiPath.adminApprovalUrl);
              },
              child: Text('Go to Admin Approval'),
            ),
          ],
        ),
      ),
    );
  }


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
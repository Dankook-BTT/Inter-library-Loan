import 'package:flutter/material.dart';
import 'package:inter_library_loan_new/utils/path.dart';

class DataScreen extends StatefulWidget {
  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  // 가상의 데이터 목록
  final List<String> data = ["Item 1", "Item 2", "Item 3", "Item 4"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Screen'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(data[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(item: data[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String item;

  DetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),
      body: Center(
        child: Text('Details of $item'),
      ),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Screen'),
      ),
      body: Column(
        children: [
          // 페이지의 콘텐츠를 여기에 추가
          Expanded(
            child: Center(
              child: Text('Data Screen 페이지의 콘텐츠를 여기에 추가하세요'),
            ),
          ),
          // 네비게이션 버튼 추가
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ApiPath.bookRequest);
                  },
                  child: Text('Book Request'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ApiPath.requestList);
                  },
                  child: Text('Request List'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ApiPath.aiRecommendation);
                  },
                  child: Text('AI Recommendation'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ApiPath.myPage);
                  },
                  child: Text('My Page'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ApiPath.signUpUrl);
                  },
                  child: Text('Admin Approval'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ApiPath.baseAdminUrl);
                  },
                  child: Text('Create Admin'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


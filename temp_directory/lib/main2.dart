import 'package:flutter/material.dart';
import 'screens/book_request_screen.dart';
import 'screens/request_list_screen.dart';
import 'screens/ai_recommendation_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library Exchange App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        '/book-request': (context) => BookRequestScreen(),
        '/request-list': (context) => RequestListScreen(),
        '/ai-recommendation': (context) => AIRecommendationScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    BookRequestScreen(),
    RequestListScreen(),
    AIRecommendationScreen(),
  ];

  void _onItemTapped(int index){
    setState((){
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Library Exchange App'),
      ),
      body: Column(
        children: [
          //상단 버튼
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => _onItemTapped(0),
                  child: Text('도서 요청하기'),
                  style: TextButton.styleFrom(
                    foregroundColor: _selectedIndex == 0 ? Colors.blue : Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () => _onItemTapped(1),
                  child: Text('도서 요청 목록'),
                  style: TextButton.styleFrom(
                    foregroundColor: _selectedIndex == 1 ? Colors.blue : Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () => _onItemTapped(2),
                  child: Text('도서 배치 추천'),
                  style: TextButton.styleFrom(
                    foregroundColor: _selectedIndex == 2 ? Colors.blue : Colors.black,
                  ),
                ),
                Spacer(), //빈 공간 채우기
                TextButton(
                  onPressed: () {
                    //더보기 버튼 눌렀을 때 동작
                  },
                  child: Text('더보기'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black, // 기본 색상
                  ),
                ),
              ],
          ),
          //선택된 화면
          Divider(), //구분선 추가
          Expanded(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ],
      ),
    );
  }
}

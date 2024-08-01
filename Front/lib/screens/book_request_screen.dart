import 'package:flutter/material.dart';
import '../models/book_request.dart';
import '../services/api_service.dart';
import '../widgets/book_request_card.dart';
import '../screens/mypage.dart';

class BookRequestScreen extends StatefulWidget {
  @override
  _BookRequestScreenState createState() => _BookRequestScreenState();
}

class _BookRequestScreenState extends State<BookRequestScreen> {
  late Future<List<BookRequest>> futureBookRequests;
  List<BookRequest> bookRequests = [];
  List<BookRequest> filteredBookRequests = [];
  List<BookRequest> searchResults = []; // 검색 결과 리스트
  TextEditingController searchController = TextEditingController();

  @override
  void initState(){
    super.initState();
    _loadBookRequests();
  }

  Future<void> _loadBookRequests() async{
    futureBookRequests = ApiService().fetchBookRequests();
    futureBookRequests.then((bookRequest){
      setState((){
        this.bookRequests = bookRequests;
        filteredBookRequests = bookRequests;
      });
      print('Loaded book requests in screen: $bookRequests');
    });
  }

  void _filterBooks(String query){
    final filtered = bookRequests.where((book){
      final titleLower = book.title.toLowerCase();
      final authorLower = book.author.toLowerCase();
      final translatorLower = book.translator.toLowerCase();
      final bookNumberLower = book.bookNumber.toLowerCase();
      final searchLower = query.toLowerCase();
      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower) ||
          translatorLower.contains(searchLower) ||
          bookNumberLower.contains(searchLower);
    }).toList();

    setState((){
      filteredBookRequests = filtered;
    });
    print('Filtered book requests: $filteredBookRequests'); //필터링된 데이터 확인
  }

  void _searchBooks(String query) {
    final results = bookRequests.where((book) {
      final titleLower = book.title.toLowerCase();
      final authorLower = book.author.toLowerCase();
      final translatorLower = book.translator.toLowerCase();
      final bookNumberLower = book.bookNumber.toLowerCase();
      final searchLower = query.toLowerCase();
      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower) ||
          translatorLower.contains(searchLower) ||
          bookNumberLower.contains(searchLower);
    }).toList();

    setState(() {
      searchResults = results;
    });
    print('Search results: $searchResults');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Request'),
      ),
      body: Column(
        children: [
          //검색창 추가
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: '찾고 싶은 책을 검색해보세요',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (query) {
                _filterBooks(query); //검색어 변경 시 필터링 메서드 호출
                _searchBooks(query);
              },
            ),
          ),
          Expanded(
            child: searchResults.isNotEmpty
              ? ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: BookRequestCard(
                        bookRequest: searchResults[index],
                        onStatusChanged: _loadBookRequests, //상태 변경 시 호출
                      ),
                    );
                  },
                )
              : FutureBuilder<List<BookRequest>>(
                  future: futureBookRequests,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Failed to load book requests'));
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                        padding: EdgeInsets.all(8.0),
                        itemCount: filteredBookRequests.length, //필터링된 도서 목록 사용
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            child: BookRequestCard(
                              bookRequest: filteredBookRequests[index],
                              onStatusChanged: _loadBookRequests, //상태 변경 시 호출
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(child: Text('No book requests found'));
                    }
                  },
                ),
              ),
            ],
          ),
        );

  }
}

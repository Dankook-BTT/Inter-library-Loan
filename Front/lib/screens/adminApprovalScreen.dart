//관리자가 회원가입을 승인하도록 하게
//관리자만 볼 수 있는 회원가입 승인 대시보드
import 'package:flutter/material.dart';
import 'package:inter_library_loan_new/utils/path.dart';



class AdminApprovalScreen extends StatefulWidget {
  @override
  _AdminApprovalScreenState createState() => _AdminApprovalScreenState();
}

class _AdminApprovalScreenState extends State<AdminApprovalScreen> {
  final List<Map<String, String>> pendingRequests = [
    {'username': 'user1', 'status': 'pending'},
    {'username': 'user2', 'status': 'pending'},
    // 대기 중인 요청 리스트 예시 (실제 구현에서는 서버에서 받아옴)
  ];


  void _approveRequest(String username) {
    // 서버 API 호출하여 해당 사용자의 요청 승인
    print('$username 회원가입 요청 승인');
    // 처리 후 UI 업데이트 로직 추가
  }

  void _rejectRequest(String username) {
    // 서버 API 호출하여 해당 사용자의 요청 거부
    print('$username 회원가입 요청 거부');
    // 처리 후 UI 업데이트 로직 추가
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입 요청 관리'),
      ),
      body: ListView.builder(
        itemCount: pendingRequests.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(pendingRequests[index]['username']!),
            subtitle: Text('상태: ${pendingRequests[index]['status']}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.check, color: Colors.green),
                  onPressed: () => _approveRequest(pendingRequests[index]['username']!),
                ),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.red),
                  onPressed: () => _rejectRequest(pendingRequests[index]['username']!),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class NavigationButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.bookRequest);
            },
            child: Text('Book Request'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.baseAdmin);
            },
            child: Text('Admin Base'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.adminApproval);
            },
            child: Text('Admin Approval'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.signUpCont);
            },
            child: Text('Sign Up Cont'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.signUp);
            },
            child: Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}
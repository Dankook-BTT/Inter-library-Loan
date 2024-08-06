import 'package:flutter/material.dart'; //material 패키지를 가져오는데, 이 material 패키지의 요소에는 대략
//위젯, 화면 스타일, 네비게이션 및 라우팅, 상호작용 등의 기능이 있음
import 'package:inter_library_loan_new/screens/signupScreen.dart' as screen;//회원가입 화면을 구현한 다트 파일 소환
import 'screens/book_request_screen.dart'; //도서 요청 화면을 구현한 다트 파일 소환
import 'screens/request_list_screen.dart'; //요청 목록 화면을 구현한 다트 파일 소환
import 'screens/ai_recommendation_screen.dart'; //ai 도서 추천 화면을 구현한 다트 파일 소환
import 'screens/loginScreen.dart'; // loginScreen.dart를 임포트
import 'screens/idCheck.dart'; //아이디 찾기 화면 구현한 다트 파일 소환
import 'screens/pwCheck.dart'; //비번 찾기 화면 구현한 다트 파일 소환
import 'screens/adminApprovalScreen.dart'; //관리자가 회원가입 승인하는 기능을 하는 다트 파일 소환
import 'screens/mypage.dart'; //마이페이지 다트 파일 소환
import 'screens/CreateAdminScreen.dart'; //관리자 생성 화면 소환
import 'screens/signupControl.dart' as control; //회원가입 허가 파일 소환
import 'screens/data_screen.dart'; // 데이터 받는 화면 소환
import 'package:inter_library_loan_new/models/user_model.dart';

final url = Uri.parse('https://dankook2021.azurewebsites.net/'); // 서버의 로그인 엔드포인트 URL

void main() {
  runApp(MyApp()); //runApp은 화면 렌더링, 위젯의 계층적 구조를 보여주는 위젯 트리를 보여줌
} //main()은 화면의 진입점을 위해서 필요한 함수

class MyApp extends StatelessWidget { //MyApp은 루트 위젯 느낌, StatelessWidgets는 위젯 생성 후 상태가 변경되지 않음을 의미
                                      //그래서 StatelessWidget은 한 번만 빌드됨
                                      //UI를 단순히 그리는데 사용이 됨
  @override //MyApp이 StatelessWidget을 상속받아 앱 초기 구성 요소를 설정한 후에는 상태가 변경 안 됨
  Widget build(BuildContext context) {
    return MaterialApp( //flutter 전체 앱 구조와 내비게이션을 관리하는 위젯(로컬화 설정이나 테마, 라우팅 등,,)
      title: 'Library Exchange App', //앱 이름
      theme: ThemeData( //앱 테마
        primarySwatch: Colors.blue, //앱 색상 지정
      ),
      initialRoute: '/',
      routes: { //앱 내의 내비게이션 경로 설정
        '/': (context) => LoginScreen(),
        '/main/book-request': (context) => BookRequestScreen(),
        '/main/request-list': (context) => RequestListScreen(),
        '/main/ai-recommendation': (context) => AIRecommendationScreen(),
        '/admin/admin_approval/sign-up-cont/sign-up': (context) => screen.SignUpScreen(),
        '/id-check': (context) => IdCheckScreen(),
        '/pw-check': (context) => PwCheckScreen(),
        '/admin/admin-approval': (context) => AdminApprovalScreen(),
        '/main/my-page': (context) => MyPage(),
        '/admin': (context) => AdminCreationScreen(),
        '/admin/data-screen': (context) => DataScreen(),
        '/admin/admin_approval/sign-up-cont': (context) => control.SignUpControl(
            user: UserModel(
            id: 'someId',
            password: 'somePassword',
            role: 'admin', // 'admin' 또는 'user'와 같은 유효한 역할
            lib: 'someLibrary',
            name: 'admin',
            email: 'admin',
          ),
        ),
      },
    );
  }
}

class HomeScreen extends StatefulWidget{ //StatelessWidget과 달리 상태가 변경될 수 있는 UI에 사용
                                         //버튼같은거 눌렀을때 이벤트가 화면 렌더링에 반영되도록 하기 위해서 사용됐다고 이해
  @override //HomeScreen이 StatefulWidget을 상속받음
  _HomeScreenState createState() => _HomeScreenState();
  //createState(): 데이터를 저장하고 업데이트하는 과정을 의미하는 메서드
  //_HomeScreenState: StatefulWidget을 상속받고,
  //=> createState 메서드를 구현하여 상태를 관리하는 _HomeScreenState 객체를 반환합니다.
}

//HomeScreen을 관리하는 state 클래스, 여기서 언더바는 이 클래스가 비공개 클래스임을 나타냄
class _HomeScreenState extends State<HomeScreen>{
  //현재 선택된 탭의 인덱스를 저장하는 변수, 초기값이 0임(첫번째 탭이 기본적으로 선택되었음)
  int _selectedIndex = 0;

  //사용자가 선택할 수 있는 여러 화면 옵션을 저장하는 리스트
  //각 옵션은 화면을 나타내는 위젯을 구성되어있음
  //사용자가 탭바에서 탭을 선택할 때마다 이 리스트에서 선택된 화면이 보이게 됨
  final List<Widget> _widgetOptions = <Widget>[
    LoginScreen(), //로그인 화면
    BookRequestScreen(),  //책 요청 화면
    RequestListScreen(),   //요청 목록 화면
    AIRecommendationScreen(), //AI 추천화면
    screen.SignUpScreen(), //회원 가입 화면
  ];

  //사용자가 탭바의 아이템을 탭할 때 호출되는 함수
  //인덱스를 받아와서 _selectedIndex를 해당 인덱스로 업데이트 한 후에
  //setState 함수를 이용해서 상태를 업데이트하면,
  //Flutter는 자동으로 화면을 다시 렌더링하여 변경된 상태를 저장
  void _onItemTapped(int index){
    //setState는 Flutter에서 상태를 변경하고 화면을 다시 그리도록 하는 함수
    setState((){
      _selectedIndex = index; //선택된 인덱스를 업데이트
    });
  }

  void _onMenuSelected(String value) {
    switch (value) {
      case 'myPage':
        Navigator.pushNamed(context, '/my-page');
        break;
    // 다른 옵션을 추가할 수 있습니다.
    }
  }


  // _HomeScreenState 클래스의 build 메서드
  // 화면의 UI를 구성하고 렌더링하는 역할
  @override
  Widget build(BuildContext context){
    return Scaffold(
      //Scaffold는 기본적인 화면 레이아웃을 제공하는 위젯
      appBar: AppBar(
        //상단에 표시되는 앱바 설정
        title: Text('Library Exchange App'), //앱바의 제목
      ),
      body: Column(
        //화면의 주요 내용을 세로로 배열
        children: [
          //상단 버튼들이 들어가는 Row
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //버튼들을 균등하게 배치
              children: [
                //첫 번째 버튼: '도서 요청하기'
                TextButton(
                  onPressed: () => _onItemTapped(0), //버튼 클릭 시 인덱스 0 선택
                  child: Text('도서 요청하기'), //버튼에 표시될 텍스트
                  style: TextButton.styleFrom(
                    foregroundColor: _selectedIndex == 0 ? Colors.blue : Colors.black,
                    //선택된 상태(_selectedIndex == 0)면 파란색, 그렇지 않으면 검은색
                  ),
                ),
                    //두 번째 버튼: '도서 요청 목록'
                TextButton(
                  onPressed: () => _onItemTapped(1), //버튼 클릭 시 인덱스 1 선택
                  child: Text('도서 요청 목록'), //버튼에 표시될 텍스트
                  style: TextButton.styleFrom(
                    foregroundColor: _selectedIndex == 1 ? Colors.blue : Colors.black,
                    //선택된 상태(_selectedIndex == 1)면 파란색, 그렇지 않으면 검은색
                  ),
                ),
                    //세 번째 버튼: '도서 배치 추천'
                TextButton(
                  onPressed: () => _onItemTapped(2),  //버튼 클릭 시 인덱스 2 선택
                  child: Text('도서 배치 추천'),  //버튼에 표시될 텍스트
                  style: TextButton.styleFrom(
                    foregroundColor: _selectedIndex == 2 ? Colors.blue : Colors.black,
                  ), //선택된 상태(_selectedIndex == 2)면 파란색, 그렇지 않으면 검은색
                ),
                    //남은 공간을 빈 공간으로 채우기
                Spacer(), //오른쪽에 버튼이 붙지 않도록 공간 확보
                //네 번째 버튼: '더보기'
                PopupMenuButton<String>(
                  onSelected: _onMenuSelected,
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem<String>(
                        value: 'myPage',
                        child: Text('마이페이지'),
                      ),
                      // 다른 메뉴 항목을 추가할 수 있습니다.
                    ];
                  },
                  child: Text('더보기',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
          ),
          //구분선을 추가해줌
          Divider(), //버튼과 아래 내용 사이에 구분선을 추가
          //선택된 화면을 표시하는 부분
          Expanded(
            child: _widgetOptions.elementAt(_selectedIndex),
            //_widgetOptions에서 현재 선택된 인덱스(_selectedIndex)에 해당하는 화면을 표시
          ),
        ],
      ),
    );
  }
}

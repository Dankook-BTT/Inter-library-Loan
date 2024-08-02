//위젯의 초기 상태와 사용자의 상호작용에 따른 상태 변화를 확인하는 방법을 보여주는 파일임

// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


//필요한 패키지들을 가져옴
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inter_library_loan_new/main.dart';
import 'package:inter_library_loan_new/screens/loginScreen.dart';

//메인 함수로 테스트를 실행한다.
void main() {
  //위젯 테스트를 정의
  //'Counter increments smoke test' 라는 이름의 테스트를 수행
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // 카운터가 0에서 시작하는지 확인한다.
    expect(find.text('0'), findsOneWidget); //'0'이라는 텍스트를 찾고, 하나의 위젯이 있는지 확인
    expect(find.text('1'), findsNothing); //'1'이라는 텍스트를 찾지만, 없는지 확인

    // '+' 아이콘을 탭하고 다시 프레임을 렌더링한다.
    await tester.tap(find.byIcon(Icons.add)); //'Icons.add' 아이콘을 찾아서 탭(클릭)
    await tester.pump(); //프레임을 다시 렌더링하여 상태 변화 반영

    // 카운터가 1로 증가했는지 확인한다.
    expect(find.text('0'), findsNothing); //'0'이라는 텍스트가 없는지 확인
    expect(find.text('1'), findsOneWidget); //'1'이라는 텍스트가 있는지 확인
  });
}


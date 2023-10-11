import 'package:flutter/material.dart';

/**
 * HomePage (Header, Bottom)
 * Header만 상태를 바꾸기위해 statefull로 바꾸면
 * Bottom은 stateless이기 때문에 setState를 호출하지 못한다. 그러므로 상태도 바꿀 수 없다.
 *
 */

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 상태
  int num = 1;

  // (상태를 변경시키는) 행위
  void add() {
    setState(() {
      num = num + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(child: HeaderPage(num)), // 상태를 전달
            Expanded(child: BottomPage(add)), // 행위를 전달
          ],
        ),
      ),
    );
  }
}

class HeaderPage extends StatelessWidget {
  // header자체가 new되는 것이기 때문에 final해도 된다.
  final num; // stateless이기 때문에 final
  HeaderPage(this.num);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Align(
        child: Text(
          "$num",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 100,
              decoration: TextDecoration.none),
        ),
      ),
    );
  }
}

class BottomPage extends StatelessWidget {
  final add;
  BottomPage(this.add);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Align(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () {
            print("버튼 클릭됨");
            add();
          },
          child: Text(
            "증가",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 100,
            ),
          ),
        ),
      ),
    );
  }
}

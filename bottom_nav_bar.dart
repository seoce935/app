import 'package:flutter/material.dart';
import '../screens/my_screen.dart'; 
// 다른 화면 파일도 필요합니다. (예: home_screen.dart, map_screen.dart 등)
import '../screens/home_screen.dart'; // 임시로 빈 화면을 만들어서 대체

// 임시 빈 화면들 (실제 구현 시 해당 파일로 교체)
class TempScreen extends StatelessWidget {
  final String title;
  const TempScreen(this.title, {super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('$title 화면입니다.', style: const TextStyle(fontSize: 20))),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 4; // 시작 화면을 My (인덱스 4)로 설정

  final List<Widget> _screens = [
    const TempScreen("홈"), // 0
    const TempScreen("저장"), // 1
    const TempScreen("지도"), // 2
    const TempScreen("랜덤픽"), // 3
    const MyScreen(), // 4
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // 탭이 5개일 때 고정
        backgroundColor: Colors.white,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_border), label: '저장'),
          BottomNavigationBarItem(icon: Icon(Icons.location_on_outlined), label: '지도'),
          BottomNavigationBarItem(icon: Icon(Icons.casino_outlined), label: '랜덤'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: '마이'),
        ],
      ),
    );
  }
}

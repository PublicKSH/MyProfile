import 'package:flutter/material.dart';
import 'package:my_profile/utils/responsive.dart';
import 'package:my_profile/widgets/mobile_app_bar.dart';
import 'package:my_profile/widgets/side_menu_widget.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  _RootViewState createState() => _RootViewState();
}

class _RootViewState extends State<RootView> with WidgetsBindingObserver {
  final ScrollController _scrollController = ScrollController();
  // 스크롤 위치를 저장할 변수
  double _savedScrollPosition = 0.0; 

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    // 화면 크기가 변경될 때, 기존 스크롤 위치로 유지
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_savedScrollPosition);
    }
  }

  // 특정 위치로 스크롤하는 함수
  void scrollToIndex(int index) {
    double position = index * 500; // 예시로 각 항목의 높이를 500으로 가정
    _scrollController.animateTo(
      position,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.IsDesktop(context);

    return Scaffold(
      appBar: !isDesktop ? const MobileAppBar() : null,
      backgroundColor: Colors.white,
      drawer: !isDesktop
          ? SizedBox(
              width: 300,
              child: SideMenuWidget(
                onMenuTap: scrollToIndex, // 메뉴 클릭 시 호출
              ),
            )
          : null,
      body: SafeArea(
        child: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            // 스크롤 위치를 저장
            if (scrollNotification is ScrollUpdateNotification) {
              _savedScrollPosition = _scrollController.position.pixels;
            }
            return false;
          },
          child: Column(
            children: [
              if (isDesktop)
                SideMenuWidget(onMenuTap: scrollToIndex),
              Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  controller: _scrollController, // ScrollController 적용
                  child: Column(
                    children: [
                      Container(height: 500, color: Colors.red),
                      Container(height: 500, color: Colors.blue),
                      Container(height: 500, color: Colors.green),
                      Container(height: 500, color: Colors.yellow),
                      Container(height: 500, color: Colors.purple),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

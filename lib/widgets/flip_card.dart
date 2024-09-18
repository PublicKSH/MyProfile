import 'dart:math';

import 'package:flutter/material.dart';

class FlipCard extends StatefulWidget {
  const FlipCard({super.key});

  @override
  _FlipCardState createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isFront = true; // 현재 앞면인지 뒷면인지 여부

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // 애니메이션 상태 변화에 따라 앞면과 뒷면을 전환
    _animation.addListener(() {
      setState(() {
        if (_animation.value >= 0.5 && _isFront) {
          _isFront = false;
        } else if (_animation.value < 0.5 && !_isFront) {
          _isFront = true;
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // 수정된 부분
  void _startFlip() {
    if (_controller.isAnimating) return;
    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    } else if (_controller.status == AnimationStatus.dismissed) {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _startFlip,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          // 애니메이션 값을 각도로 변환 (0 ~ π)
          double angle = _animation.value * pi;
          // 회전 각도가 90도(π/2)를 넘으면 뒤집기
          if (angle > pi / 2) {
            angle = pi - angle;
          }

          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // 3D 효과를 위한 원근감 설정
              ..rotateY(angle),
            child: _isFront ? _buildFrontCard() : _buildBackCard(),
          );
        },
      ),
    );
  }

  Widget _buildFrontCard() {
    return Container(
      width: 200,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(
        '앞면',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }

  Widget _buildBackCard() {
    return Container(
      width: 200,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(
        '뒷면',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}

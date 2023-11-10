import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final Widget children;

  final AppBar? appBar;

  const Screen({super.key, required this.children, this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: children,
      ),
      backgroundColor: Colors.grey[300],
    );
  }
}

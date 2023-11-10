import 'package:flutter/material.dart';
import 'package:mdigits/src/components/ui_components/screen.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Screen(
      children: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

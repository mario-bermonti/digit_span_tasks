import 'package:flutter/material.dart';
import 'package:mdigits/common/default_appbar.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(context: context),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

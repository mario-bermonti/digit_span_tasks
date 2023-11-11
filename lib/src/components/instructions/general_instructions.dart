import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/components/ui_components/screen.dart';
import 'package:mdigits/src/components/ui_components/spacing_holder.dart';

class GeneralInstructions extends StatelessWidget {
  final Widget children;

  const GeneralInstructions({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Screen(
      children: Column(
        children: [
          children,
          const BetweenWidgetsSpace(),
          ElevatedButton(
            onPressed: () => Get.back(),
            child: Text(
              'Comenzar',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ],
      ),
    );
  }
}

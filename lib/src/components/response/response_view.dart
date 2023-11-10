import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/components/response/response_widget.dart';
import 'package:mdigits/src/components/response/response_controller.dart';
import 'package:mdigits/src/components/ui_components/screen.dart';

/// Screen for collecting response from participant
class ResponseView extends StatelessWidget {
  final ResponseController _responseController = Get.put(ResponseController());

  ResponseView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Screen(
        children: ResponseWidget(responseController: _responseController),
      ),
    );
  }
}

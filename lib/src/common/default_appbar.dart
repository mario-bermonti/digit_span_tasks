import 'package:flutter/material.dart';
import 'package:mdigits/src/common/constants.dart';

/// Custom app bar that shows that can show predefined action buttons
createAppBar({required BuildContext context, bool showActionButtons = false}) {
  return AppBar(
    title: const Text(appBarTitle),
    automaticallyImplyLeading: false,
    centerTitle: true,
    // actions: showActionButtons ? createActionButtons(context: context) : null,
  );
}

// List<Widget> createActionButtons({required BuildContext context}) {
//   List<Widget> actionButtons = <Widget>[
//     IconButton(
//       icon: const Icon(Icons.home),
//       tooltip: 'Inicio',
//       onPressed: (() => Get.to(MyHomePage())),
//     ),
//   ];
//   return actionButtons;
// }

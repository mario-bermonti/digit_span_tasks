import 'package:flutter/material.dart';
import 'package:mdigits/src/components/common/constants.dart';

/// Custom app bar that shows that can show predefined action buttons
createAppBar({required BuildContext context, bool showActionButtons = false}) {
  return AppBar(
    title: const Text(appBarTitle),
    automaticallyImplyLeading: false,
    centerTitle: true,
  );
}

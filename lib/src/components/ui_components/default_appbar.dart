import 'package:flutter/material.dart';
import 'package:digit_span_tasks/src/components/ui_components/constants.dart';

/// Custom app bar that shows that can show predefined action buttons
createAppBar({required BuildContext context, bool showActionButtons = false}) {
  return AppBar(
    title: const Text(appBarTitle),
    automaticallyImplyLeading: false,
    centerTitle: true,
  );
}

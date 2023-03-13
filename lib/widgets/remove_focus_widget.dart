import 'package:flutter/material.dart';

class RemoveFocusWidget extends StatelessWidget {
  final Widget child;
  const RemoveFocusWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: child,
    );
  }
}

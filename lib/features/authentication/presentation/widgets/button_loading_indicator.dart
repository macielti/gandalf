import 'package:flutter/material.dart';

class ButtonLoadingIndicator extends StatelessWidget {
  const ButtonLoadingIndicator({
    this.loading = false,
    required this.onPressed,
    required this.child,
  });

  final bool loading;
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: !loading
            ? ElevatedButton(
                onPressed: onPressed,
                child: child,
              )
            : CircularProgressIndicator());
  }
}

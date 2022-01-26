import 'package:flutter/cupertino.dart';

class Tapable extends StatelessWidget {
  const Tapable({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);
  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      minSize: 0,
      onPressed: onTap,
      padding: EdgeInsets.zero,
      child: child,
    );
  }
}

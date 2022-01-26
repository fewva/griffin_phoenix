import 'package:flutter/cupertino.dart';
import 'package:griffin_phoenix/theme/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    this.child,
    this.label,
    this.onPressed,
  })  : assert(
          label == null || child == null,
          'Cannot provide both a child and a label\n',
        ),
        super(key: key);

  final Widget? child;
  final String? label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      minSize: 0,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      borderRadius: BorderRadius.circular(6),
      color: AppColors.greyButtonBackground,
      child: child != null
          ? child!
          : Text(
              label!,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.green,
                fontWeight: FontWeight.w600,
              ),
            ),
    );
  }
}

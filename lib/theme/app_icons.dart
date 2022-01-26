import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  AppIcons._();
  static const String logo = 'assets/icons/logo.svg';
  static const String telegram = 'assets/icons/telegram.svg';
  static const String vkontakte = 'assets/icons/vkontakte.svg';
}

class AppImages {
  AppImages._();
  static const String logo = 'assets/images/logo.png';
}

class AppIcon extends StatelessWidget {
  const AppIcon({
    Key? key,
    required this.icon,
    this.color,
    this.height,
    this.width,
    this.isPng = false,
  }) : super(key: key);

  final String icon;
  final Color? color;
  final double? height;
  final double? width;
  final bool isPng;

  @override
  Widget build(BuildContext context) {
    // Unfortunately, flutter svg does not support all svg files
    // Therefore, there will be support for png icons as well
    return isPng
        ? Image.asset(
            icon,
            color: color,
            height: height,
            width: width,
          )
        : SvgPicture.asset(
            icon,
            color: color,
            height: height,
            width: width,
          );
  }
}

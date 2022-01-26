import 'package:flutter/material.dart';

class ExpandableAppBar extends StatefulWidget {
  ExpandableAppBar({Key? key}) : super(key: key);

  @override
  State<ExpandableAppBar> createState() => _ExpandableAppBarState();
}

class _ExpandableAppBarState extends State<ExpandableAppBar> {
  double _height = 100;

  void _onTap() {
    print('_onTap');
    _height == 100 ? _height = 300 : _height = 100;
    print('_height: ${_height}');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedSize(
        duration: const Duration(milliseconds: 200),
        child: Container(
          color: Colors.red,
          height: _height,
          child: Row(
            children: [
              Text('ИБ-1802'),
              IconButton(
                onPressed: _onTap,
                icon: Icon(Icons.menu),
              )
            ],
          ),
        ),
      ),
    );
  }
}

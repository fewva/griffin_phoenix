import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:griffin_phoenix/presentation/views/select_role_view/groups.dart';
import 'package:griffin_phoenix/presentation/views/select_role_view/select_role_viewmodel.dart';
import 'package:griffin_phoenix/theme/app_colors.dart';
import 'package:griffin_phoenix/theme/app_icons.dart';
import 'package:stacked/stacked.dart';

final TextStyle _roleTextStyle = TextStyle(
  fontSize: 16,
  height: 19.57 / 16,
  color: AppColors.black,
  fontWeight: FontWeight.w500,
);

class SelectRoleView extends StatelessWidget {
  const SelectRoleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ViewModelBuilder<SelectRoleViewModel>.reactive(
                viewModelBuilder: () => SelectRoleViewModel(),
                onModelReady: (model) => model.onReady(),
                builder: (context, model, child) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top -
                        MediaQuery.of(context).padding.bottom -
                        MediaQuery.of(context).padding.vertical -
                        56,
                    child: Column(
                      children: [
                        const SizedBox(height: 76),
                        const AppIcon(
                          icon: AppImages.logo,
                          width: 131.77,
                          isPng: true,
                        ),
                        const SizedBox(height: 55),
                        ValueListenableBuilder(
                          valueListenable: model.currentPage,
                          builder: (context, int value, child) => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 147,
                                child: CupertinoButton(
                                  minSize: 0,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  pressedOpacity: 0.85,
                                  child: Text(
                                    'Я студент',
                                    style: _roleTextStyle.copyWith(
                                      color:
                                          value == 0 ? AppColors.green : null,
                                    ),
                                  ),
                                  onPressed: () => model.changePage(0),
                                ),
                              ),
                              SizedBox(
                                width: 140,
                                child: CupertinoButton(
                                  minSize: 0,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  pressedOpacity: 0.85,
                                  child: Text(
                                    'Я преподаватель',
                                    style: _roleTextStyle.copyWith(
                                      color:
                                          value == 1 ? AppColors.green : null,
                                    ),
                                  ),
                                  onPressed: () => model.changePage(1),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.fromLTRB(33, 47, 32, 20),
                          margin: const EdgeInsets.only(left: 16, right: 16),
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      AppColors.shadowColor.withOpacity(0.25),
                                  blurRadius: 18,
                                ),
                              ]),
                          child: SizedBox(
                            height: 100,
                            child: PageView.builder(
                              itemCount: 2,
                              controller: model.pageController,
                              itemBuilder: (context, index) {
                                const String hintText = 'Группа';

                                final TextEditingController _contr =
                                    TextEditingController();

                                return ExpandableTextField(
                                  controller: _contr,
                                  hintText: hintText,
                                  items: groups,
                                  onChanged: (value) {},
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 56),
                        SizedBox(
                          width: 134,
                          child: CupertinoButton(
                            borderRadius: BorderRadius.circular(6),
                            padding: EdgeInsets.zero,
                            pressedOpacity: 0.7,
                            child: const Text(
                              'ВОЙТИ',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                height: 1.45,
                                fontSize: 16,
                              ),
                            ),
                            color: AppColors.green,
                            onPressed: () {},
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        const Text(
                          'Нужна помощь?',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.grey,
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CupertinoButton(
                              minSize: 0,
                              padding: const EdgeInsets.all(12),
                              pressedOpacity: 0.7,
                              child: const AppIcon(icon: AppIcons.telegram),
                              onPressed: () {},
                            ),
                            const SizedBox(width: 12),
                            CupertinoButton(
                              minSize: 0,
                              pressedOpacity: 0.7,
                              padding: const EdgeInsets.all(12),
                              child: const AppIcon(icon: AppIcons.vkontakte),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class ExpandableTextField extends StatefulWidget {
  const ExpandableTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final List<String> items;
  final ValueChanged<String> onChanged;

  @override
  State<ExpandableTextField> createState() => _ExpandableTextFieldState();
}

class _ExpandableTextFieldState extends State<ExpandableTextField> {
  List filteredItems = [];

  void _onChanged(String val) {
    filteredItems.clear();
    val = val.toLowerCase().replaceAll(' ', '');
    if (val.isNotEmpty) {
      filteredItems.addAll(widget.items
          .where((element) => element.toLowerCase().contains(val.toLowerCase()))
          .toList());
    }
    print('filteredItems: ${filteredItems}');
    setState(() {});
  }

  void _onSelect(String val) {
    widget.controller.text = val;
    widget.controller.selection = TextSelection.collapsed(offset: val.length);
    filteredItems.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextField(
          onChanged: _onChanged,
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hintText,
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.shadowColor),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.yellow),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.green),
            ),
          ),
        ),
        Offstage(
          offstage: filteredItems.isEmpty,
          child: AnimatedOpacity(
            opacity: filteredItems.isEmpty ? 0 : 1,
            duration: const Duration(milliseconds: 150),
            child: Container(
              height: 50,
              // width: 100,
              margin: const EdgeInsets.only(top: 45),
              color: AppColors.white,
              // color: Colors.red,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  return CupertinoButton(
                    padding: EdgeInsets.zero,
                    minSize: 0,
                    child: Text(
                      filteredItems[index],
                      style: const TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      _onSelect(filteredItems[index]);
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:griffin_phoenix/internal/domain/services/select_role/i_select_role_service.dart';
import 'package:griffin_phoenix/internal/utils/extensions/theme.dart';
import 'package:griffin_phoenix/models/role/irole.dart';
import 'package:griffin_phoenix/presentation/views/select_role_view/select_role_viewmodel.dart';
import 'package:griffin_phoenix/theme/app_colors.dart';
import 'package:griffin_phoenix/theme/app_icons.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

const TextStyle _roleTextStyle = TextStyle(
  fontSize: 16,
  height: 19.57 / 16,
  color: AppColors.black,
  fontWeight: FontWeight.w500,
);

class SelectRoleView extends StatelessWidget {
  const SelectRoleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).isDarkTheme;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ViewModelBuilder<SelectRoleViewModel>.reactive(
                viewModelBuilder: () => SelectRoleViewModel(
                  context.read<ISelectRoleService>(),
                ),
                onModelReady: (model) => model.onReady(),
                builder: (context, model, child) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top -
                        MediaQuery.of(context).padding.bottom -
                        MediaQuery.of(context).padding.vertical,
                    child: Column(
                      children: [
                        const SizedBox(height: 76),
                        const AppIcon(
                          icon: AppImages.logo,
                          height: 185,
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
                                    'imStudent',
                                    style: _roleTextStyle.copyWith(
                                      color:
                                          value == 0 ? AppColors.green : null,
                                    ),
                                  ).tr(),
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
                                    'imTeacher',
                                    style: _roleTextStyle.copyWith(
                                      color:
                                          value == 1 ? AppColors.green : null,
                                    ),
                                  ).tr(),
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
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? AppColors.white
                                    : Colors.black45,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: !isDarkTheme
                                ? [
                                    BoxShadow(
                                      blurRadius: 18,
                                      color: AppColors.shadowColor
                                          .withOpacity(0.25),
                                    ),
                                  ]
                                : null,
                          ),
                          child: SizedBox(
                            height: 100,
                            child: PageView.builder(
                              itemCount: 2,
                              controller: model.pageController,
                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  return ExpandableTextField(
                                    hintText: tr('group'),
                                    items: model.groupList,
                                    onChanged: model.onGroupChanged,
                                    controller: model.groupTextController,
                                    onSelect: model.selectGroup,
                                  );
                                } else {
                                  return ExpandableTextField(
                                    hintText: tr('teacher'),
                                    items: model.teacherList,
                                    onChanged: model.onTeacherChanged,
                                    controller: model.teacherTextController,
                                    onSelect: model.selectTeacher,
                                  );
                                }
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
                            color: AppColors.green,
                            onPressed: () => model.onSignInPressed(context),
                            child: Text(
                              tr('signIn').toUpperCase(),
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                height: 1.45,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        const Text(
                          'needHelp?',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.grey,
                            fontSize: 16,
                          ),
                        ).tr(),
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
    required this.onSelect,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final List<IRole> items;
  final ValueChanged<String> onChanged;
  final ValueChanged<IRole> onSelect;

  @override
  State<ExpandableTextField> createState() => _ExpandableTextFieldState();
}

class _ExpandableTextFieldState extends State<ExpandableTextField> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextField(
          onChanged: widget.onChanged,
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hintText,
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.shadowColor),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.yellow),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.green),
            ),
          ),
        ),
        Offstage(
          offstage: widget.items.isEmpty,
          child: AnimatedOpacity(
            opacity: widget.items.isEmpty ? 0 : 1,
            duration: const Duration(milliseconds: 150),
            child: Container(
              height: 50,
              // width: 100,
              margin: const EdgeInsets.only(top: 45),
              color: AppColors.white,
              // color: Colors.red,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  return CupertinoButton(
                    padding: EdgeInsets.zero,
                    minSize: 0,
                    child: Text(
                      widget.items[index].name!,
                      style: const TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      widget.onSelect(widget.items[index]);
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

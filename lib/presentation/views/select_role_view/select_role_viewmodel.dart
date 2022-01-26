import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:griffin_phoenix/internal/domain/network/core_api.dart';
import 'package:griffin_phoenix/internal/domain/services/select_role_service.dart';
import 'package:griffin_phoenix/internal/locator.dart';
import 'package:griffin_phoenix/internal/navigation/app_router.gr.dart';
import 'package:griffin_phoenix/models/role/group/group.dart';
import 'package:griffin_phoenix/models/role/i_role.dart';
import 'package:griffin_phoenix/models/role/teacher/teacher.dart';
import 'package:griffin_phoenix/presentation/shared/app_button.dart';
import 'package:griffin_phoenix/theme/app_colors.dart';
import 'package:stacked/stacked.dart';

class SelectRoleViewModel extends BaseViewModel {
  final _service = locator<SelectRoleService>();

  final TextEditingController groupTextController = TextEditingController();
  final TextEditingController teacherTextController = TextEditingController();

  ValueNotifier<int> currentPage = ValueNotifier<int>(0);
  PageController pageController = PageController();

  List<Group> groupList = [];
  List<Teacher> teacherList = [];

  Role? selectedRole;

  void changePage(int page) {
    // currentPage.value = page;
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 150), curve: Curves.easeIn);
  }

  void onReady() {
    pageController.addListener(() {
      currentPage.value = pageController.page!.toInt();
    });
  }

  void selectGroup(Role group) {
    selectedRole = group;
    groupTextController
      ..text = group.name!
      ..selection = TextSelection.collapsed(offset: group.name!.length);
    groupList.clear();
    notifyListeners();
  }

  void selectTeacher(Role teacher) {
    selectedRole = teacher;
    teacherTextController
      ..text = teacher.name!
      ..selection = TextSelection.collapsed(offset: teacher.name!.length);
    teacherList.clear();
    notifyListeners();
  }

  Future onGroupChanged(String val) async {
    if (val.replaceAll(' ', '').isNotEmpty) {
      final searchResult = await _service.searchForGroup(name: val);
      if (searchResult != null) groupList = searchResult;
    } else {
      groupList.clear();
    }
    notifyListeners();
  }

  Future onTeacherChanged(String val) async {
    if (val.replaceAll(' ', '').isNotEmpty) {
      final searchResult = await _service.searchForTeacher(name: val);
      if (searchResult != null) teacherList = searchResult;
    } else {
      teacherList.clear();
    }
    notifyListeners();
  }

  Future<void> onSignInPressed(BuildContext context) async {
    if (selectedRole == null) {
      await showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        isScrollControlled: true,
        enableDrag: false,
        builder: (context) {
          return Container(
            height: 210,
            decoration: BoxDecoration(
              // color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                const SizedBox(height: 40),
                const Text(
                  'selectGroupOrTeacher',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    height: 19.57 / 16,
                  ),
                ).tr(),
                const SizedBox(height: 28),
                AppButton(
                  label: tr('close').toUpperCase(),
                  onPressed: () {
                    AutoRouter.of(context).current;
                    print(
                        'AutoRouter.of(context).current: ${AutoRouter.of(context).current}');
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        },
      );
    }
  }
}

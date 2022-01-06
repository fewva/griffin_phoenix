import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

class SelectRoleViewModel extends BaseViewModel {
  ValueNotifier<int> currentPage = ValueNotifier<int>(0);

  PageController pageController = PageController();

  void changePage(int page) {
    // currentPage.value = page;
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 150), curve: Curves.easeIn);
  }

  void onReady() {
    print('onReady: ${onReady}');
    pageController.addListener(() {
      currentPage.value = pageController.page!.toInt();
      print('currentPage: ${currentPage}');
    });
    print('currentPage: ${currentPage}');
  }
}

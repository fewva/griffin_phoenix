import 'package:auto_route/auto_route.dart';
import 'package:backdrop/backdrop.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:griffin_phoenix/internal/constants/constants.dart';
import 'package:griffin_phoenix/internal/domain/services/lessons/i_lessons_service.dart';
import 'package:griffin_phoenix/internal/navigation/app_router.gr.dart';
import 'package:griffin_phoenix/internal/utils/extensions/date_time.dart';
import 'package:griffin_phoenix/internal/utils/extensions/theme.dart';
import 'package:griffin_phoenix/internal/utils/lesson_type_colors.dart';
import 'package:griffin_phoenix/models/lesson/lesson/lesson.dart';
import 'package:griffin_phoenix/presentation/shared/custom_calendar_date_picker.dart';
import 'package:griffin_phoenix/presentation/shared/tapable.dart';
import 'package:griffin_phoenix/presentation/views/lessons_view/lessons_view_model.dart';
import 'package:griffin_phoenix/theme/app_colors.dart';
import 'package:griffin_phoenix/theme/text_styles.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

class LessonsView extends StatelessWidget {
  final int? groupId;
  final int? teacherId;

  const LessonsView({
    Key? key,
    this.groupId,
    this.teacherId,
  })  : assert(
          groupId != null || teacherId != null,
          'groupId != null || teacherId != null',
        ),
        super(key: key);

  bool get _isForTeachers => teacherId != null;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => LessonsViewModel(
        context.read<ILessonsService>(),
        groupId: groupId,
        teacherId: teacherId,
      ),
      onModelReady: (LessonsViewModel model) async => model.onReady(),
      builder: (context, LessonsViewModel model, child) {
        return BackdropScaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          frontLayerBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
          backLayerBackgroundColor: Theme.of(context).backgroundColor,
          stickyFrontLayer: true,
          maintainBackLayerState: false,
          frontLayerScrim: Theme.of(context).backgroundColor.withOpacity(0.3),
          appBar: AppBar(
            title: GestureDetector(
              onTap: () {
                Backdrop.of(context).toString();
              },
              child: Text(
                model.lessons?.isNotEmpty ?? false
                    ? _isForTeachers
                        ? model.lessons![0].teacher!
                        : model.lessons![0].group!
                    : '',
              ),
            ),
            actions: <Widget>[
              BackdropToggleButton(
                color: Theme.of(context).iconTheme.color!,
              ),
            ],
          ),
          frontLayerBorderRadius: BorderRadius.circular(0),
          backLayer: model.lessons != null
              ? BackLayer(
                  lessons: model.lessons,
                  onDateChanged: model.onDateChanged,
                  nextIndex: model.nextIndex,
                )
              : const SizedBox(),
          // backLayerBackgroundColor: AppColors.white,
          frontLayer: Builder(
            builder: (_) {
              if (model.lessons?.isNotEmpty ?? false) {
                final List<Lesson> lessons = model.lessons!;
                bool isNewDate = false;

                return ScrollablePositionedList.builder(
                  itemCount: lessons.length,
                  initialScrollIndex: model.nextIndex!,
                  itemScrollController: model.scrollController,
                  padding: const EdgeInsets.only(bottom: 20),
                  itemBuilder: (context, index) {
                    final Lesson lesson = lessons[index];
                    final Lesson? prevLesson =
                        index != 0 ? lessons[index - 1] : null;
                    if (lesson.date != prevLesson?.date) {
                      isNewDate = true;
                    } else {
                      isNewDate = false;
                    }

                    return Column(
                      children: [
                        Offstage(
                          offstage: !isNewDate,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 17,
                              bottom: index == model.nextIndex ? 15 : 33,
                              // bottom:
                              //     index == model.nextIndex ? 15 : 33,
                            ),
                            child: Text(
                              lesson.date.toReadableDate!,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                        ),
                        if (!isNewDate) const SizedBox(height: 12),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          padding: EdgeInsets.only(
                            left: 14,
                            right: 14,
                            top: index == model.nextIndex ? 20 : 0,
                            bottom: index == model.nextIndex ? 25 : 17,
                            // top: 20,
                            // bottom: 25,
                          ),
                          decoration: index == model.nextIndex &&
                                  model.showNextPair
                              // decoration: index == model.nextIndex || 1 == 1
                              ? BoxDecoration(
                                  color: Theme.of(context).backgroundColor,
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: Theme.of(context).isDarkTheme
                                      ? null
                                      : [
                                          BoxShadow(
                                            color: AppColors.shadowColor
                                                .withOpacity(0.25),
                                            blurRadius: 18,
                                          )
                                        ],
                                )
                              : null,
                          width: MediaQuery.of(context).size.width - 32,
                          child: IntrinsicHeight(
                            child: Row(
                              children: [
                                Container(
                                  width: 3,
                                  decoration: BoxDecoration(
                                    color: lessonTypeToColor(
                                      lesson.lessonType,
                                      index: index,
                                      nextIndex: model.nextIndex,
                                      isDarkTheme:
                                          Theme.of(context).isDarkTheme,
                                    ),
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _TypeAndTime(
                                        lesson: lesson,
                                        index: index,
                                        nextIndex: model.nextIndex ?? 0,
                                      ),
                                      const SizedBox(height: 8),
                                      if (lesson.subject != null)
                                        Text(
                                          lesson.subject!,
                                          style: TextStyles.osnova,
                                        ),
                                      _PlaceText(lesson: lesson),
                                      if (!_isForTeachers &&
                                          lesson.teacher != null)
                                        Tapable(
                                          onTap: () {
                                            AutoRouter.of(context).push(
                                              LessonsViewRoute(
                                                teacherId: lesson.teacherId,
                                              ),
                                            );
                                          },
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 15),
                                            child: Text(
                                              lesson.teacher!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption,
                                            ),
                                          ),
                                        ),
                                      if (_isForTeachers &&
                                          lesson.groups != null)
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15),
                                          child: Wrap(
                                            children: List.generate(
                                              lesson.groups!.length,
                                              (i) => Tapable(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    right: 5,
                                                  ),
                                                  child: Text(
                                                    lesson.groups?[i].name ??
                                                        '',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption,
                                                  ),
                                                ),
                                                onTap: () {
                                                  AutoRouter.of(context).push(
                                                    LessonsViewRoute(
                                                      groupId:
                                                          lesson.groups?[i].id,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
              if (model.lessons != null && model.lessons!.isEmpty) {
                return Center(
                  child: const Text(
                    'noSchedule',
                    style: TextStyle(fontSize: 20),
                  ).tr(),
                );
              }

              return const LessonsShimmer();
            },
          ),
        );
      },
    );
  }
}

class BackLayer extends StatelessWidget {
  const BackLayer({
    Key? key,
    required this.lessons,
    required this.onDateChanged,
    required this.nextIndex,
  }) : super(key: key);

  final List<Lesson>? lessons;
  final int? nextIndex;
  final ValueChanged<DateTime> onDateChanged;

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: lessons == null || lessons!.isEmpty,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Theme(
          data: Theme.of(context).copyWith(
            textTheme: Theme.of(context).textTheme.copyWith(
                  caption: const TextStyle(
                    fontFamily: Constants.font,
                    fontWeight: FontWeight.w400,
                  ),
                ),
          ),
          child: CustomCalendarDatePicker(
            initialDate: lessons?[nextIndex ?? 0].date ?? DateTime.now(),
            firstDate: lessons?.first.date ?? DateTime.now(),
            lastDate: lessons?.last.date ?? DateTime.now(),
            currentDate: DateTime.now(),
            onDateChanged: onDateChanged,
            selectableDayPredicate: (day) {
              final res = lessons!.indexWhere(
                (Lesson element) => element.date.onTheSameDay(day),
              );

              return res != -1;
            },
          ),
        ),
      ),
    );
  }
}

class _TypeAndTime extends StatelessWidget {
  const _TypeAndTime({
    Key? key,
    required this.lesson,
    required this.index,
    required this.nextIndex,
  }) : super(key: key);

  final Lesson lesson;
  final int index;
  final int nextIndex;

  String? _formatedTime(String? start, String? end) {
    if (start != null && end != null) {
      return '${start.substring(0, 5)} - ${end.substring(0, 5)}';
    }
    if (start != null) return start.substring(0, 5);
    if (end != null) return end.substring(0, 5);
  }

  String? get addictionalData => [
        if (lesson.isElective ?? false) tr('choice').toUpperCase(),
        if (lesson.note != null) '  ${lesson.note}',
        // 'ДОТ ВАЫРЛО АВЫПРОАПМИЫВО'
      ].join(', ');

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        if (lesson.lessonType != null)
          Text(
            lesson.lessonType!.toUpperCase(),
            style: TextStyle(
              fontSize: 13,
              height: 15.9 / 13,
              fontWeight: FontWeight.w600,
              color: lessonTypeToColor(
                lesson.lessonType,
                index: index,
                nextIndex: nextIndex,
                isDarkTheme: Theme.of(context).isDarkTheme,
              ),
            ),
          ),
        const SizedBox(width: 13),
        Text(
          (_formatedTime(
                    lesson.startTime,
                    lesson.endTime,
                  ) ??
                  '') +
              '    ',
          style: const TextStyle(
            fontSize: 13,
            height: 15.9 / 13,
            // color: AppColors.blackText,
            fontWeight: FontWeight.w600,
          ),
        ),
        // if (lesson.note != null)
        //   Text(
        //     lesson.note!,
        //     style: TextStyle(
        //       fontSize: 13,
        //       height: 15.9 / 13,
        //       fontWeight: FontWeight.w500,
        //       // color: AppColors.grey,
        //     ),
        //   ),
        // if (lesson.isElective ?? false)
        Text(
          addictionalData ?? '',
          style: const TextStyle(
            fontSize: 13,
            height: 15.9 / 13,
            fontWeight: FontWeight.w500,
            // color: AppColors.grey,
          ),
        ),
      ],
    );
  }
}

class _PlaceText extends StatelessWidget {
  const _PlaceText({
    Key? key,
    required this.lesson,
  }) : super(key: key);

  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: lesson.audience == null && lesson.building == null,
      child: Padding(
        padding: const EdgeInsets.only(top: 18),
        child: Wrap(
          children: [
            if (lesson.audience != null)
              Text(
                lesson.building != null
                    ? '${lesson.audience}  —  '
                    : lesson.audience,
                style: const TextStyle(
                  fontSize: 13,
                  height: 15.85 / 13,
                  color: AppColors.blackText,
                  fontWeight: FontWeight.w600,
                ),
              ),
            if (lesson.building != null)
              Text(
                lesson.building!,
                style: const TextStyle(
                  fontSize: 13,
                  height: 15.9 / 13,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class LessonsShimmer extends StatelessWidget {
  const LessonsShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(seconds: 3),
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Container(
                height: 24,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
            const SizedBox(height: 13),
            Container(
              height: 160,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 18,
                    color: const Color(0xffA7B4CC).withOpacity(0.25),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 160,
              margin: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

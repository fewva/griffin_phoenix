                // return ScrollablePositionedList.separated(
                //   itemCount: lessons.length,
                //   initialScrollIndex: model.nextIndex!,
                //   padding: const EdgeInsets.symmetric(vertical: 20),
                //   itemBuilder: (context, index) {
                //     final Lesson lesson = lessons[index];
                //     if (lastDate != lesson.date) {
                //       lastDate = lesson.date;
                //       isNewDate = true;
                //     } else {
                //       isNewDate = false;
                //     }

                //     return Column(
                //       children: [
                //         if (isNewDate)
                //           Text(
                //             lesson.date.toReadableDate!,
                //             style: const TextStyle(
                //               fontSize: 20,
                //               color: AppColors.green,
                //               fontWeight: FontWeight.w600,
                //             ),
                //           ),
                //         SizedBox(
                //           height: index + 1 == model.nextIndex ? 15 : 35,
                //         ),
                //         Container(
                //           margin: const EdgeInsets.symmetric(horizontal: 16),
                //           padding: EdgeInsets.only(
                //             left: 14,
                //             right: 14,
                //             top: index == model.nextIndex ? 20 : 0,
                //             bottom: index == model.nextIndex ? 25 : 0,
                //           ),
                //           decoration: index == model.nextIndex
                //               ? BoxDecoration(
                //                   color: AppColors.white,
                //                   borderRadius: BorderRadius.circular(6),
                //                   boxShadow: [
                //                     BoxShadow(
                //                       color: AppColors.shadowColor
                //                           .withOpacity(0.25),
                //                       blurRadius: 18,
                //                     )
                //                   ],
                //                 )
                //               : null,
                //           width: MediaQuery.of(context).size.width - 32,
                //           child: IntrinsicHeight(
                //             child: Row(
                //               children: [
                //                 Container(
                //                   width: 3,
                //                   decoration: BoxDecoration(
                //                     color: lessonTypeToColor(lesson.lessonType),
                //                     borderRadius: BorderRadius.circular(3),
                //                   ),
                //                 ),
                //                 const SizedBox(width: 10),
                //                 Flexible(
                //                   child: Column(
                //                     crossAxisAlignment:
                //                         CrossAxisAlignment.start,
                //                     children: [
                //                       Wrap(
                //                         children: [
                //                           if (lesson.lessonType != null)
                //                             Text(
                //                               lesson.lessonType!.toUpperCase(),
                //                               style: TextStyle(
                //                                 fontSize: 13,
                //                                 height: 15.9 / 13,
                //                                 fontWeight: FontWeight.w600,
                //                                 color: lessonTypeToColor(
                //                                   lesson.lessonType,
                //                                 ),
                //                               ),
                //                             ),
                //                           const SizedBox(width: 13),
                //                           Text(
                //                             _formatedTime(
                //                                   lesson.startTime,
                //                                   lesson.endTime,
                //                                 ) ??
                //                                 '',
                //                             style: const TextStyle(
                //                               fontSize: 13,
                //                               height: 15.9 / 13,
                //                               color: AppColors.blackText,
                //                               fontWeight: FontWeight.w600,
                //                             ),
                //                           )
                //                         ],
                //                       ),
                //                       const SizedBox(height: 8),
                //                       if (lesson.subject != null)
                //                         Flexible(
                //                           child: Text(
                //                             lesson.subject!,
                //                             style: TextStyles.osnova,
                //                           ),
                //                         ),
                //                       _PlaceText(lesson: lesson),
                //                       const SizedBox(height: 15),
                //                       if (lesson.teacher != null)
                //                         Text(
                //                           lesson.teacher!,
                //                           style: const TextStyle(
                //                             fontSize: 13,
                //                             height: 15.9 / 13,
                //                             color: AppColors.grey,
                //                             fontWeight: FontWeight.w600,
                //                           ),
                //                         )
                //                     ],
                //                   ),
                //                 )
                //               ],
                //             ),
                //           ),
                //         ),
                //       ],
                //     );
                //   },
                //   separatorBuilder: (context, index) {
                //     if (lastDate != lessons[index].date) {
                //       lastDateForSeparator = lessons[index].date;
                //       isNewDateForSeparator = true;
                //       return const SizedBox(height: 34);
                //     } else {
                //       isNewDateForSeparator = false;
                //       return const SizedBox(height: 8);
                //     }
                //   },
                // );


                
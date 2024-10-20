import '/features/letters/presentation/manager/outgoing_letter_cubit/outgoing_letter_cubit.dart';
import '/features/letters/presentation/manager/outgoing_letter_cubit/outgoing_letter_state.dart';
import '/features/letters/presentation/manager/letters_cubit/letters_cubit.dart';
import '/features/letters/data/models/enum/letter_type_sender.dart';
import '/features/letters/data/models/letter_data/letter_data.dart';
import '/features/letters/data/models/enum/reply_status.dart';
import '/features/letters/data/models/enum/letter_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/show_up_animation.dart';
import '/core/widgets/empty_placeholder.dart';
import '/core/constant/api_end_point.dart';
import '/core/utils/url_open_file.dart';
import '/core/utils/my_date_util.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class OutgoingLettersTable extends StatelessWidget {
  const OutgoingLettersTable({super.key});

  @override
  Widget build(BuildContext context) {
    LettersCubit lettersCubit = BlocProvider.of<LettersCubit>(context);
    OutgoingLetterCubit outgoingLetterCubit =
        BlocProvider.of<OutgoingLetterCubit>(context);
    return ShowUp(
      delay: 1,
      child: BlocBuilder<OutgoingLetterCubit, OutgoingLetterState>(
        builder: (context, state) {
          return Visibility(
            visible: outgoingLetterCubit.searchText.text.isNotEmpty
                ? outgoingLetterCubit.allLettersAfterSearch.isNotEmpty
                : lettersCubit.outgoingLetters.isNotEmpty,
            replacement:
                const EmptyPlaceholder(message: 'لا يوجد خطابات صادرة'),
            child: Table(
              border: TableBorder.all(
                color: AppColors.kPrimaryColor,
              ),
              columnWidths: const {
                5: FixedColumnWidth(85),
                6: FixedColumnWidth(110),
              },
              children: [
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Text(
                          'الرقم',
                          textAlign: TextAlign.center,
                          style: AppStyle.tabTextStyle.copyWith(
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Text(
                          'التاريخ',
                          textAlign: TextAlign.center,
                          style: AppStyle.tabTextStyle.copyWith(
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Text(
                          'الموضوع',
                          textAlign: TextAlign.center,
                          style: AppStyle.tabTextStyle.copyWith(
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Text(
                          "النوع",
                          textAlign: TextAlign.center,
                          style: AppStyle.tabTextStyle.copyWith(
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Text(
                          'حالة الرد',
                          textAlign: TextAlign.center,
                          style: AppStyle.tabTextStyle.copyWith(
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Text(
                          "النموذج",
                          textAlign: TextAlign.center,
                          style: AppStyle.tabTextStyle.copyWith(
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Text(
                          'فعل',
                          textAlign: TextAlign.center,
                          style: AppStyle.tabTextStyle.copyWith(
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ...buildTableOutgoingLettersNewElements(
                  lettersCubit: lettersCubit,
                  outgoingLetterCubit: outgoingLetterCubit,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<TableRow> buildTableOutgoingLettersNewElements({
    required LettersCubit lettersCubit,
    required OutgoingLetterCubit outgoingLetterCubit,
  }) {
    List<TableRow> letters = [];
    List<LetterData> outgoingLetters = [];
    if (outgoingLetterCubit.searchText.text.isEmpty) {
      outgoingLetters = lettersCubit.outgoingLetters;
    } else {
      outgoingLetters = outgoingLetterCubit.allLettersAfterSearch;
    }
    for (var element in outgoingLetters) {
      if (element.letterType == LetterTypeSender.outgoing.name) {
        letters.add(
          TableRow(
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    element.number ?? '--',
                    textAlign: TextAlign.center,
                    style: AppStyle.tabTextStyle,
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    MyDateUtil.convertDateTime(historyAsText: element.date!),
                    textAlign: TextAlign.center,
                    style: AppStyle.tabTextStyle,
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    element.subject ?? '--',
                    textAlign: TextAlign.center,
                    style: AppStyle.tabTextStyle,
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    LetterType.newletter.name == element.type
                        ? 'جديد'
                        : LetterType.replyToLetter.name == element.type
                            ? 'رد علي خطاب'
                            : 'رد مع الاغلاق',
                    textAlign: TextAlign.center,
                    style: AppStyle.tabTextStyle,
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    ReplyStatus.answered.name == element.replyStatus
                        ? 'تم الرد'
                        : 'لم يتم الرد',
                    textAlign: TextAlign.center,
                    style: AppStyle.tabTextStyle,
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: InkWell(
                    onTap: () => UrlOpenFile.openFile(
                      "${APIEndPoint.mediaBaseUrl}${element.letterFile!}",
                    ),
                    child: const Icon(
                      Icons.visibility_outlined,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.edit_outlined,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.delete_outlined,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
    }
    return letters;
  }
}

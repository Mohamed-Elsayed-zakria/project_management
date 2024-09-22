import '../../manager/letters_cubit/letters_cubit.dart';
import '../../manager/letters_cubit/letters_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class IncomingOutgoingLettersHeader extends StatelessWidget {
  const IncomingOutgoingLettersHeader({super.key});

  @override
  Widget build(BuildContext context) {
    LettersCubit cubit = BlocProvider.of<LettersCubit>(context);
    return BlocBuilder<LettersCubit, LettersState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: InkWell(
                onTap: () => cubit.changeIncomingLettersIsActive(),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: cubit.incomingLettersIsActive
                        ? AppColors.kPrimaryColor
                        : null,
                    border: Border.all(
                      color: AppColors.kPrimaryColor,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "الخطابات الواردة",
                    style: AppStyle.tabTextStyle.copyWith(
                      color: cubit.incomingLettersIsActive
                          ? AppColors.kSurfaceColor
                          : null,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: InkWell(
                onTap: () => cubit.changeOutgoingLettersIsActive(),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: cubit.outgoingLettersIsActive
                        ? AppColors.kPrimaryColor
                        : null,
                    border: Border.all(
                      color: AppColors.kPrimaryColor,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "الخطابات الصادرة",
                    style: AppStyle.tabTextStyle.copyWith(
                      color: cubit.outgoingLettersIsActive
                          ? AppColors.kSurfaceColor
                          : null,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

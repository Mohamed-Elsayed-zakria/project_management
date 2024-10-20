import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/boq/presentation/manager/fetch_boq_cubit/fetch_boq_cubit.dart';
import '/features/boq/presentation/manager/fetch_boq_cubit/fetch_boq_state.dart';
import '/core/widgets/accordion/custom_accordion_list.dart';
import '/features/boq/data/models/boq_data/boq_data.dart';
import '/core/widgets/accordion/accordion_items.dart';
import '/core/widgets/accordion/accordion_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import '/core/constant/style.dart';
import 'create_new_boq_table.dart';

class BoqCustomAccordionList extends StatelessWidget {
  final ProjectDetails projectDetails;

  const BoqCustomAccordionList({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchBoqCubit, FetchBoqState>(
      builder: (context, state) {
        FetchBoqCubit cubit = BlocProvider.of<FetchBoqCubit>(context);
        if (state is FetchBoqSuccess) {
          return CustomAccordionList(
            accordionType: AccordionType.sliverList,
            children: _buildAccordionItem(cubit.boqData),
          );
        }
        if (state is FetchBoqFailure) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                state.errMessage,
                style: AppStyle.tabTextStyle,
              ),
            ),
          );
        }
        return const SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: LoadingWidget(),
          ),
        );
      },
    );
  }

  List<AccordionItems> _buildAccordionItem(List<BoqData> item) {
    List<AccordionItems> accordionItems = [];
    for (var index = 0; index < item.length; index++) {
      var element = item[index];
      accordionItems.add(
        AccordionItems(
          title: element.name ?? '--',
          content: CreateNewBoqTable(
            projectDetails: projectDetails,
            boqData: element,
            index: index,
            boqDataList: item,
          ),
        ),
      );
    }
    return accordionItems;
  }
}

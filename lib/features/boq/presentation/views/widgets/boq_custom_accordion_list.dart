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
import 'create_new_boq_table.dart';

class BoqCustomAccordionList extends StatefulWidget {
  final ProjectDetails projectDetails;

  const BoqCustomAccordionList({
    super.key,
    required this.projectDetails,
  });

  @override
  State<BoqCustomAccordionList> createState() => _BoqCustomAccordionListState();
}

class _BoqCustomAccordionListState extends State<BoqCustomAccordionList> {
  late FetchBoqCubit boqCubit;
  @override
  void initState() {
    boqCubit = BlocProvider.of<FetchBoqCubit>(context);
    boqCubit.fetchAllBoq(
      projectId: widget.projectDetails.id!,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchBoqCubit, FetchBoqState>(
      builder: (context, state) {
        if (state is FetchBoqSuccess) {
          List<BoqData> boqData = state.result;
          return CustomAccordionList(
            accordionType: AccordionType.sliverList,
            children: _buildAccordionItem(boqData),
          );
        }
        if (state is FetchBoqFailure) {
          return SliverToBoxAdapter(
            child: Text(state.errMessage),
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
            boqData: element,
            index: index,
          ),
        ),
      );
    }
    return accordionItems;
  }
}

import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/show_projects/presentation/manager/boq_cubit/boq_state.dart';
import '/features/show_projects/presentation/manager/boq_cubit/boq_cubit.dart';
import '/features/show_projects/data/models/boq_data/boq_data.dart';
import '/core/widgets/accordion/custom_accordion_list.dart';
import '/core/widgets/accordion/accordion_items.dart';
import '/core/widgets/accordion/accordion_type.dart';
import 'project_details_primary_table_boq.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

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
  late BoqCubit boqCubit;
  @override
  void initState() {
    boqCubit = BlocProvider.of<BoqCubit>(context);
    boqCubit.fetchAllBoq(
      projectId: widget.projectDetails.id!,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoqCubit, BoqState>(
      builder: (context, state) {
        if (state is BoqSuccess) {
          List<BoqData> boqData = state.result;
          return CustomAccordionList(
            accordionType: AccordionType.sliverList,
            children: _buildAccordionItem(boqData),
          );
        }
        if (state is BoqFailure) {
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
    for (var element in item) {
      accordionItems.add(
        AccordionItems(
          title: element.name ?? '--',
          content: ProjectDetailsPrimaryTableBoq(boqData: element),
        ),
      );
    }
    return accordionItems;
  }
}

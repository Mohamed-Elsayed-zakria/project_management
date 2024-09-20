import '/features/new_project/presentation/manager/new_project_cubit/new_project_cubit.dart';
import '/features/new_project/presentation/manager/new_project_cubit/new_project_state.dart';
import '/core/widgets/custom_list_tile_validator.dart';
import 'new_project_take_project_receipt_date.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'new_project_take_date_po.dart';

class NewProjectTakeData extends StatelessWidget {
  const NewProjectTakeData({super.key});

  @override
  Widget build(BuildContext context) {
    NewProjectCubit blocAccess = BlocProvider.of<NewProjectCubit>(context);
    return BlocBuilder<NewProjectCubit, NewProjectState>(
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is NewProjectLoading,
          child: Form(
            key: blocAccess.formKey,
            child: Column(
              children: [
                CustomFormField(
                  controller: blocAccess.projectName,
                  label: 'اسم المشروع',
                  hintText: 'ادخل اسم المشروع',
                  prefixIcon: const Icon(Icons.folder_copy_outlined),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "مطلوب";
                    } else {
                      return null;
                    }
                  },
                ),
                CustomFormField(
                  controller: blocAccess.projectNumber,
                  label: 'رقم المشروع',
                  hintText: 'ادخل رقم المشروع',
                  prefixIcon: const Icon(Icons.numbers_outlined),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "مطلوب";
                    } else {
                      return null;
                    }
                  },
                ),
                CustomFormField(
                  controller: blocAccess.projectPrice,
                  label: 'مبلغ المشروع',
                  hintText: 'ادخل مبلغ المشروع',
                  prefixIcon: const Icon(Icons.monetization_on_outlined),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "مطلوب";
                    } else {
                      return null;
                    }
                  },
                ),
                CustomFormField(
                  controller: blocAccess.projectDurationPerDay,
                  label: 'مدة المشروع باليوم',
                  hintText: 'ادخل مدة المشروع باليوم',
                  prefixIcon: const Icon(Icons.calendar_month_outlined),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "مطلوب";
                    } else {
                      return null;
                    }
                  },
                ),
                CustomFormField(
                  controller: blocAccess.projectManager,
                  label: "مدير المشروع",
                  hintText: "ادخل مدير المشروع",
                  prefixIcon: const Icon(Icons.person_outline_outlined),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "مطلوب";
                    } else {
                      return null;
                    }
                  },
                ),
                CustomFormField(
                  controller: blocAccess.projectOwner,
                  label: "الجهة المالكة",
                  hintText: "ادخل الجهة المالكة",
                  prefixIcon: const Icon(Icons.business_outlined),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "مطلوب";
                    } else {
                      return null;
                    }
                  },
                ),
                CustomFormField(
                  controller: blocAccess.projectArea,
                  label: "المنطقة",
                  hintText: "ادخل المنطقة",
                  prefixIcon: const Icon(Icons.location_on_outlined),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "مطلوب";
                    } else {
                      return null;
                    }
                  },
                ),
                CustomFormField(
                  controller: blocAccess.projectCity,
                  label: "المدينة",
                  hintText: "ادخل المدينة",
                  prefixIcon: const Icon(Icons.location_on_outlined),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "مطلوب";
                    } else {
                      return null;
                    }
                  },
                ),
                const NewProjectTakeProjectReceiptDate(),
                const NewProjectTakeDatePo(),
                CustomListTileValidator(
                  validator: blocAccess.projectPickFilePoValidator,
                  leading: const Icon(Icons.file_copy_outlined),
                  title: blocAccess.projectFilePo == null
                      ? "ارفاق ملف - PO"
                      : "تم ارفاق الملف",
                  onTap: () => blocAccess.pickFilePo(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'dart:io';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import '/features/new_project/presentation/manager/new_project_cubit/new_project_cubit.dart';
import '/features/new_project/presentation/manager/new_project_cubit/new_project_state.dart';
import '/core/widgets/custom_list_tile_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';

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
                CustomListTileValidator(
                  leading: const Icon(Icons.file_copy_outlined),
                  title: "BOQ - ارفاق ملف المشروع",
                  onTap: () async {
                    await pickAndDisplayExcelFile();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> pickAndDisplayExcelFile() async {
    try {
      // Pick the file
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx'], // Only allow Excel files
      );

      if (result != null) {
        // Get the selected file
        File file = File(result.files.single.path!);

        // Read the Excel file
        var bytes = file.readAsBytesSync();
        var excel = Excel.decodeBytes(bytes);

        // Assuming the first sheet contains the data
        for (var table in excel.tables.keys) {
          var sheet = excel.tables[table]!;

          // Loop through rows and print Item No with Description
          for (var i = 1; i < sheet.rows.length; i++) {
            // Skip header row
            var row = sheet.rows[i];

            // Get Item No and Description, handling any null or invalid data
            var itemNo = row[0]?.value?.toString().trim() ??
                "N/A"; // Assuming first column is 'Item No'
            var description = row[1]?.value?.toString().trim() ??
                "N/A"; // Assuming second column is 'Description'

            // Check if the data is valid (skip empty or invalid rows)
            if (itemNo != "N/A" && description != "N/A") {
              print("بند $itemNo: $description");
            }
          }
        }
      } else {
        // User canceled the picker
        throw Exception("لم يتم اختيار أي ملف");
      }
    } catch (e) {
      print("حدث خطأ أثناء تحميل الملف: $e");
    }
  }
}

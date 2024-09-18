import 'package:flutter/material.dart';
import '/core/constant/colors.dart';

class ProjectInfoViewBody extends StatelessWidget {
  const ProjectInfoViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: 700,
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text("اسم المشروع"),
                      subtitle: const Text("مشروع الانترنت الهوائئ"),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit_outlined,
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text("رقم المشروع"),
                      subtitle: const Text("1234567890"),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit_outlined,
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text("اسم الشركة"),
                      subtitle: const Text("الشركة الرئيسية"),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit_outlined,
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text("مبلغ المشروع"),
                      subtitle: const Text("5000"),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit_outlined,
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text("مدير المشروع"),
                      subtitle: const Text("محمد لسيد"),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit_outlined,
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text("الجهة المالكة"),
                      subtitle: const Text("شركة المستقبل"),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit_outlined,
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text("المنطقة"),
                      subtitle: const Text("المنطقة الرئيسية"),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit_outlined,
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text("المدينة"),
                      subtitle: const Text("المدينة الرئيسية"),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit_outlined,
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text("تاريخ استلام المشروع"),
                      subtitle: const Text("12/12/2022"),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit_outlined,
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text("تاريخ ال - po"),
                      subtitle: const Text("12/12/2022"),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit_outlined,
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

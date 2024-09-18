import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';

class LargeViewMenu extends StatelessWidget {
  final Function(int) onTap;

  const LargeViewMenu({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    int indexScreen = 0;
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 215,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    title: const Text('اسم المستخدم'),
                    leading: const CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.kBackgroundColor,
                      child: Icon(Icons.electric_bolt_rounded),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    onTap: () {
                      indexScreen = 0;
                      onTap(indexScreen);
                    },
                    title: const Text('احصائيات'),
                    leading: const Icon(IconlyBroken.chart),
                  ),
                  ListTile(
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    onTap: () {
                      indexScreen = 1;
                      onTap(indexScreen);
                    },
                    title: const Text('كل المشاريع'),
                    leading: const Icon(IconlyBroken.document),
                  ),
                  ListTile(
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    onTap: () {
                      indexScreen = 2;
                      onTap(indexScreen);
                    },
                    title: const Text('مشروع جديد'),
                    leading: const Icon(IconlyBroken.arrowUpSquare),
                  ),
                  ListTile(
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    onTap: () {
                      indexScreen = 3;
                      onTap(indexScreen);
                    },
                    title: const Text('الملف الشخصي'),
                    leading: const Icon(IconlyBroken.profile),
                  ),
                  ListTile(
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    onTap: () {
                      indexScreen = 4;
                      onTap(indexScreen);
                    },
                    title: const Text('الاعدادات'),
                    leading: const Icon(IconlyBroken.setting),
                  ),
                ],
              ),
            ),
            ListTile(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              onTap: () {},
              title: const Text('تسجيل الخروج'),
              leading: const Icon(IconlyBroken.logout),
            ),
          ],
        ),
      ),
    );
  }
}

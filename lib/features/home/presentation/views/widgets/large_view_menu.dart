import 'package:flutter_iconly/flutter_iconly.dart';
import '/core/services/auth_services.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/routes/app_pages.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class LargeViewMenu extends StatelessWidget {
  final Function(int) onTap;
  final int currentIndex;

  const LargeViewMenu({
    super.key,
    required this.onTap,
    required this.currentIndex,
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
                    selected: currentIndex == 0,
                    selectedTileColor: Colors.grey[300],
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
                    selected: currentIndex == 1,
                    selectedTileColor: Colors.grey[300],
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
                    selected: currentIndex == 2,
                    selectedTileColor: Colors.grey[300],
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
                    selected: currentIndex == 3,
                    selectedTileColor: Colors.grey[300],
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
                    selected: currentIndex == 4,
                    selectedTileColor: Colors.grey[300],
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
              onTap: () => _showLogoutDialog(context),
              title: const Text('تسجيل الخروج'),
              leading: const Icon(IconlyBroken.logout),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          title: const Text(
            "تأكيد الخروج",
            style: TextStyle(fontSize: 18),
          ),
          content: const Text(
            "هل تريد تسجيل الخروج؟",
            style: AppStyle.kTextStyle16,
          ),
          contentPadding: const EdgeInsets.fromLTRB(24, 22, 24, 6),
          actionsPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 10,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                AuthServices.logout();
                AppPages.offAll(
                  path: AppRoutes.login,
                  context: context,
                );
              },
              child: const Text("نعم"),
            ),
            TextButton(
              onPressed: () => AppPages.back(context),
              child: const Text("الغاء"),
            ),
          ],
        );
      },
    );
  }
}

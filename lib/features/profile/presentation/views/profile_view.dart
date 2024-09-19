import '/features/profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/profile_personal_picture.dart';
import 'package:flutter/material.dart';
import '/core/constant/style.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: Card(
        color: Colors.white,
        elevation: 3,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 700,
                    ),
                    child: const Column(
                      children: [
                        SizedBox(height: 10),
                        Text(
                          "الصورة الشخصية",
                          style: AppStyle.kTextStyle20,
                        ),
                        ProfilePersonalPicture(),
                        Divider(),
                        ListTile(
                          title: Text(
                            'اسم المستخدم',
                            style: AppStyle.tabTextStyle,
                          ),
                          subtitle: Text('محمد محمد'),
                        ),
                        Divider(),
                        ListTile(
                          title: Text(
                            'رقم الهاتف',
                            style: AppStyle.tabTextStyle,
                          ),
                          subtitle: Text('0123456789'),
                        ),
                        Divider(),
                        ListTile(
                          title: Text(
                            "البريد الالكتروني",
                            style: AppStyle.tabTextStyle,
                          ),
                          subtitle: Text('pT7pY@example.com'),
                        ),
                        Divider(),
                        ListTile(
                          title: Text(
                            "الرقم الوظيفي",
                            style: AppStyle.tabTextStyle,
                          ),
                          subtitle: Text('0123456789'),
                        ),
                        Divider(),
                        ListTile(
                          title: Text(
                            "المهنة",
                            style: AppStyle.tabTextStyle,
                          ),
                          subtitle: Text("عامل"),
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

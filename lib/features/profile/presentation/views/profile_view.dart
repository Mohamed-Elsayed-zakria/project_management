import '/features/profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/profile_personal_picture.dart';
import '/core/models/user_credentials.dart';
import '/core/services/auth_services.dart';
import 'package:flutter/material.dart';
import '/core/constant/style.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    UserCredentials? credentials = AuthServices.readCredentials();
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
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          "الصورة الشخصية",
                          style: AppStyle.kTextStyle20,
                        ),
                        const ProfilePersonalPicture(),
                        const Divider(),
                        ListTile(
                          title: const Text(
                            'اسم المستخدم',
                            style: AppStyle.tabTextStyle,
                          ),
                          subtitle: Text(credentials?.username ?? '--'),
                        ),
                        const Divider(),
                        const ListTile(
                          title: Text(
                            'رقم الهاتف',
                            style: AppStyle.tabTextStyle,
                          ),
                          subtitle: Text('0123456789'),
                        ),
                        const Divider(),
                        ListTile(
                          title: const Text(
                            "البريد الالكتروني",
                            style: AppStyle.tabTextStyle,
                          ),
                          subtitle: Text(credentials?.email ?? '--'),
                        ),
                        const Divider(),
                        const ListTile(
                          title: Text(
                            "الرقم الوظيفي",
                            style: AppStyle.tabTextStyle,
                          ),
                          subtitle: Text('0123456789'),
                        ),
                        const Divider(),
                        const ListTile(
                          title: Text(
                            "المهنة",
                            style: AppStyle.tabTextStyle,
                          ),
                          subtitle: Text("عامل"),
                        ),
                        const Divider(),
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

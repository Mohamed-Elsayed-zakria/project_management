import '/features/profile/presentation/manager/cubit/profile_cubit.dart';
import '/features/profile/presentation/manager/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/core/constant/assets.dart';
import '/core/constant/colors.dart';

class ProfilePersonalPicture extends StatelessWidget {
  const ProfilePersonalPicture({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        //  ProfileCubit cubit = BlocProvider.of<ProfileCubit>(context);
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: CircleAvatar(
            radius: 65,
            backgroundColor: AppColors.kOnSurfaceColor,
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(Assets.avater),
              backgroundColor: AppColors.kSurfaceColor,
            ),
            // backgroundColor: blocAccess.addDetailsImgPath == null
            //     ? AppColors.kOnSurfaceColor
            //     : AppColors.kPrimaryColor,
            // child: blocAccess.addDetailsImgPath == null
            // ? CircleAvatar(
            //     radius: 85,
            //     backgroundImage: AssetImage(Assets.avater),
            //     backgroundColor: AppColors.kSurfaceColor,
            //   )
            //     : ClipOval(
            //         child: Image.file(
            //           blocAccess.addDetailsImgPath!,
            //           width: 170,
            //           height: 170,
            //           fit: BoxFit.cover,
            //         ),
            //       ),
          ),
        );
      },
    );
  }
}

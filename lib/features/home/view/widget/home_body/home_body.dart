import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/styles/app_border_radius.dart';
import '../../../../../core/utils/styles/app_colors.dart';
import '../../../../../core/utils/styles/app_images.dart';
import '../../../../../core/utils/styles/app_strings.dart';
import '../../../../../core/utils/styles/app_styles_text.dart';
import '../../../view-model/navigationbar_cubit.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocBuilder<NavigationBarCubit, int>(
      builder: (context, state) {
        return [
          ClipRRect(
            borderRadius: BorderRadius.all(AppBorderRadius.circular10),
            child: SizedBox(
              width: size.width - 30,
              height: size.height - size.height / 5 - 135,
              child: Center(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: (size.height - size.height / 5 - 135) / 35),
                      child: Material(
                        child: ListTile(
                          minVerticalPadding: 4,
                          // horizontalTitleGap: 0,
                          minLeadingWidth: 60,
                          title: Text(AppStrings.homeTitle[index]),
                          subtitle: Text(AppStrings.homeSubtitle[index]),
                          leading: SvgPicture.asset(
                            AppImages.homeImage[index],
                            height: 60,
                          ),
                          trailing: CircleAvatar(
                              maxRadius: 15,
                              backgroundColor: AppColors.primaryColor,
                              child: Icon(
                                Icons.navigate_next,
                                color: AppColors.blueMedium,
                              )),
                          textColor: AppColors.primaryColor,
                          iconColor: AppColors.primaryColor,
                          tileColor: AppColors.blueMedium,
                          titleTextStyle: AppTextStyles.text22,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(AppBorderRadius.circular10),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Text('')
        ][state];
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quicksummary/resources/color_manager.dart';

import '../../../repository/user_details.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/string_manager.dart';
import '../../../resources/textStyle_manager.dart';

// ignore: non_constant_identifier_names
AppBar Appbar() {
  return AppBar(
      title: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: NetworkImage(UserDetail.imageUrl!),
            backgroundColor: ColorManager.lightGreen,
            onBackgroundImageError: (exception, stackTrace) {
              debugPrint(exception.toString());
            },
          ),
          const SizedBox(
            width: 15,
          ),
          SizedBox(
            height: 45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringManager.greeting,
                  style: getRegularTextStyle(
                      fontSize: FontSizeManager.f14,
                      color: ColorManager.darkFontcolor),
                ),
                Text(
                  UserDetail.userName!,
                )
              ],
            ),
          )
        ],
      ),
      actions: [
        Icon(
          Icons.dark_mode,
          color: ColorManager.darkBgPrimary,
        ),
        const SizedBox(
          width: 20,
        )
      ]);
}

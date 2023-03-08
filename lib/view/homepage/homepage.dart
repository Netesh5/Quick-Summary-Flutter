import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quicksummary/data/network/network_service.dart';
import 'package:quicksummary/repository/user_details.dart';
import 'package:quicksummary/resources/color_manager.dart';
import 'package:quicksummary/resources/font_manager.dart';
import 'package:quicksummary/resources/string_manager.dart';
import 'package:quicksummary/resources/textStyle_manager.dart';

import 'package:quicksummary/resources/value_manger.dart';
import 'package:quicksummary/services/firebase_service/firebase_auth.dart';
import 'package:quicksummary/utils/loading_indicator.dart';
import 'package:quicksummary/utils/routes/routes_name.dart';

import 'widgets/appbar.dart';
import 'widgets/input_field.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserDetail(context: context).getUserDetail();
    return Scaffold(
      backgroundColor: ColorManager.lightBGWhiteColor,
      appBar: Appbar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Text(
              StringManager.appName,
              style: GoogleFonts.ubuntu(
                textStyle: getRegularTextStyle(
                    fontSize: FontSizeManager.f28,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.darkBgPrimary),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Textformfield().InputField(),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Textformfield().minLength(context),
              //Textformfield().maxLength(context),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(PaddingManager.p12),
            child: Text(StringManager.experiment,
                style: TextStyle(
                    fontSize: FontSizeManager.f10,
                    color: ColorManager.lightGrey)),
          ),
          const SizedBox(
            height: 100,
          ),
          Center(
              child: SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    backgroundColor: ColorManager.lightGreen),
                onPressed: () async {
                  if (Textformfield.formkey.currentState!.validate() &
                      Textformfield.formkey2.currentState!.validate()) {
                    LoadingIndicator().summarizeloading();
                    await NetworkService()
                        .getPostApiResponse(Inputvalue.value)
                        .then((value) => Navigator.pushNamed(
                            context, RoutesName.resultScreen));
                  }
                },
                child: LoadingIndicator().isLoading
                    ? LoadingIndicator().loading()
                    : Text(
                        StringManager.summerize,
                        style: getRegularTextStyle(
                            fontSize: FontSizeManager.f18,
                            color: ColorManager.white),
                      )),
          )),
          IconButton(
              onPressed: () async {
                await AuthService().googleLogOut(context);
              },
              icon: const Icon(
                Icons.logout,
              ))
        ],
      ),
    );
  }
}

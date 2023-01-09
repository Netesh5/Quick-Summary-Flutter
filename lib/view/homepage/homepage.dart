import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quicksummary/data/network/network_service.dart';
import 'package:quicksummary/repository/user_details.dart';
import 'package:quicksummary/resources/color_manager.dart';
import 'package:quicksummary/resources/font_manager.dart';
import 'package:quicksummary/resources/string_manager.dart';
import 'package:quicksummary/resources/textStyle_manager.dart';
import 'package:quicksummary/services/firebase_service/firebase_auth.dart';

import 'widgets/appbar.dart';

class Homepage extends StatelessWidget {
  TextEditingController controller = TextEditingController();

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
            child: TextFormField(
              controller: controller,
              cursorColor: ColorManager.lightGreen,
              decoration: const InputDecoration(
                label: Text(StringManager.labelText),
              ),
              minLines: 5,
              maxLines: 20,
              onChanged: (value) {
                Inputvalue.value = controller.text;
              },
            ),
          ),
          const SizedBox(
            height: 20,
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
                  final result = await NetworkService()
                      .getPostApiResponse(Inputvalue.value);
                  debugPrint(result.toString());
                },
                child: Text(
                  StringManager.summerize,
                  style: getRegularTextStyle(
                      fontSize: FontSizeManager.f18, color: ColorManager.white),
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

class Inputvalue {
  static String value = "";
}

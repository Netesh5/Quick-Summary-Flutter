import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:quicksummary/resources/color_manager.dart';
import 'package:quicksummary/resources/font_manager.dart';
import 'package:quicksummary/resources/string_manager.dart';
import 'package:quicksummary/resources/textstyle_manager.dart';
import 'package:quicksummary/services/firebase_service/firebase_auth.dart';
import 'package:rive/rive.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(children: [
        const RiveAnimation.asset(
          "assets/rive/flowers.riv",
          fit: BoxFit.cover,
        ),
        Positioned.fill(
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
          child: const SizedBox(),
        )),
        SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Text(
                  StringManager.appName,
                  style: GoogleFonts.ubuntu(
                      textStyle: getRegularTextStyle(
                          fontSize: FontSizeManager.f50,
                          fontWeight: FontWeightManager.bold,
                          color: ColorManager.white)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Text(
                  StringManager.about,
                  style: GoogleFonts.ubuntu(
                    textStyle: getRegularTextStyle(
                        fontSize: FontSizeManager.f14,
                        color: ColorManager.white),
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                  width: 300,
                  height: 60,
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          backgroundColor: ColorManager.lightGreen),
                      onPressed: () async {
                        await AuthService().googleSignIn(context);
                      },
                      icon: Icon(
                        FontAwesomeIcons.google,
                        color: ColorManager.white,
                      ),
                      label: Text(
                        StringManager.continuewithgoogle,
                        style: getRegularTextStyle(
                            fontSize: FontSizeManager.f18,
                            color: ColorManager.white),
                      ))),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ]),
    );
  }
}

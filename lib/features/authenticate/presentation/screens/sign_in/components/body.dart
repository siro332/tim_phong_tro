import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tim_phong_tro/components/no_account_text.dart';
import 'package:tim_phong_tro/components/social_card.dart';
import 'package:tim_phong_tro/features/authenticate/presentation/bloc/authentication_bloc.dart';

import '../../../../../../constants.dart';
import '../../../../../../size_config.dart';
import 'sign_in_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: SizeConfig.screenHeight * 0.04,
              ),
              Text(
                "Welcome Back",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Sign in with your email and password \nor continue with social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.08,
              ),
              SignInForm(),
              SizedBox(
                height: SizeConfig.screenHeight * 0.08,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {
                        BlocProvider.of<AuthenticationBloc>(context)
                            .add(LoginWithGoogle());
                      }),
                  SocialCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {
                        BlocProvider.of<AuthenticationBloc>(context)
                            .add(LoginWithFacebook());
                      }),
                  SocialCard(icon: "assets/icons/twitter.svg", press: () {}),
                ],
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.08,
              ),
              NoAccountText()
            ],
          ),
        ),
      ),
    ));
  }
}

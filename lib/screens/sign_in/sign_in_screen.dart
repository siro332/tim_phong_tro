import 'package:flutter/material.dart';
import 'package:tim_phong_tro/size_config.dart';

import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
      resizeToAvoidBottomInset: false,
    );
  }
}

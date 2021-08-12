import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tim_phong_tro/features/authenticate/presentation/bloc/authentication_bloc.dart';

import '../../components/custom_appbar.dart';
import '../../constants.dart';
import '../user/user_screen.dart';
import 'components/general.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = "/home";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> listWidgets = [General(), General(), UserScreen(), UserScreen()];
  List<BarItem> listBarItems = [
    BarItem(
        text: "General", iconData: FontAwesomeIcons.city, color: kPrimaryColor),
    BarItem(
        text: "Save", iconData: FontAwesomeIcons.heart, color: kPrimaryColor),
    BarItem(
        text: "Inbox",
        iconData: FontAwesomeIcons.commentDots,
        color: kPrimaryColor),
    BarItem(text: "User", iconData: FontAwesomeIcons.user, color: kPrimaryColor)
  ];
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AuthenticationBloc>(context).add(CurrentUser());
    return Scaffold(
        body: getBody(selectedIndex),
        bottomNavigationBar: CustomBottomAppBar(
            barItems: listBarItems,
            onBarTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            }));
  }

  Widget getBody(index) {
    return listWidgets[index];
  }
}

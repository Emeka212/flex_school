import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import '../routes/routes.dart' as route;
import '../components/public_variables.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});
  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onCreate(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

//======================================================================
// RUN FUNCTION EVERYTIME PAGE BUILD
//======================================================================
onCreate({required BuildContext context}) async {
  //=============================================
  PublicVariables.parentDB = Hive.box("parent");
  PublicVariables.schoolUserDB = Hive.box("schoolUser");
  PublicVariables.isDarkThemeDB = Hive.box("isDarkTheme");
  PublicVariables.schoolDetails = Hive.box("schoolDetails");

  //======================================================================
  // CHECK THEME DATA
  //======================================================================
  if (PublicVariables.isDarkThemeDB.isEmpty) {
    PublicVariables.isDarkThemeDB.put(0, false);
  }

  //======================================================================
  // Navigate To Process Page If Both UserDB & ParentDB Are Empty
  //======================================================================
  if (PublicVariables.schoolUserDB.isEmpty &&
      PublicVariables.parentDB.isEmpty) {
    Navigator.pushReplacementNamed(context, route.processPage);
  }

  //======================================================================
  // Check If UserDB Value is True
  //======================================================================
  if (PublicVariables.schoolUserDB.get(0) == true) {
    Navigator.pushReplacementNamed(context, route.userLoginPage);
    return;
  }

  //======================================================================
  // Check If ParentDB Value is True
  //======================================================================
  if (PublicVariables.parentDB.get(0) == true) {
    Navigator.pushReplacementNamed(context, route.parentLoginPage);
    return;
  }
}

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
  void dispose() {
    Hive.close();
    super.dispose();
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
  Box<String> userDb = Hive.box("user");
  Box<String> parentDb = Hive.box("parent");
  Box<bool> themeDb = Hive.box("isDarkTheme");

  //======================================================================
  // CHECK THEME DATA
  //======================================================================
  if (themeDb.isEmpty) {
    themeDb.add(false);
    PublicVariables.isDarkTheme = themeDb.getAt(0) as bool;
  } else {
    PublicVariables.isDarkTheme = themeDb.getAt(0) as bool;
  }

  //======================================================================
  // Check If UserDB Is Empty
  //======================================================================
  if (userDb.isNotEmpty) {
    Navigator.pushReplacementNamed(context, route.userLoginPage);
    return;
  }

  //======================================================================
  // Check If ParentDB Is Empty
  //======================================================================
  if (parentDb.isNotEmpty) {
    Navigator.pushReplacementNamed(context, route.parentLoginPage);
    return;
  }

  //======================================================================
  // Navigate To Process Page If Both UserDB & ParentDB Are Empty
  //======================================================================
  Navigator.pushReplacementNamed(context, route.processPage);
}

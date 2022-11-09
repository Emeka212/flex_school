import '../pages/index.dart';
import '../pages/error.dart';
import '../pages/process.dart';
import 'package:flutter/material.dart';
import '../pages/users_dashboard/login.dart';
import '../pages/parent_dashboard/login.dart';

//======================================================================
// Global Context
//======================================================================
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

//======================================================================
// Other Page String Name
//======================================================================
const String indexPage = "indexPage";
const String errorPage = "errorPage";
const String processPage = "processPage";

//======================================================================
// Users Pages String
//======================================================================
const String userLoginPage = "userLoginPage";
const String userForgotPasswordPage = "userForgotPasswordPage";

//======================================================================
// Parents Pages Strings
//======================================================================
const String parentLoginPage = "parentLoginPage";
const String parentForgotPasswordPage = "parentForgotPasswordPage";

//======================================================================
// controller function with switch statement to countrol page route flow
//======================================================================
Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case indexPage:
      return MaterialPageRoute(builder: (context) => const IndexPage());
    case processPage:
      return MaterialPageRoute(builder: (context) => const ProcessPage());
    case userLoginPage:
      return MaterialPageRoute(builder: (context) => const UserLoginPage());
    case parentLoginPage:
      return MaterialPageRoute(builder: (context) => const ParentLoginPage());
    default:
      return MaterialPageRoute(builder: (context) => const ErrorPage());
  }
}

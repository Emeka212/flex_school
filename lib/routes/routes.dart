import '../pages/index.dart';
import '../pages/error.dart';
import '../pages/process.dart';
import 'package:flutter/material.dart';
import '../pages/users_dashboard/dashboard/settings/entries_definition.dart';
import '../pages/users_dashboard/dashboard/settings/invoice_receipt_settings.dart';
import '../pages/users_dashboard/dashboard/settings/parameters.dart';
import '../pages/users_dashboard/dashboard/settings/result_settings.dart';
import '../pages/users_dashboard/dashboard/settings/time_table_management.dart';
import '../pages/users_dashboard/dashboard/student/generate_student_result.dart';
import '../pages/users_dashboard/dashboard/student/gradute_stop_student_admission.dart';
import '../pages/users_dashboard/dashboard/student/parent_managemen.dart';
import '../pages/users_dashboard/dashboard/student/record_scores.dart';
import '../pages/users_dashboard/dashboard/student/student_ativities.dart';
import '../pages/users_dashboard/dashboard/student/student_attendance.dart';
import '../pages/users_dashboard/dashboard/student/student_invoice.dart';
import '../pages/users_dashboard/dashboard/student/student_management.dart';
import '../pages/users_dashboard/dashboard/student/student_promotion.dart';
import '../pages/users_dashboard/dashboard/student/student_receipts.dart';
import '../pages/users_dashboard/login.dart';
import '../pages/parent_dashboard/login.dart';
import '../pages/users_dashboard/dashboard/index.dart';
import '../pages/users_dashboard/dashboard/reports/list_student.dart';
import '../pages/users_dashboard/dashboard/notification/email_sms.dart';
import '../pages/users_dashboard/dashboard/reports/print_prefects.dart';
import '../pages/users_dashboard/dashboard/reports/print_debtors_list.dart';
import '../pages/users_dashboard/dashboard/notification/calender_event_notice.dart';

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
// School Users Pages String
//======================================================================
const String userLoginPage = "userLoginPage";
const String schoolUserIndexPage = "schoolUserIndexPage";
const String schoolUserEmailSmsPage = "schoolUserEmailSmsPage";
const String userForgotPasswordPage = "userForgotPasswordPage";
const String schoolUserParametersPage = "schoolUserParametersPage";
const String schoolUserListStudentPage = "schoolUserListStudentPage";
const String schoolUserRecordScoresPage = "schoolUserRecordScoresPage";
const String schoolUserPrintPrefectsPage = "schoolUserPrintPrefectsPage";
const String schoolUserStudentReceiptPage = "schoolUserStudentReceiptPage";
const String schoolUserStudentInvoicePage = "schoolUserStudentInvoicePage";
const String schoolUserResultSettingsPage = "schoolUserResultSettingsPage";
const String schoolUserPrintDeborsListPage = "schoolUserPrintDeborsListPage";
const String schoolUserStudentManagementPage = "schoolUserSudenManagementPage";
const String schoolUserParentManagementPage = "schoolUserParentManagementPage";
const String schoolUserStudentPromotionPage = "schoolUserStudentPromotionPage";
const String schoolUserEntriesDefinitionPage =
    "schoolUserEntriesDefinitionPage";
const String schoolUserStudentActivitiesPage =
    "schoolUserStudentActivitiesPage";
const String schoolUserStudentAttendancePage =
    "schoolUserStudentAttendancePage";
const String schoolUserCalenderEvenNoticePage =
    "schoolUserCalenderEvenNoticePage";
const String schoolUserTimeTableManagementPage =
    "schoolUserTimeTableManagementPage";
const String schoolUserInvoiceReceiptSettingPage =
    "schoolUserInvoiceReceiptSettingPage";
const String schoolUserGenerateStudentResultPage =
    "schoolUserGenerateStudentResultPage";
const String schoolUserGraduteStopStudentAdmissionPage =
    "schoolUserGraduteStopStudentAdmissionPage";

//======================================================================
// Parents Pages Strings
//======================================================================
const String parentLoginPage = "parentLoginPage";
const String parentForgotPasswordPage = "parentForgotPasswordPage";

//======================================================================
// controller function with switch statement to countrol page route flow
//======================================================================
Route<dynamic> controller(RouteSettings settings) {
  Widget route;
  switch (settings.name) {
    case indexPage:
      route = const IndexPage();
      break;
    case processPage:
      route = const ProcessPage();
      break;
    case userLoginPage:
      route = const UserLoginPage();
      break;
    case parentLoginPage:
      route = const ParentLoginPage();
      break;
    case schoolUserIndexPage:
      route = const SchoolUserIndexPage();
      break;
    case schoolUserEmailSmsPage:
      route = const SchoolUserEmailSmsPage();
      break;
    case schoolUserParametersPage:
      route = const SchoolUserParametersPage();
      break;
    case schoolUserListStudentPage:
      route = const SchoolUserListStudentPage();
      break;
    case schoolUserRecordScoresPage:
      route = const SchoolUserRecordScoresPage();
      break;
    case schoolUserPrintPrefectsPage:
      route = const SchoolUserPrintPrefectsPage();
      break;
    case schoolUserStudentReceiptPage:
      route = const SchoolUserStudentReceiptPage();
      break;
    case schoolUserResultSettingsPage:
      route = const SchoolUserResultSettingsPage();
      break;
    case schoolUserStudentInvoicePage:
      route = const SchoolUserStudentInvoicePage();
      break;
    case schoolUserPrintDeborsListPage:
      route = const SchoolUserPrintDeborsListPage();
      break;
    case schoolUserParentManagementPage:
      route = const SchoolUserParentManagementPage();
      break;
    case schoolUserStudentPromotionPage:
      route = const SchoolUserStudentPromotionPage();
      break;
    case schoolUserStudentManagementPage:
      route = const SchoolUserStudentManagementPage();
      break;
    case schoolUserEntriesDefinitionPage:
      route = const SchoolUserEntriesDefinitionPage();
      break;
    case schoolUserStudentActivitiesPage:
      route = const SchoolUserStudentActivitiesPage();
      break;
    case schoolUserStudentAttendancePage:
      route = const SchoolUserStudentAttendancePage();
      break;
    case schoolUserCalenderEvenNoticePage:
      route = const SchoolUserCalenderEvenNoticePage();
      break;
    case schoolUserTimeTableManagementPage:
      route = const SchoolUserTimeTableManagementPage();
      break;
    case schoolUserGenerateStudentResultPage:
      route = const SchoolUserGenerateStudentResultPage();
      break;
    case schoolUserInvoiceReceiptSettingPage:
      route = const SchoolUserInvoiceReceiptSettingPage();
      break;
    case schoolUserGraduteStopStudentAdmissionPage:
      route = const SchoolUserGraduteStopStudentAdmissionPage();
      break;
    default:
      route = const ErrorPage();
      break;
  }
  return MaterialPageRoute(
    settings: const RouteSettings(name: userLoginPage),
    builder: (context) => route,
  );
}

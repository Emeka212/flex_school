import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../routes/routes.dart' as route;
import 'package:flex_school/theme/theme.dart';

//======================================================================
// PUBLIC APP BAR WIDGET
//======================================================================
class PublicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? color;
  final String title;
  final PreferredSizeWidget? bottom;
  const PublicAppBar({super.key, required this.title, this.color, this.bottom});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      bottom: bottom,
      title: Text(title),
      backgroundColor: color ?? AppTheme().primaryColor,
      actions: [
        PublicIconButton(
          icon: const Icon(Icons.person_pin),
          onPressed: (val) {},
        ),
        PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return const [
              PopupMenuItem(
                child: PublicTextWidget(text: "Entries Definition"),
              ),
              PopupMenuItem(
                child: PublicTextWidget(text: "Parameters"),
              ),
              PopupMenuItem(
                child: PublicTextWidget(text: "Result Settings"),
              ),
              PopupMenuItem(
                child: PublicTextWidget(text: "Invoice / Receipt Settings"),
              ),
              PopupMenuItem(
                child: PublicTextWidget(text: "Time Table Management"),
              ),
            ];
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(kToolbarHeight, kToolbarHeight);
}

//======================================================================
// PUBLIC TEXT FEILD WIDGET
//======================================================================
class PublicTextFeild extends StatelessWidget {
  final String hint;
  final bool? readOnly;
  final Widget suffixIcon;
  final Function? onTap;
  final TextEditingController controller;
  const PublicTextFeild({
    super.key,
    this.readOnly,
    required this.hint,
    required this.suffixIcon,
    required this.controller,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0),
      decoration: BoxDecoration(
        color: AppTheme().lightDark,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        controller: controller,
        readOnly: readOnly ?? false,
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          hintStyle: const TextStyle(fontSize: 14.0, height: 1.6),
        ),
        onTap: () {
          if (onTap == null) return;
          onTap!();
        },
      ),
    );
  }
}

//======================================================================
// PUBLIC TEXT BUTTON WIDGET
//======================================================================
class PublicTextButton extends StatelessWidget {
  final String value;
  final double? width;
  final Color? color;
  final ValueChanged onPressed;
  const PublicTextButton({
    super.key,
    this.width,
    this.color,
    required this.value,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: color ?? AppTheme().primaryColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextButton(
        child: PublicTextWidget(
          text: value,
          color: AppTheme().lightDark,
        ),
        onPressed: () => onPressed(''),
      ),
    );
  }
}

//===============================================
// PUBLIC DATE PICKER TEXT FEILD WIDGET
//===============================================
class PublicDatePickerWidget extends StatelessWidget {
  final TextEditingController controller;
  const PublicDatePickerWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    controller.text.isEmpty
        ? controller.text = DateFormat('yyyy-MM-dd').format(DateTime.now())
        : "";
    return PublicTextFeild(
      hint: "hint",
      readOnly: true,
      controller: controller,
      suffixIcon: const Icon(Icons.calendar_month_rounded),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          lastDate: DateTime.now(),
          firstDate: DateTime(2015),
          initialDate: DateTime.now(),
        );
        if (pickedDate == null) return;
        controller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      },
    );
  }
}

//===============================================
// PUBLIC DROPDOWN WIDGET
//===============================================
class PublicDropdownWidget extends StatelessWidget {
  final List items;
  final List values;
  final String hint;
  final double? width;
  final double? height;
  final String? selectedValue;
  final ValueChanged onSelect;
  const PublicDropdownWidget({
    super.key,
    this.width,
    this.height,
    required this.hint,
    required this.items,
    required this.values,
    required this.onSelect,
    required this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50.0,
      width: width ?? double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        color: AppTheme().lightDark,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: DropdownButton(
        isExpanded: true,
        value: selectedValue,
        hint: PublicTextWidget(text: hint),
        underline: const SizedBox(),
        items: [
          for (int i = 0; i < items.length; i++)
            DropdownMenuItem(
              value: values[i].toString(),
              child: Text(items[i].toString()),
            )
        ],
        onChanged: (String? currentValue) => onSelect('$currentValue'),
      ),
    );
  }
}

//======================================================================
// PUBLIC ICON BUTTON WIDGET
//======================================================================
class PublicIconButton extends StatelessWidget {
  final Widget icon;
  final ValueChanged onPressed;
  const PublicIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onPressed(''),
      icon: icon,
    );
  }
}

//======================================================================
// PUBLIC TEXT BUTTON WIDGET
//======================================================================
class PublicTextWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeignt;
  const PublicTextWidget({
    super.key,
    this.color,
    this.fontSize,
    this.fontWeignt,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeignt ?? FontWeight.normal,
        fontSize: fontSize ?? 15.0,
        color: color ?? AppTheme().textColor,
      ),
    );
  }
}

//======================================================================
// PUBLIC CKECK BOX WIDGET
//======================================================================
class PublicCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onPressed;
  const PublicCheckBox({
    super.key,
    required this.value,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16.0,
      width: 16.0,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        child: Checkbox(
          onChanged: (bool? val) => onPressed(val as bool),
          value: value,
        ),
      ),
    );
  }
}

//=========================================================
// PUBLIC SNACKBAR WIDGET
//=========================================================
class PublicSnackBar extends SnackBar {
  const PublicSnackBar({
    Key? key,
    required super.content,
    super.margin = const EdgeInsets.all(15.0),
    super.behavior = SnackBarBehavior.floating,
    super.backgroundColor = const Color(0xff1e1c24),
  }) : super(key: key);
}

//=========================================================
// PUBLIC PROGRESS BAR WIDGET
//=========================================================
class PublicProgressBar {
  // PUBLIC PROGRESS BAR WIDGET
  show() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        barrierDismissible: false,
        context: route.navigatorKey.currentContext as BuildContext,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: Center(
              child: Container(
                width: 50.0,
                height: 50.0,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: AppTheme().bgColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: CircularProgressIndicator(color: AppTheme().brandColor),
              ),
            ),
          );
        },
      );
    });
  }

  // PUBLIC PROGRESS BAR WIDGET
  remove() {
    Navigator.of(route.navigatorKey.currentContext as BuildContext).pop();
  }
}

//=========================================================
// PUBLIC NON OPTIONAL ALERT DIALOG
//=========================================================
class PublicNonOptionalAlertDialog {
  show({required String title, required String content}) {
    showDialog(
      context: route.navigatorKey.currentContext as BuildContext,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          titlePadding: const EdgeInsets.all(10),
          contentPadding: const EdgeInsets.all(10),
          actionsPadding: const EdgeInsets.all(0),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}

//=========================================================
// PUBLIC DRAWER WIDGET
//=========================================================
class PublicDrawerWidget extends StatelessWidget {
  const PublicDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> itemList = [
      {
        "title": "Student",
        "items": [
          {
            "title": "Student Management",
            "route": route.schoolUserStudentManagementPage
          },
          {
            "title": "Student Activities",
            "route": route.schoolUserStudentActivitiesPage
          },
          {
            "title": "Parent Management",
            "route": route.schoolUserParentManagementPage
          },
          {"title": "Record Scores", "route": route.schoolUserRecordScoresPage},
          {
            "title": "Generate Student Results",
            "route": route.schoolUserGenerateStudentResultPage
          },
          {
            "title": "Student Promotion",
            "route": route.schoolUserStudentPromotionPage
          },
          {
            "title": "Student Invoice",
            "route": route.schoolUserStudentInvoicePage
          },
          {
            "title": "Student Receipt",
            "route": route.schoolUserStudentReceiptPage
          },
          {
            "title": "Graduate / Stop Student Admission",
            "route": route.schoolUserGraduteStopStudentAdmissionPage
          },
          {
            "title": "Student Attendance",
            "route": route.schoolUserStudentAttendancePage
          },
        ],
      },
      {
        "title": "Reports",
        "items": [
          {"title": "List Students", "route": route.schoolUserListStudentPage},
          {
            "title": "Print Debtors List",
            "route": route.schoolUserPrintDeborsListPage
          },
          {
            "title": "Print Prefects",
            "route": route.schoolUserPrintPrefectsPage
          },
        ],
      },
      {
        "title": "Notifications",
        "items": [
          {"title": "Email / SMS", "route": route.schoolUserEmailSmsPage},
          {
            "title": "Calendar/Events/Notice",
            "route": route.schoolUserCalenderEvenNoticePage
          }
        ],
      },
      {
        "title": "Log out",
        "items": [
          {"title": "Log out"}
        ],
      },
    ];
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150.0,
              width: double.infinity,
              color: AppTheme().primaryColor,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(20.0),
              child: PublicTextWidget(
                fontSize: 30.0,
                color: AppTheme().bgColor,
                fontWeignt: FontWeight.bold,
                text: "Flex+ School Management",
              ),
            ),
            for (int i = 0; i < itemList.length; i++) ...{
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: PublicTextWidget(
                  fontSize: 18.0,
                  fontWeignt: FontWeight.bold,
                  text: itemList[i]['title'].toString(),
                ),
              ),
              for (int m = 0; m < itemList[i]['items'].length; m++) ...{
                InkWell(
                  onTap: () {
                    if (i == 3) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        route.userLoginPage,
                        ModalRoute.withName(route.indexPage),
                      );
                      return;
                    }
                    Navigator.pushNamed(
                      context,
                      itemList[i]['items'][m]['route'],
                    );
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(10.0),
                    child: PublicTextWidget(
                      text: itemList[i]['items'][m]['title'].toString(),
                    ),
                  ),
                ),
              }
            }
          ],
        ),
      ),
    );
  }
}

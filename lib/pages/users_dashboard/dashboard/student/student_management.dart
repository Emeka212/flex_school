import '../../../../theme/theme.dart';
import 'package:flutter/material.dart';
import '../../../../components/component.dart';

class SchoolUserStudentManagementPage extends StatefulWidget {
  const SchoolUserStudentManagementPage({super.key});
  @override
  State<SchoolUserStudentManagementPage> createState() =>
      _SchoolUserStudentManagementPageState();
}

class _SchoolUserStudentManagementPageState
    extends State<SchoolUserStudentManagementPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: AppTheme().lightDark,
        appBar: const PublicAppBar(title: "Student Management"),
        body: _BodyWidget(setState: (value) => setState(() {})),
      ),
    );
  }
}

//============================================================
// BODY WIDGET
//============================================================
class _BodyWidget extends StatelessWidget {
  final ValueChanged setState;
  const _BodyWidget({required this.setState});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const _Widget1(),
            _Widget2(setState: (value) => setState('')),
          ],
        ),
      ),
    );
  }
}

//============================================================
// TOP WIDGET
//============================================================
class _Widget1 extends StatelessWidget {
  const _Widget1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: AppTheme().bgColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: PublicTextFeild(
                  hint: "Enter Student No Here...",
                  suffixIcon: const Icon(Icons.numbers_rounded),
                  controller: _studentNoSearchController,
                ),
              ),
              const SizedBox(width: 10.0),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Material(
                  color: AppTheme().primaryColor,
                  child: PublicIconButton(
                    icon: Icon(Icons.search_rounded, color: AppTheme().bgColor),
                    onPressed: (val) {},
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              PublicTextButton(
                value: "Save",
                width: 100.0,
                color: Colors.green.shade800,
                onPressed: (val) {},
              ),
              const SizedBox(width: 10.0),
              PublicTextButton(
                value: "Delete",
                width: 100.0,
                color: Colors.red.shade800,
                onPressed: (val) {},
              ),
              const SizedBox(width: 10.0),
              PublicTextButton(
                value: "New",
                width: 100.0,
                onPressed: (val) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//============================================================
// BOTTOM WIDGET
//============================================================
class _Widget2 extends StatelessWidget {
  final ValueChanged setState;
  const _Widget2({required this.setState});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        color: AppTheme().bgColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            child: Material(
              color: AppTheme().primaryColor,
              child: TabBar(
                isScrollable: true,
                indicatorColor: AppTheme().brandColor,
                tabs: const [
                  Tab(text: "Student Details"),
                  Tab(text: "Parent / Guardian Details"),
                  Tab(text: "Images"),
                  Tab(text: "Student Activities"),
                  Tab(text: "Financial Statement"),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 500.0,
            child: TabBarView(
              children: [
                _Tab1(setState: (value) => setState('')),
                const _Tab2(),
                _Tab3(),
                _Tab1(setState: (value) {}),
                _Tab1(setState: (value) {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//============================================================
// TAB 1
//============================================================
class _Tab1 extends StatelessWidget {
  final ValueChanged setState;
  const _Tab1({required this.setState});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> _tab1ItemList = [
      {
        "hint": "Status",
        "type": "textFeild",
        "icon": const Icon(Icons.pending_outlined),
        "controller": _tab1StatusController,
      },
      {
        "hint": "Surname",
        "type": "textFeild",
        "icon": const Icon(Icons.pending_outlined),
        "controller": _tab1SurnameController,
      },
      {
        "hint": "First Name",
        "type": "textFeild",
        "icon": const Icon(Icons.pending_outlined),
        "controller": _tab1FirstNameController,
      },
      {
        "hint": "Other Names",
        "type": "textFeild",
        "icon": const Icon(Icons.pending_outlined),
        "controller": _tab1OtherNameController,
      },
      {
        "hint": "Class",
        "type": "dropDown",
        "selectedValue": _tab1ClassVal,
        "value": ["Basic 1", "Basic 2", "Basic 3"],
        "valueItem": ["Basic 1", "Basic 2", "Basic 3"],
      },
      {
        "hint": "Sub Class",
        "type": "dropDown",
        "selectedValue": _tab1SubClassVal,
        "value": [],
        "valueItem": [],
      },
      {
        "hint": "Date Of Birth",
        "type": "textFeildDatePiker",
        "controller": _tab1DateOfBirthController,
      },
      {
        "hint": "Registration Date",
        "type": "textFeildDatePiker",
        "controller": _tab1RegDateController,
      },
      {
        "hint": "Sex",
        "type": "dropDown",
        "selectedValue": _tab1SexVal,
        "value": ["M", "F"],
        "valueItem": ["Male", "Female"],
      },
      {
        "hint": "Disability",
        "type": "dropDown",
        "selectedValue": _tab1DurabilityVal,
        "value": ["None", "Blind", "Deaf"],
        "valueItem": ["None", "Blind", "Deaf"],
      },
      {
        "hint": "Local Govt Area",
        "type": "dropDown",
        "selectedValue": "",
        "value": [],
        "valueItem": [],
      },
      {
        "hint": "State Of Origin",
        "type": "dropDown",
        "selectedValue": "",
        "value": [],
        "valueItem": [],
      },
      {
        "hint": "Nationality",
        "type": "dropDown",
        "selectedValue": "",
        "value": [],
        "valueItem": [],
      },
      {
        "hint": "Previous School 1",
        "type": "textFeild",
        "icon": const Icon(Icons.pending_outlined),
        "controller": _tab1OtherNameController,
      },
      {
        "hint": "Previous School 2",
        "type": "textFeild",
        "icon": const Icon(Icons.pending_outlined),
        "controller": _tab1OtherNameController,
      },
      {
        "hint": "Previous School 2",
        "type": "textFeild",
        "icon": const Icon(Icons.pending_outlined),
        "controller": _tab1OtherNameController,
      },
      {
        "hint": "Current Balance:",
        "type": "textFeild",
        "icon": const Icon(Icons.pending_outlined),
        "controller": _tab1OtherNameController,
      },
    ];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < _tab1ItemList.length; i++) ...{
              if (_tab1ItemList[i]['type'] == "textFeild") ...{
                PublicTextWidget(text: _tab1ItemList[i]['hint']),
                const SizedBox(height: 5.0),
                PublicTextFeild(
                  hint: _tab1ItemList[i]['hint'],
                  suffixIcon: _tab1ItemList[i]['icon'],
                  controller: _tab1ItemList[i]['controller'],
                ),
                const SizedBox(height: 10.0),
              } else if (_tab1ItemList[i]['type'] == "dropDown") ...{
                PublicTextWidget(text: _tab1ItemList[i]['hint']),
                const SizedBox(height: 5.0),
                PublicDropdownWidget(
                  hint: _tab1ItemList[i]['hint'],
                  values: _tab1ItemList[i]['value'],
                  items: _tab1ItemList[i]['valueItem'],
                  selectedValue: _tab1ItemList[i]['selectedValue'],
                  onSelect: (value) {
                    setState(_tab1ItemList[i]['selectedValue'] = value);
                  },
                ),
                const SizedBox(height: 10.0),
              } else if (_tab1ItemList[i]['type'] == "textFeildDatePiker") ...{
                PublicTextWidget(text: _tab1ItemList[i]['hint']),
                const SizedBox(height: 5.0),
                PublicDatePickerWidget(
                  controller: _tab1ItemList[i]['controller'],
                ),
                const SizedBox(height: 10.0),
              }
            }
          ],
        ),
      ),
    );
  }
}

//============================================================
// TAB 2
//============================================================
class _Tab2 extends StatelessWidget {
  const _Tab2();

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> _tab2ItemList = [
      {
        "hint": "Parent ID",
        "type": "textFeild",
        "icon": const Icon(Icons.pending_outlined),
        "controller": _tab1StatusController,
      },
      {
        "hint": "Title",
        "type": "textFeild",
        "icon": const Icon(Icons.pending_outlined),
        "controller": _tab1StatusController,
      },
      {
        "hint": "Surname Name",
        "type": "textFeild",
        "icon": const Icon(Icons.pending_outlined),
        "controller": _tab1StatusController,
      },
      {
        "hint": "First Name",
        "type": "textFeild",
        "icon": const Icon(Icons.pending_outlined),
        "controller": _tab1StatusController,
      },
      {
        "hint": "Other Names",
        "type": "textFeild",
        "icon": const Icon(Icons.pending_outlined),
        "controller": _tab1StatusController,
      },
      {
        "hint": "Marital Status",
        "type": "textFeild",
        "icon": const Icon(Icons.pending_outlined),
        "controller": _tab1StatusController,
      },
      {
        "hint": "Religion",
        "type": "textFeild",
        "icon": const Icon(Icons.pending_outlined),
        "controller": _tab1StatusController,
      },
      {
        "hint": "Natinality",
        "type": "textFeild",
        "icon": const Icon(Icons.pending_outlined),
        "controller": _tab1StatusController,
      },
      {
        "hint": "State",
        "type": "textFeild",
        "icon": const Icon(Icons.pending_outlined),
        "controller": _tab1StatusController,
      },
      {
        "hint": "Local Govt Area",
        "type": "textFeild",
        "icon": const Icon(Icons.pending_outlined),
        "controller": _tab1StatusController,
      },
      {
        "hint": "Office Address",
        "type": "textFeild",
        "icon": const Icon(Icons.pending_outlined),
        "controller": _tab1StatusController,
      },
      {
        "hint": "Home  Address",
        "type": "textFeild",
        "icon": const Icon(Icons.pending_outlined),
        "controller": _tab1StatusController,
      },
      {
        "hint": "Phone(Primary)",
        "type": "textFeild",
        "icon": const Icon(Icons.pending_outlined),
        "controller": _tab1StatusController,
      },
      {
        "hint": "Phone(Secondary)",
        "type": "textFeild",
        "icon": const Icon(Icons.pending_outlined),
        "controller": _tab1StatusController,
      },
      {
        "hint": "Email(Primary)",
        "type": "textFeild",
        "icon": const Icon(Icons.pending_outlined),
        "controller": _tab1StatusController,
      },
      {
        "hint": "Email(Secondary)",
        "type": "textFeild",
        "icon": const Icon(Icons.pending_outlined),
        "controller": _tab1StatusController,
      },
      {
        "hint": "Fax",
        "type": "textFeild",
        "icon": const Icon(Icons.pending_outlined),
        "controller": _tab1StatusController,
      },
      {
        "hint": "Facebook",
        "type": "textFeild",
        "icon": const Icon(Icons.pending_outlined),
        "controller": _tab1StatusController,
      },
      {
        "hint": "BB PIN",
        "type": "textFeild",
        "icon": const Icon(Icons.pending_outlined),
        "controller": _tab1StatusController,
      },
      {
        "hint": "Twitter",
        "type": "textFeild",
        "icon": const Icon(Icons.pending_outlined),
        "controller": _tab1StatusController,
      },
    ];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < _tab2ItemList.length; i++) ...{
              if (_tab2ItemList[i]['type'] == "textFeild") ...{
                PublicTextWidget(text: _tab2ItemList[i]['hint']),
                const SizedBox(height: 5.0),
                PublicTextFeild(
                  hint: _tab2ItemList[i]['hint'],
                  suffixIcon: _tab2ItemList[i]['icon'],
                  controller: _tab2ItemList[i]['controller'],
                ),
                const SizedBox(height: 10.0),
              }
            }
          ],
        ),
      ),
    );
  }
}

//============================================================
// TAB 3
//============================================================
class _Tab3 extends StatelessWidget {
  const _Tab3({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [],
      ),
    );
  }
}

//============================================================
// REQUIRED VARIABLES
//============================================================
bool? _tab1SexVal;
bool? _tab1ClassVal;
bool? _tab1SubClassVal;
bool? _tab1DurabilityVal;
TextEditingController _studentNoSearchController = TextEditingController();
TextEditingController _tab1DateOfBirthController = TextEditingController();
TextEditingController _tab1FirstNameController = TextEditingController();
TextEditingController _tab1SurnameController = TextEditingController();
TextEditingController _tab1OtherNameController = TextEditingController();
TextEditingController _tab1RegDateController = TextEditingController();
TextEditingController _tab1StatusController = TextEditingController();

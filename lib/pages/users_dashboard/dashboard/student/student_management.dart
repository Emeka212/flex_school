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
            _Widget1(setState: (value) => setState('')),
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
  final ValueChanged setState;
  const _Widget1({required this.setState});

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
                    onPressed: (val) {
                      _voucherLookupBoxVisible = true;
                      setState('');
                    },
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
          Visibility(
            visible: _voucherLookupBoxVisible,
            child: _VoucherLookupBox(setState: (value) => setState('')),
          ),
        ],
      ),
    );
  }
}

//============================================================
// VOUCHER LOOKUP BOX WIDGET
//============================================================
String? _voucherLookupBoxSexVal;
String? _voucherLookupBoxStatusVal;
bool _voucherLookupBoxVisible = false;
String? _voucherLookupBoxStudentClassVal;
late List<Map<String, dynamic>> _vocherLookupBoxItem;
TextEditingController _voucherLookupBoxSurnameCon = TextEditingController();
TextEditingController _voucherLookupBoxFirstNameCon = TextEditingController();
TextEditingController _voucherLookupBoxStudentNoCon = TextEditingController();

class _VoucherLookupBox extends StatelessWidget {
  final ValueChanged setState;
  const _VoucherLookupBox({required this.setState});

  @override
  Widget build(BuildContext context) {
    List<String> vocherLookupBoxTableRowTitle = [
      "SN",
      "Student Number	",
      "Student Full Name	",
      "Status",
    ];
    _vocherLookupBoxItem = [
      {
        "type": "Text Feild",
        "hint": "Student No",
        "icon": const Icon(Icons.card_membership_outlined),
        "controller": _voucherLookupBoxStudentNoCon,
      },
      {
        "type": "Text Feild",
        "hint": "Surname",
        "icon": const Icon(Icons.person),
        "controller": _voucherLookupBoxSurnameCon,
      },
      {
        "type": "Text Feild",
        "hint": "First Name",
        "icon": const Icon(Icons.person),
        "controller": _voucherLookupBoxFirstNameCon,
      },
      {
        "type": "dropdown",
        "hint": "Student Class",
        "selectedValue": _voucherLookupBoxStudentClassVal,
        "values": [],
        "items": [],
      },
      {
        "type": "dropdown",
        "hint": "Sex",
        "selectedValue": _voucherLookupBoxSexVal,
        "values": [],
        "items": [],
      },
      {
        "type": "dropdown",
        "hint": "Status",
        "selectedValue": _voucherLookupBoxStatusVal,
        "values": [],
        "items": [],
      },
    ];
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50.0,
            width: double.infinity,
            color: AppTheme().primaryColor,
            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PublicTextWidget(
                  text: "Voucher Lookup Box",
                  color: AppTheme().bgColor,
                ),
                GestureDetector(
                  onTap: () => setState(_voucherLookupBoxVisible = false),
                  child: PublicTextWidget(
                    text: "Close",
                    color: AppTheme().bgColor,
                  ),
                ),
              ],
            ),
          ),
          for (int i = 0; i < _vocherLookupBoxItem.length; i++) ...{
            if (_vocherLookupBoxItem[i]['type'] == "Text Feild") ...{
              PublicTextWidget(text: _vocherLookupBoxItem[i]['hint']),
              const SizedBox(height: 5.0),
              PublicTextFeild(
                hint: _vocherLookupBoxItem[i]['hint'],
                suffixIcon: _vocherLookupBoxItem[i]['icon'],
                controller: _vocherLookupBoxItem[i]['controller'],
              ),
              const SizedBox(height: 10.0),
            } else ...{
              PublicTextWidget(text: _vocherLookupBoxItem[i]['hint']),
              const SizedBox(height: 5.0),
              PublicDropdownWidget(
                hint: _vocherLookupBoxItem[i]['hint'],
                items: _vocherLookupBoxItem[i]['items'],
                values: _vocherLookupBoxItem[i]['values'],
                selectedValue: _vocherLookupBoxItem[i]['selectedValue'],
                onSelect: (val) {
                  _vocherLookupBoxItem[i]['hint'] = val;
                  setState('');
                },
              ),
              const SizedBox(height: 10.0),
            }
          },
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Table(
              defaultColumnWidth: const IntrinsicColumnWidth(),
              border: TableBorder.all(color: AppTheme().lightDark),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                  children: [
                    for (int i = 0;
                        i < vocherLookupBoxTableRowTitle.length;
                        i++) ...{
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.top,
                        child: Container(
                          color: Colors.blue.shade900,
                          padding: const EdgeInsets.all(10.0),
                          child: PublicTextWidget(
                            text: vocherLookupBoxTableRowTitle[i],
                            color: AppTheme().bgColor,
                          ),
                        ),
                      ),
                    }
                  ],
                ),
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey.shade400),
                  children: [
                    for (int i = 0;
                        i < vocherLookupBoxTableRowTitle.length;
                        i++)
                      Container(height: 40),
                  ],
                ),
              ],
            ),
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
                _Tab3(setState: (value) => setState('')),
                _Tab4(setState: (value) => setState('')),
                _Tab5(setState: (value) => setState('')),
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
String _tab3ParentImgFile = "";
String _tab3StudentImgFile = "";
late List<Map<String, dynamic>> _tab3Items;

class _Tab3 extends StatelessWidget {
  final ValueChanged setState;
  const _Tab3({required this.setState});

  @override
  Widget build(BuildContext context) {
    _tab3Items = [
      {
        "hint": "Student Image (Click to select Image)",
        "imagefile": _tab3StudentImgFile
      },
      {
        "hint": "Parent Image (Click to select Image)",
        "imagefile": _tab3ParentImgFile
      },
    ];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < _tab3Items.length; i++) ...{
              PublicTextWidget(text: _tab3Items[i]['hint']),
              const SizedBox(height: 5.0),
              Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: AppTheme().lightDark),
                ),
                child: Icon(
                  Icons.camera_alt_rounded,
                  size: 50.0,
                  color: AppTheme().lightDark,
                ),
              ),
              const SizedBox(height: 10.0),
            }
          ],
        ),
      ),
    );
  }
}

//============================================================
// TAB 4 (Student Activities Tab)
//============================================================
String? _tab4TermVal;
String? _tab4ClassVal;
String? _tab4AcademicSessionVal;
TextEditingController _tab4ToController = TextEditingController();
TextEditingController _tab4FromController = TextEditingController();

class _Tab4 extends StatelessWidget {
  final ValueChanged setState;
  const _Tab4({required this.setState});

  @override
  Widget build(BuildContext context) {
    List<String> tab4TableRowTitle = [
      "Date Of Activity",
      "Academic Session",
      "Class",
      "Term",
      "Activity Type",
      "Activity Description",
    ];
    List<Map<String, dynamic>> tab4items = [
      {
        "type": "dropdown",
        "hint": "Academic Session",
        "selectedValue": _tab4AcademicSessionVal,
        "items": [],
        "values": [],
      },
      {
        "type": "dropdown",
        "hint": "Class",
        "selectedValue": _tab4ClassVal,
        "items": [],
        "values": [],
      },
      {
        "type": "dropdown",
        "hint": "Term",
        "selectedValue": _tab4TermVal,
        "items": [],
        "values": [],
      },
      {
        "type": "date picker",
        "hint": "From",
        "controller": _tab4FromController,
      },
      {
        "type": "date picker",
        "hint": "To",
        "controller": _tab4ToController,
      },
    ];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < tab4items.length; i++) ...{
              if (tab4items[i]['type'] == "dropdown") ...{
                PublicTextWidget(text: tab4items[i]['hint']),
                const SizedBox(height: 5.0),
                PublicDropdownWidget(
                  hint: tab4items[i]['hint'],
                  items: tab4items[i]['items'],
                  values: tab4items[i]['values'],
                  selectedValue: tab4items[i]['selectedValue'],
                  onSelect: (val) {
                    tab4items[i]['selectedValue'] = val;
                    setState('');
                  },
                ),
                const SizedBox(height: 10.0),
              } else ...{
                PublicTextWidget(text: tab4items[i]['hint']),
                const SizedBox(height: 5.0),
                PublicDatePickerWidget(controller: tab4items[i]['controller']),
                const SizedBox(height: 10.0),
              }
            },
            PublicTextButton(
              value: "Display",
              onPressed: (val) {},
            ),
            const SizedBox(height: 10.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Table(
                defaultColumnWidth: const IntrinsicColumnWidth(),
                border: TableBorder.all(color: AppTheme().lightDark),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    children: [
                      for (int i = 0; i < tab4TableRowTitle.length; i++) ...{
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.top,
                          child: Container(
                            color: Colors.blue.shade900,
                            padding: const EdgeInsets.all(10.0),
                            child: PublicTextWidget(
                              text: tab4TableRowTitle[i],
                              color: AppTheme().bgColor,
                            ),
                          ),
                        ),
                      }
                    ],
                  ),
                  TableRow(
                    decoration: BoxDecoration(color: Colors.grey.shade400),
                    children: [
                      for (int i = 0; i < tab4TableRowTitle.length; i++)
                        Container(height: 40),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//============================================================
// TAB 5 (Finicial Statement Tab)
//============================================================
class _Tab5 extends StatelessWidget {
  final ValueChanged setState;
  const _Tab5({required this.setState});

  @override
  Widget build(BuildContext context) {
    List<String> tab5TableRowTitle = [
      "Trans Date",
      "Voucher Number",
      "Trans Source",
      "Academic Session",
      "Class",
      "Debit Amount",
      "Credit Amount",
      "Balance Amount",
    ];
    List<Map<String, dynamic>> tab5items = [
      {
        "hint": "From",
        "type": "date picker",
        "controller": _tab4FromController,
      },
      {
        "hint": "To",
        "type": "date picker",
        "controller": _tab4ToController,
      },
    ];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < tab5items.length; i++) ...{
              PublicTextWidget(text: tab5items[i]['hint']),
              const SizedBox(height: 5.0),
              PublicDatePickerWidget(controller: tab5items[i]['controller']),
              const SizedBox(height: 10.0),
            },
            PublicTextButton(
              value: "Display",
              onPressed: (val) {},
            ),
            const SizedBox(height: 10.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Table(
                defaultColumnWidth: const IntrinsicColumnWidth(),
                border: TableBorder.all(color: AppTheme().lightDark),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    children: [
                      for (int i = 0; i < tab5TableRowTitle.length; i++) ...{
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.top,
                          child: Container(
                            color: Colors.blue.shade900,
                            padding: const EdgeInsets.all(10.0),
                            child: PublicTextWidget(
                              text: tab5TableRowTitle[i],
                              color: AppTheme().bgColor,
                            ),
                          ),
                        ),
                      }
                    ],
                  ),
                  TableRow(
                    decoration: BoxDecoration(color: Colors.grey.shade400),
                    children: [
                      for (int i = 0; i < tab5TableRowTitle.length; i++)
                        Container(height: 40),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//============================================================
// REQUIRED VARIABLES
//============================================================
String? _tab1SexVal;
String? _tab1ClassVal;
String? _tab1SubClassVal;
String? _tab1DurabilityVal;
TextEditingController _studentNoSearchController = TextEditingController();
TextEditingController _tab1DateOfBirthController = TextEditingController();
TextEditingController _tab1FirstNameController = TextEditingController();
TextEditingController _tab1SurnameController = TextEditingController();
TextEditingController _tab1OtherNameController = TextEditingController();
TextEditingController _tab1RegDateController = TextEditingController();
TextEditingController _tab1StatusController = TextEditingController();

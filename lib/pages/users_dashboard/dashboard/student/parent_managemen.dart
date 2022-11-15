import '../../../../theme/theme.dart';
import 'package:flutter/material.dart';
import '../../../../components/component.dart';

class SchoolUserParentManagementPage extends StatefulWidget {
  const SchoolUserParentManagementPage({super.key});
  @override
  State<SchoolUserParentManagementPage> createState() =>
      _SchoolUserParentManagementPageState();
}

class _SchoolUserParentManagementPageState
    extends State<SchoolUserParentManagementPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppTheme().lightDark,
        appBar: const PublicAppBar(title: "Parent Management"),
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

TextEditingController _widget1StudentNoCon = TextEditingController();
TextEditingController _widget1PasswordNoCon = TextEditingController();

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
          PublicTextFeild(
            hint: "Enter Student No Here...",
            suffixIcon: const Icon(Icons.numbers_rounded),
            controller: _widget1StudentNoCon,
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Expanded(
                child: PublicTextFeild(
                  hint: "Enter Password Here...",
                  suffixIcon: const Icon(Icons.key_rounded),
                  controller: _widget1PasswordNoCon,
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
bool _voucherLookupBoxVisible = false;
late List<Map<String, dynamic>> _vocherLookupBoxItem;
TextEditingController _voucherLookupBoxSurnameCon = TextEditingController();
TextEditingController _voucherLookupBoxParentIdCon = TextEditingController();
TextEditingController _voucherLookupBoxFirstNameCon = TextEditingController();

class _VoucherLookupBox extends StatelessWidget {
  final ValueChanged setState;
  const _VoucherLookupBox({required this.setState});

  @override
  Widget build(BuildContext context) {
    List<String> vocherLookupBoxTableRowTitle = [
      "SN",
      "Parent User ID",
      "Parent Full Name",
      "Email",
    ];
    _vocherLookupBoxItem = [
      {
        "type": "Text Feild",
        "hint": "Parent ID",
        "icon": const Icon(Icons.card_membership_outlined),
        "controller": _voucherLookupBoxParentIdCon,
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
                  Tab(text: "Parent / Guardian Details"),
                  Tab(text: "Images"),
                  Tab(text: "Financial Statement"),
                  Tab(text: "Link Student(s)"),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 500.0,
            child: TabBarView(
              children: [
                _Tab1(setState: (value) => setState('')),
                _Tab2(setState: (value) => setState('')),
                _Tab3(setState: (value) => setState('')),
                _Tab4(setState: (value) => setState('')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//============================================================
// TAB 1 (Parent / Guardian Details Tag)
//============================================================
String? _tab1ReligionVal;
String? _tab1NationalityVal;
String? _tab1MaritalStatusVal;
String? _tab1LocalGovtAreaVal;
String? _tab1StateOfOriginVal;
late List<Map<String, dynamic>> _tab1ItemList;
TextEditingController _tab1FaxController = TextEditingController();
TextEditingController _tab1BBPINController = TextEditingController();
TextEditingController _tab1TitleController = TextEditingController();
TextEditingController _tab1TwitterController = TextEditingController();
TextEditingController _tab1SurnameController = TextEditingController();
TextEditingController _tab1FacebookController = TextEditingController();
TextEditingController _tab1FirstNameController = TextEditingController();
TextEditingController _tab1OtherNameController = TextEditingController();
TextEditingController _tab1HomeAddressController = TextEditingController();
TextEditingController _tab1PhonePrimaryController = TextEditingController();
TextEditingController _tab1EmailPrimaryController = TextEditingController();
TextEditingController _tab1OfficeAddressController = TextEditingController();
TextEditingController _tab1EmailSecondaryController = TextEditingController();
TextEditingController _tab1CurrentBalanceController = TextEditingController();
TextEditingController _tab1PhoneSecondaryController = TextEditingController();

class _Tab1 extends StatelessWidget {
  final ValueChanged setState;
  const _Tab1({required this.setState});

  @override
  Widget build(BuildContext context) {
    _tab1ItemList = [
      {
        "hint": "Title",
        "type": "textFeild",
        "icon": const Icon(Icons.pending_outlined),
        "controller": _tab1TitleController,
      },
      {
        "hint": "Surname",
        "type": "textFeild",
        "icon": const Icon(Icons.pending_outlined),
        "controller": _tab1SurnameController,
      },
      {
        "type": "textFeild",
        "hint": "First Name",
        "icon": const Icon(Icons.pending_outlined),
        "controller": _tab1FirstNameController,
      },
      {
        "type": "textFeild",
        "hint": "Other Names",
        "icon": const Icon(Icons.pending_outlined),
        "controller": _tab1OtherNameController,
      },
      {
        "type": "dropDown",
        "hint": "Marital Status",
        "selectedValue": _tab1MaritalStatusVal,
        "value": ["Single", "Married", "Divoice"],
        "valueItem": ["Single", "Married", "Divoice"],
      },
      {
        "type": "dropDown",
        "hint": "Religion",
        "selectedValue": _tab1ReligionVal,
        "value": [],
        "valueItem": [],
      },
      {
        "type": "textFeild",
        "hint": "Office Address",
        "icon": const Icon(Icons.home_work_rounded),
        "controller": _tab1OfficeAddressController,
      },
      {
        "type": "textFeild",
        "hint": "Home Address",
        "icon": const Icon(Icons.house_rounded),
        "controller": _tab1HomeAddressController,
      },
      {
        "type": "textFeild",
        "hint": "Phone (Primary)",
        "icon": const Icon(Icons.call_end_rounded),
        "controller": _tab1PhonePrimaryController,
      },
      {
        "type": "textFeild",
        "hint": "Phone (Secondary)",
        "icon": const Icon(Icons.call_end_rounded),
        "controller": _tab1PhoneSecondaryController,
      },
      {
        "type": "dropDown",
        "hint": "Local Govt Area",
        "selectedValue": _tab1LocalGovtAreaVal,
        "value": [],
        "valueItem": [],
      },
      {
        "type": "dropDown",
        "hint": "State Of Origin",
        "selectedValue": _tab1StateOfOriginVal,
        "value": [],
        "valueItem": [],
      },
      {
        "type": "dropDown",
        "hint": "Nationality",
        "selectedValue": _tab1NationalityVal,
        "value": [],
        "valueItem": [],
      },
      {
        "type": "textFeild",
        "hint": "Email (Primary)",
        "icon": const Icon(Icons.mail_rounded),
        "controller": _tab1EmailPrimaryController,
      },
      {
        "type": "textFeild",
        "hint": "Email (Secondary)",
        "icon": const Icon(Icons.mail_rounded),
        "controller": _tab1EmailSecondaryController,
      },
      {
        "hint": "Fax",
        "type": "textFeild",
        "controller": _tab1FaxController,
        "icon": const Icon(Icons.fax_rounded),
      },
      {
        "hint": "Facebook",
        "type": "textFeild",
        "controller": _tab1FacebookController,
        "icon": const Icon(Icons.facebook_rounded),
      },
      {
        "hint": "BB PIN",
        "type": "textFeild",
        "controller": _tab1BBPINController,
        "icon": const Icon(Icons.phone_android_rounded),
      },
      {
        "hint": "Twitter",
        "type": "textFeild",
        "controller": _tab1TwitterController,
        "icon": const Icon(Icons.message_rounded),
      },
      {
        "hint": "Current Balance",
        "type": "textFeild",
        "controller": _tab1CurrentBalanceController,
        "icon": const Icon(Icons.attach_money_rounded),
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
// TAB 2 (Images Tab)
//============================================================
String _tab2ImgFile = "";

class _Tab2 extends StatelessWidget {
  final ValueChanged setState;
  const _Tab2({required this.setState});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PublicTextWidget(text: "Image"),
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
          ],
        ),
      ),
    );
  }
}

//============================================================
// TAB 3 (Financial Statement Tab)
//============================================================
TextEditingController _tab3DateToVal = TextEditingController();
TextEditingController _tab3DateFromVal = TextEditingController();
late List<Map<String, dynamic>> _tab3items;

class _Tab3 extends StatelessWidget {
  final ValueChanged setState;
  const _Tab3({required this.setState});

  @override
  Widget build(BuildContext context) {
    List<String> tab4TableRowTitle = [
      "Trans Date	",
      "Voucher Number",
      "Trans Source",
      "Academic Session",
      "Class",
      "Term",
      "Debit Amount	",
      "Credit Amount	",
      "Balance Amount",
    ];
    _tab3items = [
      {"type": "datePicker", "hint": "From", "controller": _tab3DateFromVal},
      {"type": "datePicker", "hint": "To", "controller": _tab3DateToVal},
    ];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < _tab3items.length; i++) ...{
              if (_tab3items[i]['type'] == "datePicker") ...{
                PublicTextWidget(text: _tab3items[i]['hint']),
                const SizedBox(height: 5.0),
                PublicDatePickerWidget(controller: _tab3items[i]['controller']),
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
// TAB 4 (Link Student(s))
//============================================================
class _Tab4 extends StatelessWidget {
  final ValueChanged setState;
  const _Tab4({required this.setState});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

import '../../../../theme/theme.dart';
import 'package:flutter/material.dart';
import '../../../../components/component.dart';

class SchoolUserRecordScoresPage extends StatefulWidget {
  const SchoolUserRecordScoresPage({super.key});
  @override
  State<SchoolUserRecordScoresPage> createState() =>
      _SchoolUserRecordScoresPageState();
}

class _SchoolUserRecordScoresPageState
    extends State<SchoolUserRecordScoresPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppTheme().lightDark,
        appBar: const PublicAppBar(title: "Student Scores Record"),
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
late List<Map<String, dynamic>> _widget1Items;
TextEditingController _widget1MarkObtCaCon = TextEditingController();
TextEditingController _widget1MarkObtExamCon = TextEditingController();
TextEditingController _widget1TotalMarkObtainableCon = TextEditingController();

class _Widget1 extends StatelessWidget {
  final ValueChanged setState;
  const _Widget1({required this.setState});

  @override
  Widget build(BuildContext context) {
    _widget1Items = [
      {
        "hint": "Mark Obtainable (CA)",
        "icon": const Icon(Icons.check),
        "controller": _widget1MarkObtCaCon
      },
      {
        "hint": "Mark Obtainable (Exam)",
        "icon": const Icon(Icons.check),
        "controller": _widget1MarkObtExamCon
      },
      {
        "hint": "Total Mark Obtainable",
        "icon": const Icon(Icons.check),
        "controller": _widget1TotalMarkObtainableCon,
      },
    ];
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: AppTheme().bgColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < _widget1Items.length; i++) ...{
            PublicTextWidget(text: _widget1Items[i]['hint']),
            const SizedBox(height: 5.0),
            PublicTextFeild(
              hint: _widget1Items[i]['hint'],
              suffixIcon: _widget1Items[i]['icon'],
              controller: _widget1Items[i]['controller'],
            ),
            const SizedBox(height: 10.0),
          }
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
                  Tab(text: "Report 1"),
                  Tab(text: "Report 2"),
                  Tab(text: "CA Input"),
                  Tab(text: "The Unique Child"),
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
                Text("data"),
                // _Tab3(setState: (value) => setState('')),
                // _Tab4(setState: (value) => setState('')),
                // _Tab5(setState: (value) => setState('')),
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
String? _tab1TermVal;
String? _tab1ClassVal;
String? _tab1SubjectVal;
late List<Map<String, dynamic>> _tab1Items;

class _Tab1 extends StatelessWidget {
  final ValueChanged setState;
  const _Tab1({required this.setState});

  @override
  Widget build(BuildContext context) {
    _tab1Items = [
      {
        "hint": "Class",
        "selectedVal": _tab1ClassVal,
        "items": ["Basic 1", "Basic 2", "Basic 3"],
        "values": ["Basic 1", "Basic 2", "Basic 3"],
      },
      {
        "hint": "Subject",
        "selectedVal": _tab1SubjectVal,
        "items": [],
        "values": [],
      },
      {
        "hint": "Term",
        "selectedVal": _tab1TermVal,
        "items": ["1ST", "2ND", "3RD"],
        "values": ["1ST", "2ND", "3RD"],
      },
    ];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < _tab1Items.length; i++) ...{
              PublicTextWidget(text: _tab1Items[i]['hint']),
              const SizedBox(height: 5.0),
              PublicDropdownWidget(
                hint: _tab1Items[i]['hint'],
                items: _tab1Items[i]['items'],
                values: _tab1Items[i]['values'],
                selectedValue: _tab1Items[i]['selectedVal'],
                onSelect: (val) {
                  _tab1Items[i]['selectedVal'] = val;
                  setState('');
                },
              ),
              const SizedBox(height: 10.0),
            },
            PublicTextButton(value: "Save Scores", onPressed: (val) {}),
          ],
        ),
      ),
    );
  }
}

//============================================================
// TAB 2
//============================================================
String? _tab2TermVal;
String? _tab2ClassVal;
String? _tab2StudentVal;

String? _tab2InterestedInLearningVal;
String? _tab2ListeningAttentivelyVal;
String? _tab2PresentsWorkCarefullyVal;
String? _tab2WorksWellWithOtherChildrenVal;
String? _tab2HomeworkIsCompletedToHisHerAbilityVal;
String? _tab2KeepsTryingEvenWhenTasksAreDifficultVal;

String? _tab2AppearsHappyAtSchoolVal;
String? _tab2AppearanceVal;
String? _tab2BehavesWellInClassVal;
String? _tab2MixesWellWithOtherChildrenVal;
String? _tab2SensitiveToOthersFeelingsVal;
String? _tab2BehavesWellInThePlaygroundVal;
String? _tab2ManagesAndExpressesOwnFeelingsWellVal;
String? _tab2OrganisesWorkWellVal;

late List<Map<String, dynamic>> _tab2Items;
late List<Map<String, dynamic>> _tab2Items2;

class _Tab2 extends StatelessWidget {
  final ValueChanged setState;
  const _Tab2({required this.setState});

  @override
  Widget build(BuildContext context) {
    _tab2Items = [
      {
        "hint": "Class",
        "selectedVal": _tab2ClassVal,
        "items": ["Basic 1", "Basic 2", "Basic 3"],
        "values": ["Basic 1", "Basic 2", "Basic 3"],
      },
      {
        "hint": "Student",
        "selectedVal": _tab2StudentVal,
        "items": [],
        "values": [],
      },
      {
        "hint": "Term",
        "selectedVal": _tab2TermVal,
        "items": ["1ST", "2ND", "3RD"],
        "values": ["1ST", "2ND", "3RD"],
      },
    ];

    _tab2Items2 = [
      {
        "title": "Your Child as a Learner",
        "children": [
          {
            "type": "dropdown",
            "hint": "Interested in Learning",
            "selectedVal": _tab2InterestedInLearningVal,
            "items": ["Rarely", "Sometimes", "Most of the time", "Always"],
            "values": ["Rarely", "Sometimes", "Most of the time", "Always"],
          },
          {
            "type": "dropdown",
            "hint": "Listening attentively",
            "selectedVal": _tab2ListeningAttentivelyVal,
            "items": ["Rarely", "Sometimes", "Most of the time", "Always"],
            "values": ["Rarely", "Sometimes", "Most of the time", "Always"],
          },
          {
            "type": "dropdown",
            "hint": "Works well with other children",
            "selectedVal": _tab2WorksWellWithOtherChildrenVal,
            "items": ["Rarely", "Sometimes", "Most of the time", "Always"],
            "values": ["Rarely", "Sometimes", "Most of the time", "Always"],
          },
          {
            "type": "dropdown",
            "hint": "Keeps trying even when tasks are difficult",
            "selectedVal": _tab2KeepsTryingEvenWhenTasksAreDifficultVal,
            "items": ["Rarely", "Sometimes", "Most of the time", "Always"],
            "values": ["Rarely", "Sometimes", "Most of the time", "Always"],
          },
          {
            "type": "dropdown",
            "hint": "Homework is completed to his/her ability",
            "selectedVal": _tab2HomeworkIsCompletedToHisHerAbilityVal,
            "items": ["Rarely", "Sometimes", "Most of the time", "Always"],
            "values": ["Rarely", "Sometimes", "Most of the time", "Always"],
          },
          {
            "type": "dropdown",
            "hint": "Presents work carefully",
            "selectedVal": _tab2PresentsWorkCarefullyVal,
            "items": ["Rarely", "Sometimes", "Most of the time", "Always"],
            "values": ["Rarely", "Sometimes", "Most of the time", "Always"],
          },
        ]
      },
      {"title": "Your child’s social and personal development", "children": []},
      {"title": "English", "children": []},
      {"title": "How you can further support", "children": []},
      {"title": "National Curriculum Level", "children": []},
    ];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < _tab2Items.length; i++) ...{
              PublicTextWidget(text: _tab2Items[i]['hint']),
              const SizedBox(height: 5.0),
              PublicDropdownWidget(
                hint: _tab2Items[i]['hint'],
                items: _tab2Items[i]['items'],
                values: _tab2Items[i]['values'],
                selectedValue: _tab2Items[i]['selectedVal'],
                onSelect: (val) {
                  _tab2Items[i]['selectedVal'] = val;
                  setState('');
                },
              ),
              const SizedBox(height: 10.0),
            },
            PublicTextButton(value: "Save Scores", onPressed: (val) {}),
            const SizedBox(height: 30.0),
            for (int i = 0; i < _tab2Items2.length; i++) ...{
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PublicTextWidget(
                    fontSize: 20.0,
                    text: _tab2Items2[i]['title'],
                    fontWeignt: FontWeight.bold,
                  ),
                  const SizedBox(height: 10.0),
                  for (int m = 0;
                      m < _tab2Items2[i]['children'].length;
                      m++) ...{
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: PublicTextWidget(
                        text: _tab2Items2[i]["children"][m]['hint'],
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    if (_tab2Items2[i]["children"][m]['type'] ==
                        "dropdown") ...{
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          bottom: 10.0,
                        ),
                        child: PublicDropdownWidget(
                          hint: _tab2Items2[i]["children"][m]['hint'],
                          items: _tab2Items2[i]["children"][m]['items'],
                          values: _tab2Items2[i]["children"][m]['values'],
                          selectedValue: _tab2Items2[i]["children"][m]
                              ['selectedVal'],
                          onSelect: (val) {
                            _tab2Items2[i]["children"][m]['selectedVal'] = val;
                            setState("");
                          },
                        ),
                      ),
                    }
                  }
                ],
              ),
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
String? _tab3DayVal;
String? _tab3WeekVal;
String? _tab3TermVal;
String? _tab3ClassVal;
String? _tab3SubjectVal;
String? _tab3RecordTypeVal;
late List<Map<String, dynamic>> _tab3Items;

class _Tab3 extends StatelessWidget {
  final ValueChanged setState;
  const _Tab3({required this.setState});

  @override
  Widget build(BuildContext context) {
    _tab3Items = [
      {
        "hint": "Class",
        "selectedVal": _tab3ClassVal,
        "items": ["Basic 1", "Basic 2", "Basic 3"],
        "values": ["Basic 1", "Basic 2", "Basic 3"],
      },
      {
        "hint": "Subject",
        "selectedVal": _tab3SubjectVal,
        "items": [],
        "values": [],
      },
      {
        "hint": "Term",
        "selectedVal": _tab3TermVal,
        "items": ["1ST", "2ND", "3RD"],
        "values": ["1ST", "2ND", "3RD"],
      },
      {
        "hint": "Record Type",
        "selectedVal": _tab3RecordTypeVal,
        "items": ["Weekly Test", "Project", "Classwork", "Homework"],
        "values": ["Weekly Test", "Project", "Classwork", "Homework"],
      },
      {
        "hint": "Week",
        "selectedVal": _tab3WeekVal,
        "items": List.generate(15, (i) => i + 1),
        "values": List.generate(15, (i) => i + 1),
      },
      {
        "hint": "Day",
        "selectedVal": _tab3DayVal,
        "items": ["1", "2", "3", "4", "5"],
        "values": ["1", "2", "3", "4", "5"],
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
              PublicDropdownWidget(
                hint: _tab3Items[i]['hint'],
                items: _tab3Items[i]['items'],
                values: _tab3Items[i]['values'],
                selectedValue: _tab3Items[i]['selectedVal'],
                onSelect: (val) {
                  _tab3Items[i]['selectedVal'] = val;
                  setState('');
                },
              ),
              const SizedBox(height: 10.0),
            },
            PublicTextButton(value: "Udate Record", onPressed: (val) {}),
            const SizedBox(height: 10.0),
            PublicTextButton(
              value: "Display Report by Subject",
              color: AppTheme().brandColor,
              onPressed: (val) {},
            ),
          ],
        ),
      ),
    );
  }
}

import '../../../../theme/theme.dart';
import 'package:flutter/material.dart';
import '../../../../components/component.dart';

class SchoolUserStudentActivitiesPage extends StatefulWidget {
  const SchoolUserStudentActivitiesPage({super.key});
  @override
  State<SchoolUserStudentActivitiesPage> createState() =>
      _SchoolUserStudentActivitiesPageState();
}

class _SchoolUserStudentActivitiesPageState
    extends State<SchoolUserStudentActivitiesPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppTheme().bgColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: PublicAppBar(
            title: "Student Activities",
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: AppTheme().brandColor,
              tabs: const [
                Tab(text: "New Activities"),
                Tab(text: "Search Activities"),
              ],
            ),
          ),
        ),
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
    return TabBarView(
      children: [
        _NewActivitiesWidget(setState: (value) => setState('')),
        _SearchActivitiesWidget(setState: (value) => setState('')),
      ],
    );
  }
}

//============================================================
// NEW ACTIVITIES WIDGET
//============================================================
String? _newActivitiesTermVal;
String? _newActivitiesClassVal;
String? _newActivitiesPeriodVal;
String? _newActivitiesTimeMinVal;
String? _newActivitiesTimeHourVal;
bool _newActivitiesCheckBoxVal = false;
late List<Map<dynamic, dynamic>> _newActivitiesItems;
TextEditingController _newActivitiesDateCon = TextEditingController();
TextEditingController _newActivitiesActivityDescCon = TextEditingController();

class _NewActivitiesWidget extends StatelessWidget {
  final ValueChanged setState;
  const _NewActivitiesWidget({required this.setState});

  @override
  Widget build(BuildContext context) {
    _newActivitiesItems = [
      {
        "type": "dropDown",
        "hint": "Class",
        "selectedVal": _newActivitiesClassVal,
        "items": [],
        "values": [],
      },
      {
        "hint": "Date",
        "type": "datePicker",
        "controller": _newActivitiesDateCon,
      },
      {
        "type": "dropDown",
        "hint": "Time (Hour)",
        "selectedVal": _newActivitiesTimeHourVal,
        "items": [],
        "values": [],
      },
      {
        "type": "dropDown",
        "hint": "Time (Min)",
        "selectedVal": _newActivitiesTimeMinVal,
        "items": [],
        "values": [],
      },
      {
        "type": "dropDown",
        "hint": "Term",
        "selectedVal": _newActivitiesTermVal,
        "items": [],
        "values": [],
      },
      {
        "type": "dropDown",
        "hint": "Period",
        "selectedVal": _newActivitiesPeriodVal,
        "items": [],
        "values": [],
      },
      {
        "type": "textFeild",
        "hint": "Activity Description",
        "icon": const Icon(Icons.text_fields_rounded),
        "controller": _newActivitiesActivityDescCon,
      },
    ];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < _newActivitiesItems.length; i++) ...{
              if (_newActivitiesItems[i]['type'] == "textFeild") ...{
                PublicTextWidget(text: _newActivitiesItems[i]['hint']),
                const SizedBox(height: 5.0),
                PublicTextFeild(
                  hint: _newActivitiesItems[i]['hint'],
                  suffixIcon: _newActivitiesItems[i]['icon'],
                  controller: _newActivitiesItems[i]['controller'],
                ),
                const SizedBox(height: 10.0),
              } else if (_newActivitiesItems[i]['type'] == "datePicker") ...{
                PublicTextWidget(text: _newActivitiesItems[i]['hint']),
                const SizedBox(height: 5.0),
                PublicDatePickerWidget(
                  controller: _newActivitiesItems[i]['controller'],
                ),
                const SizedBox(height: 10.0),
              } else ...{
                PublicTextWidget(text: _newActivitiesItems[i]['hint']),
                const SizedBox(height: 5.0),
                PublicDropdownWidget(
                  hint: _newActivitiesItems[i]['hint'],
                  items: _newActivitiesItems[i]['items'],
                  values: _newActivitiesItems[i]['values'],
                  selectedValue: _newActivitiesItems[i]['selectedVal'],
                  onSelect: (val) {
                    _newActivitiesItems[i]['selectedVal'] = val;
                    setState('');
                  },
                ),
                const SizedBox(height: 10.0),
              }
            },
            PublicTextButton(value: "Save", onPressed: (val) {}),
            Row(
              children: [
                Checkbox(value: _newActivitiesCheckBoxVal, onChanged: (val) {}),
                const PublicTextWidget(text: "Select All"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//============================================================
// SEARCH ACTIVITIES WIDGET
//============================================================
String? _searchActivitiesClassVal;
String? _searchActivitiesStudentVal;
late List<Map<dynamic, dynamic>> _searchActivitiesItems;
TextEditingController _searchActivitiesToCon = TextEditingController();
TextEditingController _searchActivitiesFromCon = TextEditingController();

class _SearchActivitiesWidget extends StatelessWidget {
  final ValueChanged setState;
  const _SearchActivitiesWidget({required this.setState});

  @override
  Widget build(BuildContext context) {
    _newActivitiesItems = [
      {
        "hint": "Class",
        "type": "dropDown",
        "selectedVal": _searchActivitiesClassVal,
        "items": [],
        "values": [],
      },
      {
        "hint": "Student",
        "type": "dropDown",
        "selectedVal": _searchActivitiesStudentVal,
        "items": [],
        "values": [],
      },
      {
        "hint": "FROM",
        "type": "datePicker",
        "controller": _searchActivitiesFromCon
      },
      {"hint": "To", "type": "datePicker", "controller": _searchActivitiesToCon}
    ];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < _newActivitiesItems.length; i++) ...{
              if (_newActivitiesItems[i]['type'] == "dropDown") ...{
                PublicTextWidget(text: _newActivitiesItems[i]['hint']),
                const SizedBox(height: 5.0),
                PublicDropdownWidget(
                  hint: _newActivitiesItems[i]['hint'],
                  items: _newActivitiesItems[i]['items'],
                  values: _newActivitiesItems[i]['values'],
                  selectedValue: _newActivitiesItems[i]['selectedVal'],
                  onSelect: (val) {
                    setState(_newActivitiesItems[i]['selectedVal'] = val);
                  },
                ),
                const SizedBox(height: 10.0),
              } else ...{
                PublicTextWidget(text: _newActivitiesItems[i]['hint']),
                const SizedBox(height: 5.0),
                PublicDatePickerWidget(
                  controller: _newActivitiesItems[i]['controller'],
                ),
                const SizedBox(height: 10.0),
              }
            },
            PublicTextButton(value: "Search", onPressed: (val) {}),
          ],
        ),
      ),
    );
  }
}

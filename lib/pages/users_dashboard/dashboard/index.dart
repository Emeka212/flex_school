import 'package:flutter/material.dart';
import 'package:flex_school/theme/theme.dart';
import 'package:flex_school/components/component.dart';

class SchoolUserIndexPage extends StatelessWidget {
  const SchoolUserIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme().lightDark,
      appBar: const PublicAppBar(title: "Dashboard"),
      drawer: const PublicDrawerWidget(),
      body: _BodyWidget(
        setState: (value) {},
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
            for (int i = 0; i < dashboardItemList.length; i++)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.only(bottom: 10.0),
                decoration: BoxDecoration(
                  color: AppTheme().bgColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: PublicTextWidget(
                        fontSize: 18.0,
                        text: dashboardItemList[i]['title'].toString(),
                        fontWeignt: FontWeight.bold,
                      ),
                    ),
                    if (dashboardItemList[i]['content'] == []) ...{
                      Text("data"),
                    } else ...{
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: AppTheme().lightDark,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: PublicTextWidget(
                          text:
                              "There are no ${dashboardItemList[i]['title']} items in the system",
                        ),
                      )
                    }
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
List<Map<String, Object>> dashboardItemList = [
  {"title": "School Calendar", "content": []},
  {"title": "Upcoming Events", "content": []},
  {"title": "Notice Board", "content": []},
];

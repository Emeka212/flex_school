import '../../../../theme/theme.dart';
import 'package:flutter/material.dart';
import '../../../../components/component.dart';

class SchoolUserStudentAttendancePage extends StatefulWidget {
  const SchoolUserStudentAttendancePage({super.key});
  @override
  State<SchoolUserStudentAttendancePage> createState() =>
      _SchoolUserStudentAttendancePageState();
}

class _SchoolUserStudentAttendancePageState
    extends State<SchoolUserStudentAttendancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme().lightDark,
      appBar: const PublicAppBar(title: "Student Management"),
      body: _BodyWidget(setState: (value) => setState(() {})),
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
    return Container();
  }
}

import 'dart:convert';

import '../components/component.dart';
import 'package:flutter/material.dart';
import '../routes/routes.dart' as route;
import '../components/public_variables.dart';
import 'package:flex_school/theme/theme.dart';
import 'package:flex_school/connection/api.dart';

class ProcessPage extends StatefulWidget {
  const ProcessPage({super.key});
  @override
  State<ProcessPage> createState() => _ProcessPageState();
}

class _ProcessPageState extends State<ProcessPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppTheme().bgColor,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0.0),
      body: _BodyWidget(setState: (value) => setState(() {})),
    );
  }
}

//======================================================================
// BODY WIDGET
//======================================================================
class _BodyWidget extends StatelessWidget {
  final ValueChanged setState;
  const _BodyWidget({required this.setState});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/imgs/Education.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                color: Colors.black54,
                width: double.infinity,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(10.0),
                child: PublicTextWidget(
                  fontSize: 35.0,
                  fontWeignt: FontWeight.bold,
                  color: AppTheme().lightDark,
                  text: "Initializing Page For All Types Of User",
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              PublicTextFeild(
                controller: _idController,
                hint: 'Enter Your School ID Here...',
                suffixIcon: const Icon(Icons.person_pin),
              ),
              const SizedBox(height: 15.0),
              Row(
                children: [
                  PublicCheckBox(
                    value: _schoolUserCheckbox,
                    onPressed: (val) {
                      _schoolUserCheckbox = val;
                      setState('');
                    },
                  ),
                  const SizedBox(width: 5.0),
                  PublicTextWidget(
                    text: "Process Me as School User",
                    color: AppTheme().textColor.withOpacity(0.8),
                  ),
                  const Spacer(),
                  PublicCheckBox(
                    value: _parentCheckbox,
                    onPressed: (val) {
                      _parentCheckbox = val;
                      setState('');
                    },
                  ),
                  const SizedBox(width: 5.0),
                  PublicTextWidget(
                    text: "Process Me as a Parent",
                    color: AppTheme().textColor.withOpacity(0.8),
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              PublicTextButton(
                value: "PROCESS",
                onPressed: (val) => _loginProcess(context: context),
              ),
            ],
          ),
        )
      ],
    );
  }
}

//======================================================================
// REQUIRED VARIABLES
//======================================================================
bool _parentCheckbox = false;
bool _schoolUserCheckbox = false;
TextEditingController _idController = TextEditingController();

//======================================================================
// LOGIN PROCESS FUNCTION
//======================================================================
_loginProcess({required BuildContext context}) async {
  String schoolID = _idController.text;
  String dataMode = "GET SCHOOL CLIENT ID";
  if (_parentCheckbox == false && _schoolUserCheckbox == false) {
    String content = "You must select an option below";
    PublicNonOptionalAlertDialog().show(title: "Error", content: content);
    return;
  }
  PublicProgressBar().show();
  String result = await API().query(clientID: schoolID, dataMode: dataMode);
  PublicProgressBar().remove();
  if (result.toLowerCase().contains("error:")) {
    String content = result.toLowerCase().split("error:").last;
    PublicNonOptionalAlertDialog().show(title: "Error", content: content);
    return;
  }
  Map jsonResult = jsonDecode(json.decode(result));
  PublicVariables.schoolUserDB.put(0, _parentCheckbox);
  PublicVariables.parentDB.put(0, _schoolUserCheckbox);
  PublicVariables.schoolDetails.put(0, jsonResult['message'][0]);
  // ignore: use_build_context_synchronously
  Navigator.pushReplacementNamed(context, route.indexPage);
}

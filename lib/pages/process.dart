import 'package:flex_school/connection/api.dart';

import '../components/component.dart';
import 'package:flutter/material.dart';
import '../routes/routes.dart' as route;
import 'package:flex_school/theme/theme.dart';

class ProcessPage extends StatefulWidget {
  const ProcessPage({super.key});
  @override
  State<ProcessPage> createState() => _ProcessPageState();
}

class _ProcessPageState extends State<ProcessPage> {
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
                    value: _parentUserheckbox,
                    onPressed: (val) {
                      _parentUserheckbox = val;
                      setState('');
                    },
                  ),
                  const SizedBox(width: 5.0),
                  PublicTextWidget(
                    text: "Login as School User",
                    color: AppTheme().textColor.withOpacity(0.8),
                  ),
                  const Spacer(),
                  PublicCheckBox(
                    value: _schoolUserCheckbox,
                    onPressed: (val) {
                      _schoolUserCheckbox = val;
                      setState('');
                    },
                  ),
                  const SizedBox(width: 5.0),
                  PublicTextWidget(
                    text: "Login as a Parent",
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
bool _parentUserheckbox = false;
bool _schoolUserCheckbox = false;
TextEditingController _idController = TextEditingController();

//======================================================================
// LOGIN PROCESS FUNCTION
//======================================================================
_loginProcess({required BuildContext context}) async {
  String result = await API().query(
    query: "",
    clientID: _idController.text,
    dataMode: 'GET SCHOOL CLIENT ID',
  );
  print(result);
  // Navigator.pushNamed(context, route.userLoginPage);
}

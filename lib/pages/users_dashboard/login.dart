import 'dart:convert';
import '../../connection/api.dart';
import 'package:flutter/material.dart';
import '../../routes/routes.dart' as route;
import 'package:flex_school/theme/theme.dart';
import '../../components/public_variables.dart';
import 'package:flex_school/components/component.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({super.key});
  @override
  State<UserLoginPage> createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
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
                    image: AssetImage('assets/imgs/Teacher.png'),
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
                  text: "Login Page For School User",
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
                hint: 'Enter Your Login ID Here...',
                suffixIcon: const Icon(Icons.person_pin),
              ),
              const SizedBox(height: 10.0),
              PublicTextFeild(
                controller: _passwordController,
                hint: 'Enter Your Password Here...',
                suffixIcon: const Icon(Icons.lock_rounded),
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  PublicCheckBox(
                    value: _rememberMe,
                    onPressed: (val) {
                      _rememberMe = val;
                      setState('');
                    },
                  ),
                  const SizedBox(width: 5.0),
                  PublicTextWidget(
                    text: "Remember Login ID",
                    color: AppTheme().textColor.withOpacity(0.8),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: const PublicTextWidget(text: "Forgotten Password"),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: PublicTextButton(
                      value: "Log In",
                      onPressed: (val) => _loginProcess(context: context),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Material(
                      color: AppTheme().lightDark,
                      child: PublicIconButton(
                        icon: const Icon(Icons.fingerprint_rounded),
                        onPressed: (val) {},
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: const [
                  Expanded(child: Divider()),
                  SizedBox(width: 10.0),
                  PublicTextWidget(text: "OR"),
                  SizedBox(width: 10.0),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 10.0),
              PublicTextButton(
                value: "Log In as Parent",
                onPressed: (val) {
                  Navigator.pushReplacementNamed(
                    context,
                    route.parentLoginPage,
                  );
                },
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
bool _rememberMe = true;
TextEditingController _idController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

//======================================================================
// LOGIN PROCESS FUNCTION
//======================================================================
_loginProcess({required BuildContext context}) async {
  String id = _idController.text;
  String pass = _passwordController.text;
  var coyCode = PublicVariables.schoolDetails.getAt(0)!['CoyCode'];
  var deviceID = PublicVariables.schoolDetails.getAt(0)!['DeviceID'];
  if (_idController.text.isEmpty && _passwordController.text.isEmpty) {
    String content = "All feild must not be empty";
    PublicNonOptionalAlertDialog().show(title: "Error", content: content);
    return;
  }
  PublicProgressBar().show();
  String result = await API().query(
    dataMode: "SchoolLogin",
    query: "$coyCode;$id;$pass;User;$deviceID",
  );
  PublicProgressBar().remove();
  if (result.toLowerCase().contains("error:")) {
    PublicNonOptionalAlertDialog().show(title: "Error", content: result);
    return;
  }
  PublicVariables.loginPageApiData = jsonDecode(json.decode(result));
  // ignore: use_build_context_synchronously
  Navigator.pushNamed(context, route.schoolUserIndexPage);
  print(PublicVariables.loginPageApiData);
}

//======================================================================
// FINGERPRINT LOGIN FUNCTION
//======================================================================
_fingerPrintProcess() {}

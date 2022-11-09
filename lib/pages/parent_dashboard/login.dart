import 'package:flutter/material.dart';
import '../../routes/routes.dart' as route;
import 'package:flex_school/theme/theme.dart';
import 'package:flex_school/components/component.dart';

class ParentLoginPage extends StatefulWidget {
  const ParentLoginPage({super.key});
  @override
  State<ParentLoginPage> createState() => _ParentLoginPageState();
}

class _ParentLoginPageState extends State<ParentLoginPage> {
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
                  text: "Login Page For Parents",
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
                      onPressed: (val) {},
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
                value: "Log In as School User",
                onPressed: (val) {
                  Navigator.pushReplacementNamed(context, route.userLoginPage);
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}

// //======================================================================
// // REQUIRED VARIABLES
// //======================================================================
bool _rememberMe = true;
TextEditingController _idController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

//======================================================================
// LOGIN PROCESS FUNCTION
//======================================================================
_loginProcess() {}

//======================================================================
// FINGERPRINT LOGIN FUNCTION
//======================================================================
_fingerPrintProcess() {}

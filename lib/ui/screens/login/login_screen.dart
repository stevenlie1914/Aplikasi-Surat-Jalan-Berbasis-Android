import 'package:flutter/material.dart';
import 'package:steven_sales_app/common/app_style.dart';
import 'package:steven_sales_app/ui/navigation_controller.dart';
import 'package:steven_sales_app/ui/screens/forgot_password/forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailC = TextEditingController();
  final _passC = TextEditingController();

  void login() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const NavigationController(),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 35.0,
              ),
              Image.asset("assets/images/img_login.png"),
              const SizedBox(
                height: 40.0,
              ),
              const Text(
                "Sampurna Group",
                style: TextStyle(
                  color: AppStyle.blackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.alternate_email_outlined,
                    color: AppStyle.yellowColor,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _emailC,
                      validator: (value) {
                        const allowedEmails = [
                          'driver@sampurna.group',
                          'operasional@sampurna.group',
                          'IT@sampurna.group',
                          'sales@sampurna.group'
                        ];
                        if (!allowedEmails.contains(value)) {
                          return 'Email is not valid';
                        }
                        if (value!.isEmpty) {
                          return 'Alamat email dibutuhkan';
                        }
                        if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return 'Invalid input field';
                        }

                        return null;
                      },
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          _formKey.currentState!.validate();
                        }
                      },
                      decoration: const InputDecoration(
                        isDense: true,
                        label: Text("Alamat Email"),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  const Icon(Icons.lock, color: AppStyle.yellowColor),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _passC,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Sandi dibutuhkan';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          _formKey.currentState!.validate();
                        }
                      },
                      decoration: const InputDecoration(
                        isDense: true,
                        label: Text("Sandi"),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: login,
                  child: const Text("Masuk"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Lupa Sandi? "),
                  TextButton(
                      onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgotPassword(),
                            ),
                          ),
                      child: const Text(
                        "Setel Kembali",
                        style: TextStyle(color: AppStyle.redColor),
                      )),
                ],
              ),
              const Spacer(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Versi "),
                  Text(
                    "1.0.1",
                    style: TextStyle(color: AppStyle.yellowColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 35.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

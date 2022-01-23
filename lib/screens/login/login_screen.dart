import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vku_news/contants/validation.dart';
import 'package:vku_news/providers/account_provider.dart';
import 'package:vku_news/screens/register/register.dart';
import 'package:vku_news/styles/colors.dart';
import 'package:vku_news/styles/fonts.dart';
import 'package:vku_news/widgets/buttons/button_big.dart';
import 'package:vku_news/widgets/buttons/button_icon.dart';
import 'package:vku_news/widgets/buttons/button_text.dart';
import 'package:vku_news/widgets/text_form/text_input.dart';

class LoginScreen extends StatefulWidget {
  final Function? callback;
  const LoginScreen({Key? key, this.callback}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _Logging = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text("Welcome Back",
                          style: TextStyle(
                              fontFamily: FontFamily.SourceSansPro,
                              fontSize: 35,
                              fontWeight: FontWeight.w600)),
                      SizedBox(width: 7),
                      Icon(
                        Icons.directions_walk_outlined,
                        size: 25,
                        color: Colors.amber,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text(
                      "I am happy to see you again , you can continue where you left off by logging in",
                      style: TextStyle(
                          color: greyPrimary,
                          fontWeight: FontWeight.w400,
                          fontFamily: FontFamily.SourceSansPro,
                          fontSize: 20)),
                  const SizedBox(height: 25),
                  InputText(
                      iconForm: Icons.email_outlined,
                      label: "Email Address",
                      controller: emailController,
                      validator: (val) => Validation.checkMail(val)),
                  InputText(
                      iconForm: Icons.lock_outlined,
                      label: "Password",
                      controller: passwordController,
                      validator: (val) => Validation.checkPassword(val)),
                  ButtonText(textButton: "Forgot password ?", onClick: () {}),
                  BigButton(
                      textButton: _Logging == true ? "Waiting to login" : "Sign In",
                      colorButton: _Logging == true ? greyLight : primaryColor,
                      textColor: white,
                      bigClick: () {
                        if (_formKey.currentState!.validate()) {
                          try {
                            setState(() {
                              _Logging = true;
                            });
                            Provider.of<AccountProvider>(context,listen: false).login(emailController.text, passwordController.text).then((value){
                              setState(() {
                                _Logging = false;
                              });
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Logged"),
                              ));
                            });
                          } catch (error) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(error.toString()),
                            ));
                          }
                        }
                      }),
                  const SizedBox(height: 40),
                  Container(
                    alignment: Alignment.center,
                    child: const Text("or",
                        style: TextStyle(
                            color: greyPrimary,
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamily.SourceSansPro,
                            fontSize: 20)),
                  ),
                  const SizedBox(height: 40),
                  ButtonIcon(
                      textButton: "Sign In with Google",
                      colorButton: greyLighter,
                      textColor: greyDarker,
                      imageButton:
                          Image.asset('assets/images/google_ic.png', width: 30),
                      onClick: () {}),
                  const SizedBox(height: 20),
                  ButtonIcon(
                      textButton: "Sign In with Facebook",
                      colorButton: greyLighter,
                      textColor: greyDarker,
                      imageButton: Image.asset('assets/images/facebook_ic.png',
                          width: 30),
                      onClick: () {}),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Dont have account ?",
                          style: TextStyle(
                              color: greyPrimary,
                              fontWeight: FontWeight.w400,
                              fontFamily: FontFamily.SourceSansPro,
                              fontSize: 20)),
                      TextButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RegisterScreen())),
                          child: const Text("Sign Up",
                              style: TextStyle(
                                  color: greyDarker,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: FontFamily.SourceSansPro,
                                  fontSize: 20)))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

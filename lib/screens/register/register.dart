import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vku_news/contants/validation.dart';
import 'package:vku_news/providers/account_provider.dart';
import 'package:vku_news/screens/login/login_screen.dart';
import 'package:vku_news/styles/colors.dart';
import 'package:vku_news/styles/fonts.dart';
import 'package:vku_news/widgets/buttons/button_big.dart';
import 'package:vku_news/widgets/text_form/text_input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text("Welcome to VKUs",style: TextStyle(fontFamily: FontFamily.SourceSansPro,fontSize: 35,fontWeight: FontWeight.w600)),
                      SizedBox(width: 7),
                      Icon(
                        Icons.flutter_dash_outlined,
                        size: 28,
                        color: purpleDarker,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text("Hello I guess you are new around here. You can start using the application after sign up",style: TextStyle(color: greyPrimary,fontWeight: FontWeight.w400,fontFamily: FontFamily.SourceSansPro,fontSize: 20)),
                  const SizedBox(height: 25),
                  InputText(
                      iconForm: Icons.person_outline_outlined,
                      label: "Full name",
                      controller: nameController,
                      validator: (val) => Validation.checkUsername(val)
                  ),
                  InputText(
                      iconForm: Icons.email_outlined,
                      label: "Email Address",
                      controller: emailController,
                      validator: (val) => Validation.checkMail(val)
                  ),
                  InputText(
                      iconForm: Icons.phone_outlined,
                      label: "Phone number",
                      controller: phoneController,
                      validator: (val) => Validation.checkPhone(val)
                  ),
                  InputText(
                      iconForm: Icons.lock_outlined,
                      label: "Password",
                      controller: passwordController,
                      validator: (val) => Validation.checkPassword(val)
                  ),
                  const SizedBox(height: 10),
                  BigButton(
                      textButton: isLoading == true ? "Waiting ..." :  "Sign Up",
                      colorButton: isLoading == true ? greyLight : primaryColor,
                      textColor: white,
                      bigClick : (){
                        if (_formKey.currentState!.validate()) {
                          try {
                            setState(() {
                              isLoading = true;
                            });
                            Provider.of<AccountProvider>(context,listen: false).register(nameController.text, emailController.text, passwordController.text, phoneController.text).then((value){
                              setState(() {
                                isLoading = false;
                              });
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Register Successfully , please back to login"),
                              ));
                              emailController.clear();
                              nameController.clear();
                              phoneController.clear();
                              passwordController.clear();
                            });
                          } catch (error) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(error.toString()),
                            ));
                          }
                        }
                      }),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already an account ?",style: TextStyle(color: greyPrimary,fontWeight: FontWeight.w400,fontFamily: FontFamily.SourceSansPro,fontSize: 20)),
                      TextButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen())), child: const Text("Sign In",style: TextStyle(color: greyDarker,fontWeight: FontWeight.w600,fontFamily: FontFamily.SourceSansPro,fontSize: 20)))
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

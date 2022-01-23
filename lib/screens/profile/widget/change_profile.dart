import 'package:flutter/material.dart';
import 'package:vku_news/providers/account_provider.dart';
import 'package:vku_news/screens/home/widget/home_header.dart';
import 'package:vku_news/screens/profile/widget/change_form.dart';
import 'package:vku_news/styles/colors.dart';
import 'package:vku_news/widgets/buttons/button_big.dart';
import 'package:provider/provider.dart';

class ChangeProfile extends StatefulWidget {
  const ChangeProfile({Key? key}) : super(key: key);

  @override
  _ChangeProfileState createState() => _ChangeProfileState();
}

class _ChangeProfileState extends State<ChangeProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  void checkForm(){
    if(nameController.text == "") {
      nameController.text = context.read<AccountProvider>().account.nameCustomer.toString();
    }
    if(emailController.text == ""){
      emailController.text = context.read<AccountProvider>().account.emailCustomer.toString();
    }
    if(phoneController.text == ""){
      phoneController.text = context.read<AccountProvider>().account.phoneCustomer.toString();
    }
    if(passwordController.text == ""){
      passwordController.text = context.read<AccountProvider>().account.passwordCustomer.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15,vertical:20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeHeader(title: "Change Profile", subTitle: "Changing your information"),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 30),
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200),
                            border: Border.all(
                                color: primaryColor
                            )
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: Image.asset('assets/images/avatar.png',width: 190),
                        ),
                      ),
                    ),
                    ChangeForm(
                        iconForm: Icons.three_p_outlined,
                        label: context.watch<AccountProvider>().account.nameCustomer.toString(),
                        controller: nameController
                    ),
                    ChangeForm(
                        iconForm: Icons.alternate_email_outlined,
                        label: context.watch<AccountProvider>().account.emailCustomer.toString(),
                        controller: emailController
                    ),
                    ChangeForm(
                        iconForm: Icons.phone_android_outlined,
                        label: context.watch<AccountProvider>().account.phoneCustomer.toString(),
                        controller: phoneController
                    ),
                    ChangeForm(
                        iconForm: Icons.lock_outlined,
                        label: context.watch<AccountProvider>().account.passwordCustomer.toString(),
                        controller: passwordController
                    ),
                    const SizedBox(height: 20),
                    BigButton(
                        textButton: _isLoading == true ? "Updating" : "Confirmed",
                        colorButton: _isLoading == true  ? greyLight : primaryColor,
                        textColor: white,
                        bigClick: (){
                          if (_formKey.currentState!.validate()) {
                            try {
                              setState(() {
                                _isLoading = true;
                              });
                              checkForm();
                              Provider.of<AccountProvider>(context , listen: false).changeProfile(
                                  context.read<AccountProvider>().account.idCustomer!.toInt(),
                                  nameController.text,
                                  emailController.text,
                                  phoneController.text,
                                  passwordController.text).then((value){
                                setState(() {
                                  _isLoading = false;
                                });
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Updated your profile"),
                                ));
                              });
                            } catch (error) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(error.toString()),
                              ));
                            }
                          }
                        }
                    )
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}

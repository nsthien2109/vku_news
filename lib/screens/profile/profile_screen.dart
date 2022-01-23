import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vku_news/providers/account_provider.dart';
import 'package:vku_news/screens/home/widget/home_header.dart';
import 'package:vku_news/screens/profile/widget/change_profile.dart';
import 'package:vku_news/styles/colors.dart';
import 'package:vku_news/styles/fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15,vertical:20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeHeader(title: "Profile", subTitle: ""),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: primaryColor
                        ),
                        borderRadius: BorderRadius.circular(100)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset('assets/images/avatar.png',width: 70),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(context.read<AccountProvider>().account.nameCustomer.toString(),style: const TextStyle(
                          color: blackPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: FontFamily.SourceSansPro
                        )),
                        Text(context.read<AccountProvider>().account.emailCustomer.toString(),style: const TextStyle(
                            color: greyDarker,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontFamily: FontFamily.SourceSansPro
                        ))
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 35),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ChangeProfile()));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: greyLighter,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Change Profile",style: TextStyle(
                          color: greyDarker,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: FontFamily.SourceSansPro
                        )),
                        Icon(Icons.chevron_right_outlined,color: greyDarker,size: 20)
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: (){
                    Provider.of<AccountProvider>(context,listen: false).logout();
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(
                      content: Text("Logout Successful"),
                    ));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                        color: greyLighter,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Sign Out",style: TextStyle(
                            color: greyDarker,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: FontFamily.SourceSansPro
                        )),
                        Icon(Icons.logout_outlined,color: greyDarker,size: 20)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}

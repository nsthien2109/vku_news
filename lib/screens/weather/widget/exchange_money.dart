import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vku_news/providers/exchange_provider.dart';
import 'package:vku_news/styles/colors.dart';
import 'package:vku_news/styles/fonts.dart';

class ExchangeMoney extends StatefulWidget {
  const ExchangeMoney({Key? key}) : super(key: key);

  @override
  _ExchangeMoneyState createState() => _ExchangeMoneyState();
}

class _ExchangeMoneyState extends State<ExchangeMoney> {

  var imageFlag = [
    'assets/images/canada.png',
    'assets/images/australia.png',
    'assets/images/coin.png',
    'assets/images/switzerland.png',
    'assets/images/china.png',
    'assets/images/european-union.png',
    'assets/images/united-kingdom.png',
    'assets/images/hong-kong.png',
    'assets/images/united-states.png',
    'assets/images/thailand.png',
    'assets/images/singapore.png',
    'assets/images/coin.png',
    'assets/images/new-zealand.png',
    'assets/images/japan.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ExchangeProvider>(builder: (context,exchangeData,_)
      => Container(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(
              color: greyLight,
              width: 0.5
          ),
          color: greyLighter,
          borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const Text("Currency exchange rate",style: TextStyle(
              color: blackPrimary,
              fontSize: 20,
              fontFamily: FontFamily.SourceSansPro,
              fontWeight: FontWeight.w600
          )),
          const SizedBox(height: 20),
          SizedBox(
            height: 160,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_,index) => Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  width: 160,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(imageFlag[index],width: 30),
                          const Icon(Icons.linear_scale_outlined, size: 20,color: Colors.greenAccent),
                          Text(exchangeData.exchange.items![index].type.toString(),style: const TextStyle(
                              color: blackPrimary,
                              fontSize: 20,
                              fontFamily: FontFamily.SourceSansPro,
                              fontWeight: FontWeight.w600
                          ))
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.paid_outlined,color: Colors.amberAccent,size: 30),
                          const SizedBox(width: 10),
                          Column(
                            children: [
                              Text("Buy : " + exchangeData.exchange.items![index].muatienmat.toString(),style: const TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 15,
                                  fontFamily: FontFamily.SourceSansPro
                              )),
                              const SizedBox(height: 5),
                              Text("Sell : "+ exchangeData.exchange.items![index].bantienmat.toString(),style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 15,
                                  fontFamily: FontFamily.SourceSansPro
                              ))
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.credit_card_outlined,color: Colors.lightBlueAccent,size: 30),
                          const SizedBox(width: 10),
                          Column(
                            children:  [
                              Text("Buy : " + exchangeData.exchange.items![index].muack.toString(),style: const TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 15,
                                  fontFamily: FontFamily.SourceSansPro
                              )),
                              const SizedBox(height: 5),
                              Text("Sell : " + exchangeData.exchange.items![index].banck.toString(),style: const  TextStyle(
                                  color: Colors.green,
                                  fontSize: 15,
                                  fontFamily: FontFamily.SourceSansPro
                              ))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                separatorBuilder: (_,index) => const SizedBox(width: 10),
                itemCount: 14
            ),
          )
        ],
      ),
    ));
  }
}

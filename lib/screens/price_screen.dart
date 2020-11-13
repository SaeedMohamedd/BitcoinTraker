import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../coin_data.dart';
import 'dart:io' show Platform;
import 'package:bitcoin_ticker/services/coinTicker.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

//String currentCurepto = 'BTC';
String currentCurency = 'USD';
int currencyValueBTC;
int currencyValueETH;
int currencyValueLTC;

class _PriceScreenState extends State<PriceScreen> {
  CoinTicker coinTicker = CoinTicker();

  DropdownButton androidDropdown() {
    List<DropdownMenuItem<String>> dropDownItemList = [];
    for (String Currency in currenciesList) {
      var listItem = DropdownMenuItem(
        child: Text(Currency),
        value: Currency,
      );
      dropDownItemList.add(listItem);
    }
    return DropdownButton(
      value: currentCurency,
      items: dropDownItemList,
      onChanged: (value) {
        setState(() {
          currentCurency = value;
        });
      },
    );
  }

  CupertinoPicker iospicker() {
    List<Text> listoftext = [];
    for (String currency in currenciesList) {
      listoftext.add(Text(currency));
    }
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectIndex) {
        print(selectIndex);
      },
      children: listoftext,
    );
  }

  Widget getPicker() {
    if (Platform.isIOS) {
      return iospicker();
    } else if (Platform.isAndroid) {
      return androidDropdown();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: GestureDetector(
              onTap: () async {
                var currencyData = await coinTicker.getData(
                    normal: currentCurency, curepto: 'BTC');
                double temp = currencyData['rate'];
                setState(() {
                  currencyValueBTC = temp.round();
                });
              },
              child: Card(
                color: Colors.lightBlueAccent,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                  child: Text(
                    '1 BTC = $currencyValueBTC  $currentCurency',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: GestureDetector(
              onTap: () async {
                var currencyData = await coinTicker.getData(
                    normal: currentCurency, curepto: 'ETH');
                double temp = currencyData['rate'];
                setState(() {
                  currencyValueETH = temp.round();
                });
              },
              child: Card(
                color: Colors.lightBlueAccent,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                  child: Text(
                    '1 ETH = $currencyValueETH  $currentCurency',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: GestureDetector(
              onTap: () async {
                var currencyData = await coinTicker.getData(
                    normal: currentCurency, curepto: 'LTC');
                double temp = currencyData['rate'];
                setState(() {
                  currencyValueLTC = temp.round();
                });
              },
              child: Card(
                color: Colors.lightBlueAccent,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                  child: Text(
                    '1 LTC  = $currencyValueLTC  $currentCurency',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // ReuseableCurrencyCard(
          //   coinTicker: coinTicker,
          //   currentCurency: currentCurency,
          //   currentCurepto: 'BTC',
          // ),
          // ReuseableCurrencyCard(
          //     coinTicker: coinTicker,
          //     currentCurency: currentCurency,
          //     currentCurepto: 'ETH'),
          // ReuseableCurrencyCard(
          //     coinTicker: coinTicker,
          //     currentCurency: currentCurency,
          //     currentCurepto: 'LTC'),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getPicker(),
          ),
        ],
      ),
    );
  }
}
//
// class ReuseableCurrencyCard extends StatelessWidget {
//   const ReuseableCurrencyCard({
//     @required this.coinTicker,
//     @required this.currentCurency,
//     @required this.currentCurepto,
//   });
//
//   final CoinTicker coinTicker;
//   final String currentCurency;
//   final String currentCurepto;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
//       child: GestureDetector(
//         onTap: () async {
//           var currencyData = await coinTicker.getData(
//               normal: currentCurency, curepto: currentCurepto);
//           double temp = currencyData['rate'];
//           setState(() {
//             currencyValue = temp.round();
//           });
//         },
//         child: Card(
//           color: Colors.lightBlueAccent,
//           elevation: 5.0,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           child: Padding(
//             padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
//             child: Text(
//               '1 $currentCurepto = $currencyValue  $currentCurency',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 20.0,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
// CupertinoPicker(
// itemExtent: 32.0,
// onSelectedItemChanged: (SelectedIndex) {
// print(SelectedIndex);
// },
// children: [
// Text('USD'),
// Text('EGP'),
// Text('URE'),
// ],
// ),

// DropdownButton(
//   value: CurrentCurency,
//   items: getDropDownItem(),
//   onChanged: (value) {
//     setState(() {
//       CurrentCurency = value;
//     });
//   },
// ),

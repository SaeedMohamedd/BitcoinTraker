import 'package:flutter/material.dart';

import 'networking.dart';

const APIKEY = 'CF2E2A09-3A2C-4269-98D2-2D8975550CE1';
const COINAPIURL = 'https://rest.coinapi.io/v1/exchangerate/';

// curl https://rest.coinapi.io/v1/exchangerate/BTC/USD \
// --request GET
// --header "X-CoinAPI-Key: 73034021-THIS-IS-SAMPLE-KEY"
class CoinTicker {
  Map<String, String> headerAPIKeyMap = {
    'X-CoinAPI-Key': 'CF2E2A09-3A2C-4269-98D2-2D8975550CE1',
  };
  Future<dynamic> getData({String curepto, String normal}) async {
    // print(normal);
    NetworkHelper networkHelper = NetworkHelper(
        url: COINAPIURL + '$curepto' + '/$normal', headerMap: headerAPIKeyMap);
    // NetworkHelper(url: COINAPIURL);
    dynamic currenciesData = await networkHelper.getData();
    return currenciesData;
  }
}

import 'package:bitcoin_ticker_flutter/service/coin_rates.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_ticker_flutter/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  String selectedRate = '?';
  @override
  void initState() {
    super.initState();
    getCoinRatesData();
  }

  void getCoinRatesData() async {
    CoinRatesModel coinRatesModel = CoinRatesModel();
    var data = await coinRatesModel.getCoinRates('BTC', selectedCurrency);
    // print(data);
    setState(() {
      selectedRate = data['rate'].toStringAsFixed(2);
    });
  }

  DropdownButton<String> androidPicker() {
    List<DropdownMenuItem<String>> dropdownMenuItems = [];
    for (String str in currenciesList) {
      Widget value = DropdownMenuItem<String>(
        child: Text(str),
        value: str,
      );
      dropdownMenuItems.add(value);
    }
    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownMenuItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          getCoinRatesData();
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Widget> pickerItems = [];
    for (String str in currenciesList) {
      Widget value = Text(str);
      pickerItems.add(value);
    }
    return CupertinoPicker(
      itemExtent: 32,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: pickerItems,
    );
  }

  Widget getPicker() {
    if (Platform.isIOS) {
      return iOSPicker();
    } else {
      return androidPicker();
    }
  }

  Widget setText() {
    return Text(
      '1 BTC = $selectedRate $selectedCurrency',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.white,
      ),
    );
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
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: setText(),
              ),
            ),
          ),
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

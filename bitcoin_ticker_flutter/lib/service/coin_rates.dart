import 'networking.dart';

const coinApiUrl = "https://rest.coinapi.io/v1/exchangerate/";
const apiKey = "9E3F5F6A-BEF3-4248-A60A-92444BAECD44";

class CoinRatesModel {
  Future<dynamic> getCoinRates(String assetBase, String assetQuote) async {
    // String assetBase = "BTC";
    // String assetQuote = "KRW";
    String url = '$coinApiUrl$assetBase/$assetQuote?apikey=$apiKey';
    NetworkHelper networkHelper = NetworkHelper(url);
    return networkHelper.getData();
  }
}

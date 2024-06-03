import 'package:crypto/models/models.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CoinController extends GetxController {
  RxList<Coin> coinsState = <Coin>[].obs;

  fetchCoins() async {
    var response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=eur&order=market_cap_desc&per_page=100&page=1&sparkline=false'));

    List<Coin> coins = coinsFromJson(response.body);
    coinsState.value = coins;
  }
}

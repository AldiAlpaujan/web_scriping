import 'package:dio/dio.dart';
import 'package:html/parser.dart' as html;

class Data {
  String? productName;
  String? price;

  Future<void> getData() async {
    List<String> lastResultName = [];
    List<String> lastResultPrice = [];
    String apiURL =
        'https://www.bukalapak.com/p/games/growtopia/4gizxdv-jual-world-lock-wl-diamond-lock-dl-growtopia-gt-termurah-terpercaya';

    var response = await Dio().get(apiURL);
    var resultHml = html.parse(response.data);
    var resultDataName =
        resultHml.getElementsByClassName('c-main-product__head--left');
    var resultDataPrice =
        resultHml.getElementsByClassName('c-product-price -discounted -main');
    lastResultName = resultDataName
        .map((e) => e.getElementsByTagName('h1')[0].innerHtml)
        .toList();
    lastResultPrice = resultDataPrice
        .map((e) => e.getElementsByTagName('span')[0].innerHtml)
        .toList();

    productName = lastResultName[0];
    price = lastResultPrice[0];
    print(productName);
  }
}

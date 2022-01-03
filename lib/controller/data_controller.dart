import 'package:get/get.dart';
import 'package:get_data_webs/model/data.dart';

class DataController extends GetxController {
  var data = Data();

  Future<void> pickData() {
    return data.getData().then((value) => update());
  }
}

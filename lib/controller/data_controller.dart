import 'package:get/get.dart';
import 'package:get_data_webs/model/data.dart';

class DataController extends GetxController {
  var data = Data().obs;

  Future<void> pickData() {
    return data.value.getData();
  }
}

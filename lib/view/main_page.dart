import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_data_webs/controller/data_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataController dataC = Get.put(DataController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Data'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  dataC.pickData();
                  print('selesai');
                },
                child: const Text('pick data')),
            const SizedBox(height: 30),
            Obx(
              () => (dataC.data.productName.value == '')
                  ? const Text("Tidak ada data")
                  : Container(
                      height: 150,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 4,
                              offset: Offset(1, 1))
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Product : ${dataC.data.productName.value}'),
                            const SizedBox(height: 5),
                            Text('harga : ${dataC.data.price.value}'),
                          ],
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

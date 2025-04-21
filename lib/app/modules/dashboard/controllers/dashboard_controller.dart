import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ujikom_flutter/app/modules/dashboard/views/kategori_view.dart';
import 'package:ujikom_flutter/app/utils/api.dart';
import 'package:ujikom_flutter/app/data/KategoriResponse.dart';

import '../views/index_view.dart';
import '../views/profile_view.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController

  var selectedIndex = 0.obs;
  final _getConnect = GetConnect();
  final token = GetStorage().read('token');

Future<KategoriResponse> getKategori() async {
  final response = await _getConnect.get(
    BaseUrl.kategori,
    headers: {'Authorization': "Bearer $token"},
    contentType: "application/json",
  );
  return KategoriResponse.fromJson(response.body);
}

void changeIndex(int index) {
    selectedIndex.value = index;
  }

  final List<Widget> pages = [
    BukuView(),
    KategoriView(),
    ProfileView(),
  ];
  @override
  void onInit() {
    getKategori();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}

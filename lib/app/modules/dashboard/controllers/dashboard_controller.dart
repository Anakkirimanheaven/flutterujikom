import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ujikom_flutter/app/data/BukuResponse.dart';
import 'package:ujikom_flutter/app/modules/dashboard/views/index_view.dart';
import 'package:ujikom_flutter/app/modules/dashboard/views/profile_view.dart';
import 'package:ujikom_flutter/app/modules/peminjaman/views/peminjaman_view.dart';
import 'package:ujikom_flutter/app/utils/api.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs;
  final _getConnect = GetConnect();
  final token = GetStorage().read('token');

  var isLoading = true.obs;
  var bukuList = <Buku>[].obs;

  final List<Widget> pages = [
    IndexView(),
    PeminjamanView(),
    ProfileView(),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    fetchBuku();
  }

  Future<void> fetchBuku() async {
    try {
      isLoading.value = true;
      final response = await _getConnect.get(
   '${BaseUrl.baseUrl}${BaseUrl.home}',
     headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final decoded = json.decode(response.bodyString!);
        final bookResponse = BookResponse.fromJson(decoded);
        bukuList.value = bookResponse.buku ?? [];
      } else {
        Get.snackbar('Error', 'Gagal mengambil data buku');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

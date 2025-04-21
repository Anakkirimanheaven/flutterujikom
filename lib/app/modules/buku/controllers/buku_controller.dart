import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ujikom_flutter/app/data/BukuResponse.dart';
import '../../../utils/api.dart';

class BukuController extends GetxController {
  final box = GetStorage();
  final _getConnect = GetConnect();
  final token = GetStorage().read('token');
  final isLoading = false.obs;

  @override
  void onInit() {
    getBuku();
    super.onInit();
  }

  Future<BukuResponse> getBuku() async {
    try {
      final response = await _getConnect.get(
        BaseUrl.buku, // Ganti sesuai endpoint API buku kamu
        headers: {'Authorization': "Bearer $token"},
        contentType: "application/json",
      );

      if (response.statusCode == 200) {
        return BukuResponse.fromJson(response.body);
      } else {
        throw Exception("Failed to load book: ${response.statusText}");
      }
    } catch (e) {
      print("Error: $e");
      rethrow;
    }
  }

  void logout() {
    box.remove('token');
    Get.offAllNamed('/login');
  }
}

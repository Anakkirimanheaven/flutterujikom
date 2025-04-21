import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:ujikom_flutter/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:ujikom_flutter/app/data/BukuResponse.dart' as br;
import 'package:ujikom_flutter/app/modules/dashboard/views/book_detail_view.dart';

class IndexView extends StatelessWidget {
  const IndexView({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardController = Get.find<DashboardController>();
    final String? idUser = GetStorage().read('token');

    if (idUser == null) {
      return Scaffold(
        body: const Center(child: Text("User tidak ditemukan, silakan login ulang.")),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Buku'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          if (dashboardController.isLoading.value) {
            return Center(
              child: Lottie.network(
                'https://gist.githubusercontent.com/olipiskandar/4f08ac098c81c32ebc02c55f5b11127b/raw/6e21dc500323da795e8b61b5558748b5c7885157/loading.json',
                repeat: true,
                width: MediaQuery.of(context).size.width,
              ),
            );
          }

          if (dashboardController.bukuList.isEmpty) {
            return const Center(child: Text("Tidak ada data"));
          }

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.4,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: dashboardController.bukuList.length,
            itemBuilder: (context, index) {
              final br.Buku buku = dashboardController.bukuList[index];

              return GestureDetector(
                onTap: () => Get.to(() => BookDetailView(buku: buku)),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          buku.judul ?? 'Judul tidak tersedia',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${buku.stok ?? 0} Buku tersedia',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}

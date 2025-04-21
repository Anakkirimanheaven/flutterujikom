import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ujikom_flutter/app/data/KategoriResponse.dart';

class KategoriView extends StatefulWidget {
  const KategoriView({super.key});

  @override
  State<KategoriView> createState() => _KategoriViewState();
}

class _KategoriViewState extends State<KategoriView> {
  late Future<KategoriResponse> kategoriFuture;

  @override
  void initState() {
    super.initState();
    kategoriFuture = fetchKategori();
  }

  Future<KategoriResponse> fetchKategori() async {
    final response = await http.get(Uri.parse('http://192.168.0.104:8000/api/kategori'));

    if (response.statusCode == 200) {
      return KategoriResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal memuat data kategori');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Kategori'),
      ),
      body: FutureBuilder<KategoriResponse>(
        future: kategoriFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.data == null || snapshot.data!.data!.isEmpty) {
            return const Center(child: Text('Tidak ada data kategori.'));
          } else {
            final kategoriList = snapshot.data!.data!;
            return ListView.builder(
              itemCount: kategoriList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.category),
                  title: Text(kategoriList[index].namaKategori ?? '-'),
                );
              },
            );
          }
        },
      ),
    );
  }
}

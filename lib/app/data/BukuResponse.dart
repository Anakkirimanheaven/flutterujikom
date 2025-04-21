class bukuResponse {
  bool? success;
  String? message;
  List<Buku>? data;

  bukuResponse({this.success, this.message, this.data});

  bukuResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Buku>[];
      json['data'].forEach((v) {
        data!.add(new Buku.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Buku {
  String? judul;
  int? stok;
  String? tahunTerbit;
  String? code;
  String? fotoBuku;
  String? deskripsi;

  Buku(
      {this.judul,
      this.stok,
      this.tahunTerbit,
      this.code,
      this.fotoBuku,
      this.deskripsi});

  Buku.fromJson(Map<String, dynamic> json) {
    judul = json['judul'];
    stok = json['stok'];
    tahunTerbit = json['tahunTerbit'];
    code = json['code'];
    fotoBuku = json['fotoBuku'];
    deskripsi = json['deskripsi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['judul'] = this.judul;
    data['stok'] = this.stok;
    data['tahunTerbit'] = this.tahunTerbit;
    data['code'] = this.code;
    data['fotoBuku'] = this.fotoBuku;
    data['deskripsi'] = this.deskripsi;
    return data;
  }
}

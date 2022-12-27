class Biodata {
  int? id;
  int nim;
  String nama;
  String alamat;
  String jenisKelamin;
  String tglLahir;

  Biodata({
    this.id,
    required this.nim,
    required this.nama,
    required this.alamat,
    required this.jenisKelamin,
    required this.tglLahir,
  });

  // Untuk mengkonversi object menjadi json
  // Karena SQLite berkomunikasi lewat json baik diterima atau dikirim
  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'nim': nim});
    result.addAll({'nama': nama});
    result.addAll({'alamat': alamat});
    result.addAll({'jenisKelamin': jenisKelamin});
    result.addAll({'tglLahir': tglLahir});

    return result;
  }

  // Untuk mengkonversi json menjadi object
  factory Biodata.fromMap(Map<String, dynamic> map) {
    return Biodata(
      id: map['id'],
      nim: map['nim'],
      nama: map['nama'],
      alamat: map['alamat'],
      jenisKelamin: map['jenisKelamin'],
      tglLahir: map['tglLahir'],
    );
  }
}

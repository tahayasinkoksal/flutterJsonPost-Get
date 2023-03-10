class PaylasimModel{
  int id;
  String baslik;
  String paylasimid;
  List<String> resimler;

  PaylasimModel(this.id, this.baslik, this.paylasimid, this.resimler);

  factory PaylasimModel.fromJson(Map<String, dynamic> json)  {
    return PaylasimModel(
        json["id"] as int,
        json["baslik"] as String,
        json["paylasimid"] as String,
        List<String>.from(json["resimler"].map((x) => x))
    );
  }
}


//----------------------------
//alt kısımdaki yapı, yukarıdaki modeli kullanarak liste olusturuyor
//----------------------------


class PaylasimModelCevap {

  List<PaylasimModel> paylasimListesi;

  PaylasimModelCevap(this.paylasimListesi);

  factory PaylasimModelCevap.fromJson(List<dynamic> json) {
    List<PaylasimModel> paylasimListesi = json.map((jsonArrayNesnesi) => PaylasimModel.fromJson(jsonArrayNesnesi)).toList();
    return PaylasimModelCevap(paylasimListesi);
  }

}

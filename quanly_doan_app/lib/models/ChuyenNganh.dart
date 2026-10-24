class ChuyenNganh {
  String maChuyenNganh;
  String tenChuyenNganh;
  String moTa;
  String maLoai;

  ChuyenNganh({
    required this.maChuyenNganh,
    required this.tenChuyenNganh,
    required this.moTa,
    required this.maLoai
  });
  factory ChuyenNganh.fromJson(Map<String,dynamic> json){
    return ChuyenNganh(
      maChuyenNganh: json["maChuyenNganh"],
      tenChuyenNganh: json["tenChuyenNganh"],
      moTa: json["moTa"],
      maLoai: json["maLoai"],
    );
  }
}
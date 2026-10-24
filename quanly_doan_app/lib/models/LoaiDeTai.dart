class LoaiDeTai
{
    String maLoai;
    String tenLoai;

    LoaiDeTai({
       required this.maLoai,
       required this.tenLoai
    });

     factory LoaiDeTai.fromJson(Map<String,dynamic> json){
    return LoaiDeTai(
      maLoai: json['maLoai'],
      tenLoai: json['tenLoai'],
    );
  }
}
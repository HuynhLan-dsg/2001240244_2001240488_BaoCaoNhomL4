import 'package:flutter/material.dart';
import 'package:quanly_doan_app/models/ChuyenNganh.dart';
import 'package:quanly_doan_app/models/LoaiDeTai.dart';
import 'package:quanly_doan_app/services/api_service.dart';

class Quanlydoan extends StatefulWidget {
  const Quanlydoan({super.key});
  @override
  State<Quanlydoan> createState() => _QuanLyDoAnState();
}

class _QuanLyDoAnState extends State<Quanlydoan> {
  List<LoaiDeTai> dsLoaiDeTai = [];
  List<ChuyenNganh> dsChuyenNganh = [];
  @override
  void initState() {
    super.initState();
    loadLoaiDeTai();
  }

  Future<void> loadLoaiDeTai() async {
    dsLoaiDeTai = await ApiService.getLoaiDeTai();
    setState(() {});
  }

  Future<void> loadChuyenNganh(String maLoai) async {
    dsChuyenNganh = await ApiService.getChuyenNganh(maLoai);
    print("So luong: ${dsChuyenNganh.length}");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:
      const Row(
        children: [
          Icon(Icons.home, color: Colors.black,),
          const SizedBox(width: 8,),
          Text("List view Demon")
        ],
      ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Chon Loai de tai",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dsLoaiDeTai.length,
                itemBuilder: (context, index) {
                  var loai = dsLoaiDeTai[index];

                  return GestureDetector(
                    onTap: () async {
                      await loadChuyenNganh(loai.maLoai);
                    },
                    child: Container(
                      width: 80,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 10,
                      ),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.blue,
                            child: Text(
                              loai.maLoai,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            loai.tenLoai,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Chon Chuyen De Thuc Hien",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: dsChuyenNganh.length,
                itemBuilder: (context, index) {
                  var chuyenNganh = dsChuyenNganh[index];

                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      leading: const Icon(Icons.school, color: Colors.blue),

                      title: Text(chuyenNganh.tenChuyenNganh),

                      subtitle: Text(chuyenNganh.moTa ?? ""),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

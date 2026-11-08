import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/penjumlahan_controller.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PenjumlahanController>();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FF),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Detail Penjumlahan',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color(0xFFF8F9FF),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Obx(() {
            final data = controller.dataPenjumlahan.value;

            if (data == null) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Belum ada data',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => Get.back(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF2F3FA),
                      foregroundColor: const Color(0xFF416994),
                      elevation: 1.5,
                      shadowColor: Colors.black26,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text(
                      'Kembali',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF416994),
                      ),
                    ),
                  ),
                ],
              );
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14.0),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 1.2,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Angka Pertama : ${controller.formatNumber(data.angka1)}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Angka Kedua : ${controller.formatNumber(data.angka2)}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Divider(
                        height: 28,
                        thickness: 1,
                        color: Color(0xFFE0E0E0),
                      ),
                      Text(
                        'Hasil Penjumlahan : ${controller.formatNumber(data.hasil)}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1976D2),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => Get.back(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF2F3FA),
                    foregroundColor: const Color(0xFF416994),
                    elevation: 1.5,
                    shadowColor: Colors.black26,
                    padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 12),
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(
                    'Kembali',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF416994),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

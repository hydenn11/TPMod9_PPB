import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/penjumlahan_controller.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PenjumlahanController());

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FF),
      appBar: AppBar(
        title: const Text(
          'Kalkulator Penjumlahan',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color(0xFFF8F9FF),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller.angka1Controller,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: 'Masukkan Angka Pertama',
                  labelStyle: TextStyle(color: Colors.grey.shade600),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.blue, width: 1.5),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Masukkan angka pertama';
                  }
                  if (num.tryParse(value.trim()) == null) {
                    return 'Input harus berupa angka';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controller.angka2Controller,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: 'Masukkan Angka Kedua',
                  labelStyle: TextStyle(color: Colors.grey.shade600),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.blue, width: 1.5),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Masukkan angka kedua';
                  }
                  if (num.tryParse(value.trim()) == null) {
                    return 'Input harus berupa angka';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 46,
                child: ElevatedButton(
                  onPressed: controller.hitungPenjumlahan,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF2F3FA),
                    foregroundColor: const Color(0xFF416994),
                    elevation: 1.5,
                    shadowColor: Colors.black26,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(
                    'Jumlahkan',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF416994),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Obx(
                () => Text(
                  'Jumlah Perhitungan: ${controller.jumlahPerhitungan.value}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Obx(() {
                final data = controller.dataPenjumlahan.value;
                if (data == null) {
                  return GestureDetector(
                    onTap: () => Get.to(() => const DetailPage()),
                    child: const Text(
                      'Belum ada data',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  );
                }
                return GestureDetector(
                  onTap: () => Get.to(() => const DetailPage()),
                  child: Text(
                    'Hasil: ${controller.formatNumber(data.hasil)} (Tekan untuk detail)',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1976D2),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

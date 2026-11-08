import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/penjumlahan_model.dart';

class PenjumlahanController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final angka1Controller = TextEditingController();
  final angka2Controller = TextEditingController();

  final jumlahPerhitungan = 0.obs;
  final dataPenjumlahan = Rxn<Penjumlahan>();

  String formatNumber(num value) {
    if (value % 1 == 0) {
      return value.toInt().toString();
    }
    return value.toString();
  }

  void hitungPenjumlahan() {
    if (formKey.currentState!.validate()) {
      final num1 = num.parse(angka1Controller.text.trim());
      final num2 = num.parse(angka2Controller.text.trim());
      final sum = num1 + num2;

      dataPenjumlahan.value = Penjumlahan(
        angka1: num1,
        angka2: num2,
        hasil: sum,
      );

      jumlahPerhitungan.value++;

      Get.snackbar(
        'Berhasil',
        'Proses penjumlahan berhasil dilakukan (${formatNumber(num1)} + ${formatNumber(num2)} = ${formatNumber(sum)})',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFFC8E6C9),
        colorText: Colors.black87,
        borderRadius: 14,
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
        duration: const Duration(seconds: 3),
      );
    }
  }

  @override
  void onClose() {
    angka1Controller.dispose();
    angka2Controller.dispose();
    super.onClose();
  }
}

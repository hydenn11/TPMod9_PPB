import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:modul_9/controllers/penjumlahan_controller.dart';
import 'package:modul_9/main.dart';

void main() {
  testWidgets('Kalkulator Penjumlahan test', (WidgetTester tester) async {
    Get.testMode = true;

    await tester.pumpWidget(const MyApp());
    await tester.pump();

    // Verify initial state
    expect(find.text('Kalkulator Penjumlahan'), findsOneWidget);
    expect(find.text('Jumlah Perhitungan: 0'), findsOneWidget);
    expect(find.text('Belum ada data'), findsOneWidget);

    // Enter numbers into fields
    final textFields = find.byType(TextFormField);
    expect(textFields, findsNWidgets(2));

    await tester.enterText(textFields.at(0), '1');
    await tester.enterText(textFields.at(1), '2');

    // Tap Jumlahkan button
    await tester.tap(find.text('Jumlahkan'));
    await tester.pump();

    // Verify updated state
    expect(find.text('Jumlah Perhitungan: 1'), findsOneWidget);
    expect(find.text('Hasil: 3 (Tekan untuk detail)'), findsOneWidget);

    // Tap result to navigate to Detail
    await tester.tap(find.text('Hasil: 3 (Tekan untuk detail)'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    // Verify Detail Page
    expect(find.text('Detail Penjumlahan'), findsOneWidget);
    expect(find.text('Angka Pertama : 1'), findsOneWidget);
    expect(find.text('Angka Kedua : 2'), findsOneWidget);
    expect(find.text('Hasil Penjumlahan : 3'), findsOneWidget);

    // Advance time until snackbar dismisses and animations complete
    await tester.pump(const Duration(seconds: 4));
    await tester.pumpAndSettle();
  });

  test('Unit test PenjumlahanController logic', () {
    final controller = PenjumlahanController();
    expect(controller.jumlahPerhitungan.value, 0);
    expect(controller.dataPenjumlahan.value, isNull);

    controller.angka1Controller.text = '5';
    controller.angka2Controller.text = '7';
    expect(controller.formatNumber(5), '5');
    expect(controller.formatNumber(5.5), '5.5');
  });
}

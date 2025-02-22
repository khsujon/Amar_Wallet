import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:path_provider/path_provider.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({super.key});

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  final GlobalKey _barcodeKey = GlobalKey();
  final String barcodeData = "931166145931635220";
  final String folderPath = "/storage/emulated/0/Download/Barcodes";

  Future<void> _saveBarcode() async {
    try {
      RenderRepaintBoundary boundary = _barcodeKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 3.0);

      // Drawing White Background to prevent transparency issues
      final whitePaint = Paint()..color = Colors.white;
      final recorder = PictureRecorder();
      final canvas = Canvas(recorder,
          Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()));
      canvas.drawRect(
          Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
          whitePaint);
      canvas.drawImage(image, Offset.zero, Paint());
      final picture = recorder.endRecording();
      final img = await picture.toImage(image.width, image.height);

      ByteData? byteData = await img.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      // Ensure the directory exists
      Directory barcodeDir = Directory(folderPath);
      if (!await barcodeDir.exists()) {
        await barcodeDir.create(recursive: true);
      }

      // Check for duplicate filenames and avoid overwriting
      String fileName = "barcode";
      int i = 1;
      while (await File("$folderPath/$fileName.png").exists()) {
        fileName = "barcode_$i";
        i++;
      }

      final file = File("$folderPath/$fileName.png");
      await file.writeAsBytes(pngBytes);

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Center(child: Text("Barcode saved as $fileName.png"))),
      );
    } catch (e) {
      print("Error saving barcode: $e");
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Center(child: Text("Something went wrong!"))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(CupertinoIcons.back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Scan QR Code',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/demo_profile.png'),
                ),
                SizedBox(width: 8),
                Text('Mash Potato',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ],
            ),
            const SizedBox(height: 20),
            RepaintBoundary(
              key: _barcodeKey,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    BarcodeWidget(
                      data: barcodeData,
                      barcode: Barcode.code128(),
                      width: 200,
                      height: 80,
                      drawText: false,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 10),
                    Text(barcodeData,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _saveBarcode,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        label: const Text('Download Barcode',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
      ),
    );
  }
}

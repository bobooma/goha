import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  UploadTask? task;
  File? file;

  String imgUrl = "";

  String madeIn = "";
  String availability = "";

  String prodName = "";
  String materials = "";
  String price = "";
  String priceAfterDiscount = "";
  String durationOfDiscount = "";

  final prodController = TextEditingController();
  final materialsController = TextEditingController();
  final madeInController = TextEditingController();
  final availabilityController = TextEditingController();

  final priceController = TextEditingController();
  final priceAfterDiscController = TextEditingController();
  final durationOfDiscController = TextEditingController();

  Future<void> selectFile() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
    );
    if (result == null) return;
    final path = result.files.single.path!;
    setState(() => file = File(path));
  }

  Future<void> uploadFile() async {
    if (file == null) return;

    final fileName = basename(file!.path);
    final destination = fileName;
    task = FirebaseApi.uploadfile(destination, file!);

    setState(() {});

    if (task == null) return;
    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    setState(() {
      imgUrl = urlDownload;
    });

    print("url:  ..$urlDownload");
  }

  void addFile() {
    try {
      FirebaseFirestore.instance.collection("products").add({
        "prodName": prodName,
        "availability": availability,
        "materials": materials,
        "durationOfDiscount": durationOfDiscount,
        "priceAfterDiscount": priceAfterDiscount,
        "madeIn": madeIn,
        "price": price,
        "imgUrl": imgUrl,
        "time": Timestamp.now()
      });
      prodController.clear();
      materialsController.clear();
      madeInController.clear();
      availabilityController.clear();
      priceAfterDiscController.clear();
      durationOfDiscController.clear();
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final fileName = file != null
        ? basename(file!.path)
        : " لم تقم باختيار ملف يا أبوربيع 😄 ";

    return Scaffold(
      appBar: AppBar(
        title: const Text('تحميل المنتج'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: selectFile,
              child: Row(
                children: const [
                  Icon(Icons.attach_file),
                  Text('اختر صورة'),
                ],
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  minimumSize: const Size.fromHeight(50)),
            ),
            Text(fileName),
            ElevatedButton(
              onPressed: uploadFile,
              child: Row(children: const [
                Icon(Icons.upload_file),
                Text(
                  'تحميل الصورة',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
            ),
            task != null
                ? StreamBuilder<TaskSnapshot>(
                    stream: task!.snapshotEvents,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final snap = snapshot.data!;
                        final progress =
                            snap.bytesTransferred / snap.totalBytes;
                        final percentage = (progress * 100).toStringAsFixed(2);
                        return Text('$percentage %');
                      } else {
                        return Container();
                      }
                    },
                  )
                : Container(),
            Container(
              height: 400,
              child: ListView(children: [
                Expanded(
                  child: TextField(
                    controller: prodController,
                    decoration: const InputDecoration(
                        labelText: "اسم المنتج",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2))),
                    onChanged: (value) {
                      setState(() {
                        prodName = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: materialsController,
                    decoration: const InputDecoration(
                        labelText: "الخامة",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2))),
                    onChanged: (value) {
                      setState(() {
                        materials = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: madeInController,
                    decoration: const InputDecoration(
                        labelText: "التصنيع",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2))),
                    onChanged: (value) {
                      setState(() {
                        madeIn = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: availabilityController,
                    decoration: const InputDecoration(
                        labelText: "توفر المنتج",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2))),
                    onChanged: (value) {
                      setState(() {
                        availability = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: TextField(
                    // keyboardType: TextInputType.number,
                    controller: priceController,
                    decoration: const InputDecoration(
                      labelText: "السعر",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        price = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: TextField(
                    // keyboardType: TextInputType.number,
                    controller: priceAfterDiscController,
                    decoration: const InputDecoration(
                      labelText: " السعر بعد الخصم",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        priceAfterDiscount = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: TextField(
                    // keyboardType: TextInputType.number,
                    controller: durationOfDiscController,
                    decoration: const InputDecoration(
                      labelText: "مدة الخصم",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        durationOfDiscount = value;
                      });
                    },
                  ),
                ),
                IconButton(
                  onPressed: prodName.trim().isEmpty ||
                          materials.trim().isEmpty ||
                          price.trim().isEmpty
                      ? null
                      : () {
                          FocusScope.of(context).unfocus();
                          addFile();
                        },
                  icon: const Icon(Icons.send),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class FirebaseApi {
  static UploadTask? uploadfile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putFile(file);
    } catch (e) {
      return null;
    }
  }

  static UploadTask? uploadByte(String destinsation, Uint8List data) {
    try {
      final ref = FirebaseStorage.instance.ref(destinsation);
      return ref.putData(data);
    } on Exception catch (e) {
      return null;
    }
  }
}

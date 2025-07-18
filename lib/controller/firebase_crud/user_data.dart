import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;

class UserDataFirestore {
  Future<void> tambahUser(String nama, dynamic telepon, String email,
      String alamat, String password, String role, String uid) async {
    try {
      await FirebaseFirestore.instance.collection('user').doc(uid).set({
        "nama": nama,
        "noTelp": telepon,
        "email": email,
        "alamat": alamat,
        "password": password,
        "role": role,
      });
      print('Data user berhasil ditambahkan dengan UID: $uid');
    } catch (e) {
      print('Gagal menambahkan data user: $e');
    }
  }

  void hapusUser(String id) async {
    await _firestore.collection('user').doc(id).delete();
  }

  void updateUser(String id, String nama, dynamic telepon, String email,
      String alamat, String password, String role) async {
    await _firestore.collection('user').doc(id).update({
      "nama": nama,
      "alamat": alamat,
      "telepon": telepon,
      "email": email,
      "password": password,
      "role": role,
    });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class SlectiValidator {
  // -- Name Validation
  static String? nameValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama tidak boleh kosong.';
    } else if (value.length < 2) {
      return 'Nama harus memiliki minimal 2 karakter.';
    } else if (value.length > 30) {
      return 'Nama harus memiliki maksimal 30 karakter.';
    } else if (!RegExp(r"^[a-zA-Z\s'-]{2,50}$").hasMatch(value)) {
      return 'Nama hanya boleh mengandung huruf, spasi, tanda kutip, atau tanda hubung.';
    }
    return null;
  }

  // -- Email Validation
  static bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  static String? forgetPasswordEmailValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email tidak boleh kosong.';
    } else if (!isValidEmail(value)) {
      return 'Silahkan masukkan format email yang valid';
    }
    return null;
  }

  static Future<bool> isEmailRegistered(String email) async {
    final CollectionReference userCollection = FirebaseFirestore.instance.collection('user');
    QuerySnapshot querySnapshot = await userCollection.where('email', isEqualTo: email).get();
    return querySnapshot.docs.isNotEmpty;
  }

  static String? emailValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email tidak boleh kosong.';
    } else if (!isValidEmail(value)) {
      return 'Silakan masukkan format email yang valid.';
    }
    return null;
  }

  // -- RegisterPassword Validation
  static String? passwordValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong.';
    } else if (value.length < 6) {
      return 'Password harus terdiri dari minimal 6 karakter.';
    }
    return null;
  }

  // -- Login Password Validation
  static String? loginPasswordValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'ⓘ Oops, password kamu salah.';
    } else if (value.length < 6) {
      return 'Password harus terdiri dari minimal 6 karakter.';
    }
    return null;
  }

  // -- Confirm Password Validation
  static String? confirmPasswordValidate(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Konfirmasi password tidak boleh kosong.';
    } else if (value != password) {
      return 'Password tidak sama.';
    }
    return null;
  }

  // -- Phone Number Validation
  static String? phoneNumberValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nomor telepon tidak boleh kosong.';
    } else if (!RegExp(r'^\d{10,15}$').hasMatch(value)) {
      return 'Nomor telepon harus berisi 10 hingga 15 digit angka.';
    }
    return null;
  }
}

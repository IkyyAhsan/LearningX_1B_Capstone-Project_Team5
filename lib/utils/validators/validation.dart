// -- Validator on TextFormField

class SlectiValidator {
  // -- name Validation
  static String? nameValidate(String? value){
    if (value == null || value.isEmpty){
      return 'Nama tidak boleh kosong.';
    } else if (value.length < 2){
      return 'Nama harus memiliki minimal 2 karakter';
    } else if (value.length > 30){
      return 'Nama harus memiliki maksimal 30 karakter';
    } else if (!RegExp(r"^[a-zA-Z\s'-]{2,50}$").hasMatch(value)) {
      return 'Nama tidak boleh mengandung karakter Special';
    }
    return null;
  }

  // -- Email Validation
  static bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
    }

  static String? emailValidate(String? value){
    if (value == null || value.isEmpty){
      return 'Email tidak boleh kosong.';
    } else if (!isValidEmail(value)){
      return 'Silahkan masukkan format email yang valid';
    }
    return null;
  }

  // -- RegisterPassword Validation
  static String? passwordValidate(String? value){
    if (value == null || value.isEmpty){
      return 'Password tidak boleh kosong';
    } else if (value.length < 6){
        return 'Password terdiri dari minimal 6 karakter';
    }
    return null;
  }

  // -- Login Password Validation
  static String? loginPasswordValidate(String? value){
    if (value == null || value.isEmpty){
      return 'ⓘ Oops, password kamu salah';
    } else if (value.length < 6){
        return 'Password terdiri dari minimal 6 karakter';
    }
    return null;
  }

  // -- Confirm Password Validation
  static String? confirmPasswordValidate(String? value, String password){
    if (value == null || value.isEmpty){
      return 'Konfirmasi Password tidak boleh kosong';
    } else if (value.length < 6){
        return 'Password terdiri dari minimal 6 karakter';
    } else if (value != password){
      return 'Password tidak sama';
    }
    return null;
  }

  // -- Phone Number Validation
  static String? phoneNumberValidate(String? value,){
    if (value == null || value.isEmpty){
      return 'Konfirmasi Password tidak boleh kosong';
    } else if (!RegExp(r'^\d{10,15}$').hasMatch(value)){
      return 'Nomor telepon harus berisi 10 hingga 15 digit angka';
    }
    return null;
  }
}
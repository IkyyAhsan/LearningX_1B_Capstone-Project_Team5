// -- Validator on TextFormField

class SlectiValidator {
  // -- fullname Validation
  static String? nameValidate(String? value){
    if (value == null || value.isEmpty){
      return 'Nama tidak boleh kosong.';
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
}
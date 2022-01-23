class Validation{

  static String? checkMail(String val){
    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regExp = RegExp(pattern);
    if (val == null || val.isEmpty) {
      return 'Please enter email';
    }else if (!regExp.hasMatch(val)) {
      return 'Email Incorrect';
    }
    return null;
  }

  static String? checkPassword(String val){
    if (val == null || val.isEmpty) {
      return 'Please enter password';
    }else if(val.length <= 6){
      return 'Password must be stronger';
    }
    return null;
  }

  static String? checkUsername(String val){
    if (val == null || val.isEmpty) {
      return 'Please enter username';
    }else if(val.length <= 5){
      return 'Username must be longer 5 character';
    }
    return null;
  }

  static String? checkPhone(String val){
    if (val == null || val.isEmpty) {
      return 'Please enter phone number';
    }else if(val.length <= 8){
      return 'Username must be longer 8 character';
    }
    return null;
  }
}
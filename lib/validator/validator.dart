class Validator{
  static String? validatorField(String value){
    if(value.isEmpty)
      {
        return 'This field is required';
      }
    return null;
  }

  static String? validateUserId(String value){
    if(value.isEmpty)
      {
        return 'User Id is required';
      }
    else if(value.length < 6){
      return 'UserId must be greater then 5 characters';
    }
    return null;
  }
}
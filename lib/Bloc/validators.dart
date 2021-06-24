


import 'dart:async';

import 'package:email_validator/email_validator.dart';

class Validators {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
     if (EmailValidator.validate(email)) {
      sink.add(email);
      }else{
       sink.addError("invalid Email");
     }
    }
  );




  final ValidatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink){
        if (password.length > 3) {
          sink.add(password);
        }else{
          sink.addError("invalid password");
        }
      }
  );
}
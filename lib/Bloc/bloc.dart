

import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:Bloc/Bloc/validators.dart';

class Bloc with Validators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  //Sink to add to Stream
  Function(String)   get changeEmail => _email.sink.add;

  Function(String)    get changePassword => _password.sink.add;



  // Retreive data from strea
 Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<bool> get SubmitValid => Rx.combineLatest2(email, password, (a, b) => true);
  Stream<String>   get password => _password.stream.transform(ValidatePassword);


  submit(){
    var validEmail = _email.value;
    var validpass = _password.value;
    print(validpass);
    print(validEmail);
  }


dispose(){
  _email.close();
  _password.close();
}

}

// final bloc = Bloc();
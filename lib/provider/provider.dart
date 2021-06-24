

import 'package:Bloc/Bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class Provider extends InheritedWidget{
  final bloc = Bloc();

  Provider({Key key, Widget child}): super(key: key, child: child);
  @override
  bool updateShouldNotify(_) => true;

  static Bloc of(BuildContext context){

    return(context.dependOnInheritedWidgetOfExactType<Provider>()).bloc;

  }

}
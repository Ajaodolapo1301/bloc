

import 'package:Bloc/Bloc/bloc.dart';
import 'package:Bloc/provider/provider.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
// Bloc bloc;
  @override
  Widget build(BuildContext context) {
   final  bloc = Provider.of(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            emailWid(bloc),
            SizedBox(height: 10,),
            passWid(bloc),
              SizedBox(height: 10,),
              StreamBuilder(
                stream: bloc.SubmitValid,
                builder: (context, snapshot){
                    print(" has error ${snapshot.hasError}");
              return    RaisedButton(
                  color: Colors.blue,

                    onPressed: snapshot.hasError ? null  : bloc.submit,
                    child: Text("Submit"),
                  );

                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget emailWid(bloc){
    return   StreamBuilder(
      stream: bloc.email,
      builder: (c, snapshot) {
        return TextField(
          decoration: InputDecoration(
              hintText: "Email",
              labelText: "Email",
              errorText: snapshot.error),
          onChanged: bloc.changeEmail,
        );
      },
    );
  }

  Widget passWid(bloc){

    return  StreamBuilder(
        stream: bloc.password,
        builder: (context, snapShot) {
          return TextField(
            decoration: InputDecoration(
              hintText: "Password",
              labelText: "Password",
              errorText:      snapShot.error,
            ),
            onChanged:bloc.changePassword,
          );
        });
  }


}

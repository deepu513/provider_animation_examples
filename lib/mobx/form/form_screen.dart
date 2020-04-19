import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'form_store.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final FormStore store = FormStore();

  @override
  void initState() {
    super.initState();
    store.setupValidations();
  }

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login Form'),
        ),
        body: Form(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                Observer(
                  builder: (_) => TextField(
                    onChanged: (value) => store.name = value,
                    decoration: InputDecoration(
                        labelText: 'Username',
                        hintText: 'Pick a username',
                        errorText: store.error.username),
                  ),
                ),
                Observer(
                  builder: (_) => TextField(
                    onChanged: (value) => store.email = value,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email address',
                        errorText: store.error.email),
                  ),
                ),
                Observer(
                  builder: (_) => TextField(
                    onChanged: (value) => store.password = value,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Set a password',
                        errorText: store.error.password),
                  ),
                ),
                RaisedButton(
                  child: const Text('Sign up'),
                  onPressed: store.validateAll,
                )
              ],
            ),
          ),
        ));
  }
}

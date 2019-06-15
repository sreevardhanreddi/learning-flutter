import 'package:flutter/material.dart';
import '../../bloc/bloc_converter.dart';
import '../../bloc/provider_converter.dart';

class InputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      child: new InputTextField(),
    );
  }
}

class InputTextField extends StatelessWidget {
  const InputTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocConverter();
    return StreamBuilder<Object>(
        stream: bloc.inputAmount,
        builder: (context, snapshot) {
          return TextField(
            onChanged: (data) {
              bloc.ChangedAmount(data);
            },
            decoration: InputDecoration(
              hintText: 'Amount',
              labelText: 'int or double',
              errorText: snapshot.error,
            ),
          );
        });
  }
}

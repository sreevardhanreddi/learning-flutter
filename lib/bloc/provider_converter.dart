import 'package:flutter/material.dart';
import './bloc_converter.dart';

class ProviderConverter extends InheritedWidget {
  final bloc = BlocConverter();

  ProviderConverter({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static BlocConverter of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ProviderConverter)
            as ProviderConverter)
        .bloc;
  }
}

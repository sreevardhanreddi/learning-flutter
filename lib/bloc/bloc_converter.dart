import 'dart:async';

class BlocConverter {
  final _inputAmount = StreamController<String>();

  // getter for inputAmount

  Stream<String> get inputAmount => _inputAmount.stream
          .transform(StreamTransformer.fromHandlers(handleData: (data, sink) {
        if (data.contains(';')) {
          sink.addError('contains ";" !!!');
        } else {
          sink.add(data);
        }
      }));

  // changing data
  Function(String) get changeAmount => _inputAmount.sink.add;

  // mutating data, above code is same, but syntax differs
  ChangedAmount(data) {
    print('changed amount in bloc');
    print(data);
    print(_inputAmount);
    // print(_inputAmount.);
    // if (data == ';') {
    //   return _inputAmount.sink.addError('contains ";" !!!');
    // }
    return _inputAmount.sink.add(data);
  }
}

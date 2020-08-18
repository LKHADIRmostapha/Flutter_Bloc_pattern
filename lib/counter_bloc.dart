import 'dart:async';
import 'package:bloc_pattern_app/counter_event.dart';


class CounterBloc {
  int _counter;
  final _counterStateController = StreamController<int>();
  StreamSink<int> get _inController => _counterStateController.sink ;
  Stream<int> get _outController => _counterStateController.stream;


  final _counterEventController = StreamController<CounterEvent>();
  Sink<CounterEvent> get _counterEventSink => _counterEventController.sink;


  CounterBloc(){
    _counterEventController.stream.listen(_mapEventToState);
  }


  void _mapEventToState (CounterEvent event){
    if(event == IncrementEvent){
      _counter ++;
    }else
      _counter --;
    _inController.add(_counter);
  }

  void dispose(){
    _counterEventController.close();
    _counterStateController.close();
  }
}
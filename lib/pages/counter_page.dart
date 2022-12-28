import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample3/providers/counter.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int myCounter = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<Counter>().increment();
      myCounter = context.read<Counter>().counter + 10;
    });
    // Future.delayed(Duration(seconds: 0), () {
    //   context.read<Counter>().increment();
    //   myCounter = context.read<Counter>().counter + 10;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Page'),
      ),
      body: Center(
        child: Text(
          'couner: ${context.watch<Counter>().counter} / my counter: ${myCounter}',
          style: TextStyle(fontSize: 30),
          textAlign: TextAlign.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<Counter>().increment(),
        child: Icon(Icons.add),
      ),
    );
  }
}

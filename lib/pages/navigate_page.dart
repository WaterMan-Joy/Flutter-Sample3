import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample3/providers/counter.dart';

class NavigatoePage extends StatefulWidget {
  const NavigatoePage({super.key});

  @override
  State<NavigatoePage> createState() => _NavigatoePageState();
}

class _NavigatoePageState extends State<NavigatoePage> {
  @override
  Widget build(BuildContext context) {
    if (context.read<Counter>().counter == 10) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtherPage(),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Navigate Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${context.watch<Counter>().counter}',
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<Counter>().increment();
              },
              child: Text(
                'ADD',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OtherPage extends StatefulWidget {
  const OtherPage({super.key});

  @override
  State<OtherPage> createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Other Page'),
      ),
      body: Center(
        child: Text(
          'Other Page',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}

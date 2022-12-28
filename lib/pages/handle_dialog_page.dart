import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/counter.dart';

class HandleDialogPage extends StatefulWidget {
  const HandleDialogPage({super.key});

  @override
  State<HandleDialogPage> createState() => _HandleDialogPageState();
}

class _HandleDialogPageState extends State<HandleDialogPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text('hui'),
        ),
      ),
    );
    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return AlertDialog(
    //       content: Text('Hi'),
    //     );
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    if (context.read<Counter>().counter == 3) {
      WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text('${context.read<Counter>().counter} 보다 작아야 합니다'),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Handle dolapg page'),
      ),
      body: Center(
        child: Text(
          '${context.watch<Counter>().counter}',
          style: TextStyle(fontSize: 40),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<Counter>().increment(),
        child: Icon(Icons.add),
      ),
    );
  }
}

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Other Page'),
      ),
      body: Center(
        child: Text(
          'Other',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_lab/cloud_functions_demo/cloud_func_controller.dart';

class CloudFunctionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const SizedBox spaceDefult = SizedBox(
      height: 16.0,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cloud Functions Demo ',
        ),
        actions: [
          Text(
            '🔥',
            style: TextStyle(fontSize: 35),
          )
        ],
      ),
      body: Column(
        children: [
          spaceDefult,
          addResturent(),
        ],
      ),
    );
  }

  Widget addResturent() {
    String name = '';
    int rate = 0;
    const SizedBox spicelSpace = SizedBox(
      width: 4.0,
    );

    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) => name = value,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Name'),
                ),
              ),
              spicelSpace,
              Expanded(
                  child: TextField(
                onChanged: (value) => rate = int.parse(value),
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Rate'),
              )),
            ],
          ),
          TextButton(
              onPressed: () {
                addResturentToFirestore(name: name, rate: rate);
              },
              child: Text('Submit'))
        ],
      ),
    );
  }
}

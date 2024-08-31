import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_restaurant/model/counter_provider.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return  Consumer<NumberListProvider>(
      builder: (context, provider, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text('Second Page', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Action when the button is pressed
            provider.increment();
          },
          tooltip: 'Add Item',
          backgroundColor: Colors.orange,
          child: const Icon(Icons.add, size: 30),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Current Count: ${provider.numberList.last}', 
                  style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: provider.numberList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 4.0),
                      padding: const EdgeInsets.all(16.0),
                      color: Colors.grey[200],
                      child: Text('Item ${provider.numberList[index]}',
                          style: TextStyle(color: Colors.black87, fontSize: 18)),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
            
            ],
          ),
        )),
    );
  }
}

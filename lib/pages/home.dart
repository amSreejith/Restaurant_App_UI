import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_restaurant/model/counter_provider.dart';
import 'package:sushi_restaurant/pages/seconpage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumberListProvider>(
      builder: (context, numberList, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text('Home Page', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            numberList.increment();
            // Action when the button is pressed
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
              Text(numberList.numberList.last.toString(), 
                  style: const TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: numberList.numberList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 4.0),
                      padding: const EdgeInsets.all(16.0),
                      color: Colors.grey[200],
                      child: Text(numberList.numberList[index].toString(),
                          style: TextStyle(color: Colors.black87, fontSize: 18)),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the second page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SecondPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                   
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Text('Go to Second Page'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

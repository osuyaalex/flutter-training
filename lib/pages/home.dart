import 'package:flutter/material.dart';
import 'package:flutter_newwww/ui/cusbot.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New App'),
        actions: [
          IconButton(onPressed: () =>debugPrint('Tapped!'), icon: Icon(Icons.ac_unit))
        ],
      ),
      body: Container(
        alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              GestureDetector(   //inkwell can also be used here but gesturedetector is the more common one
                child: const Text('Tap me', style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),),
                onDoubleTap: () {
                  debugPrint('stuff');
                },
              ),
              const CustomButton(),
            ],
          )
      ),
      bottomNavigationBar: BottomNavigationBar(items:  [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home', ),
        BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'edit', )
      ],
        onTap: (int index){
          debugPrint('Tapped item: $index');
        },
      ),
    );

  }
}

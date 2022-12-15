import 'package:flutter/material.dart';

class Wisdom extends StatefulWidget {
  const Wisdom({Key? key}) : super(key: key);

  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {

  int _index = 0;

  List quotes = [
    "Life isn't about getting and having, it's about giving and being",
    "Whatever the mind of a man can conceive and believe, it can achieve",
    "Be yourself; everyone else is already taken",
    "Be the change that you wish to see in the world",
    "Live as if you were to die tomorrow. Learn as if you were to live forever"
        "We accept the love we think we deserve."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(                                                          //Expanded widget actually makes whatever it is enclosing take all the available space in the screen
                child: Center(
                  child: Container(
                    height: 250,
                      width: 350,
                      decoration:  BoxDecoration(
                        color: Colors.transparent,
                       borderRadius: BorderRadius.circular(14.5)
                      ),
                      child: Center(child: Text(quotes[_index % quotes.length], style:  TextStyle(
                        color: Colors.grey.shade600
                      ),))  // aiit so this is how this goes. we have six quotes above. and index starts from the first quote (ie index = 0). so what is inthe list is basically 0 (index) divided by `(%) 5 (quotes.lenght). thats 0 right. then it goes to the next value. 1 divided by 5. thats 4 remainder 1 yea. the code basically picks the 'remainder' as its next index and puts the value of that remainder on the screen. so when it gets to the index of the last value (5 % 5) thats 1 remainder 0 there by restarting the loop
                  ),
                ),
              ),

              const Divider(
                thickness: 1.3,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton.icon(onPressed: () {
                  setState(() {
                    _index += 1;
                  });
                },
                  icon: const Icon(Icons.ac_unit_rounded),
                  label: const Text("Inspire Me"),
                ),
              ),
              const Spacer(),
            ],
          ),

      ),

    );
  }
}


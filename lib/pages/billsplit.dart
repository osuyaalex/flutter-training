import 'package:flutter/material.dart';
import 'package:flutter_newwww/calculations/totalperperson.dart';

class BillSplitter extends StatefulWidget {
  const BillSplitter({Key? key}) : super(key: key);

  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {

  int tipPercentage = 0;
  int personCounter = 1;
  double billAmount = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),  //media query is mostly concerned with the manipulation of the things in the screen. usong media query here is basically to make sure that this particular margin is constant regardless of the type of screen (whether tab, phone ...) we run it
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.0),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.blueAccent.shade200,
                  borderRadius: BorderRadius.circular(12.0),
                  

                ),
                child:Center(
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Text('Total Per Person', style: TextStyle(
                        color: Colors.white,
                        fontSize: 15
                      ),),
                      Text('\$ ${calculateTotalPerPerson(billAmount, personCounter, tipPercentage)}', style: TextStyle(
                          color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),)

                    ],
                  ),
                )
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.blueGrey.shade200,
                  style: BorderStyle.solid
                ),
                borderRadius: BorderRadius.circular(12.0)
                  
              ),
              child: Column(
                children:  [
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold
                    ),
                    decoration: const InputDecoration(
                      prefixText: 'Bill Amount',
                       prefixIcon: Icon(Icons.monetization_on),
                    ),
                    onChanged: (String value){
                      try{                                  // we know that textfield is mainly for user input. trycatch is basically to catch any errors that the user makes
                           billAmount = double.parse(value);               // onChanged must always return a string value however billAmount is a double value. so parse is basically to convert it to a string using "value"  (String ->value<-)
                      }catch(exception){
                        billAmount = 0.0;
                      }
                    },
                  ),
                  Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text('Split',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                if (personCounter > 1)
                                  personCounter-= 1;
                                else{

                                }
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent.shade200,
                                  borderRadius: BorderRadius.circular(7.0)
                                ),
                                child: const Center(child: Text('-', style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.9,

                                ),)),
                              ),
                            ),
                          ),
                          Text('$personCounter', style: TextStyle(
                            fontSize: 17.9,
                          ),),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                personCounter+=1;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent.shade200,
                                    borderRadius: BorderRadius.circular(7.0)
                                ),
                                child: const Center(child: Text('+', style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.9,

                                ),)),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text('Tip', style: TextStyle(
                        color: Colors.grey
                      ),),
                      
                      Padding(
                        padding: EdgeInsets.only(right: 12),
                        child: Text('\$ ${calculateTotalTip(billAmount, personCounter, tipPercentage)}', style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),),
                      )
                    ],
                  ),
                  Column(

                    children: [
                      Text('$tipPercentage%', style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,

                      ),),
                      Slider(
                        min: 0,
                          max: 100,
                          inactiveColor: Colors.grey,
                          divisions: 10,
                          value: tipPercentage.toDouble(),     // the value of a slider must be a double
                          onChanged: (double value){
                        setState(() {
                          tipPercentage = value.round();      //if use .round() in slider if we want to change the value (ie from 0 to 1 ). consider it a bit like rounding up the numbers. the min and max above is a bit like setting the amount of numbers you want in the slider
                        });
                          }

                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

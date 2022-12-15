import 'package:flutter/material.dart';

calculateTotalTip(double billAmount, int splitBy, int tipPercentage){
  double totalTip = 0.0;

  if(billAmount < 0 || billAmount.toString().isEmpty){

  }else {
    totalTip = (billAmount * tipPercentage)/100;
  }
  return totalTip;
}

calculateTotalPerPerson( double billAmount, int splitBy, tipPercentage){
  var totalPerPerson = (calculateTotalTip(billAmount, splitBy, tipPercentage) + billAmount)/splitBy;
  return totalPerPerson.toStringAsFixed(2);// to determine the numbers after the decimal point
}
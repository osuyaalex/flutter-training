import 'package:flutter/material.dart';
import 'package:flutter_newwww/ui/getcard.dart';
import 'package:flutter_newwww/ui/getimage.dart';

class BizCard extends StatelessWidget {
  const BizCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biz Card'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children: const [
           GetCard(),
            GetImage(),

          ],
        ),
      ),


    );
  }


}

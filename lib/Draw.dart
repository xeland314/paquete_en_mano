import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class Draw extends StatefulWidget {
  @override
  _DrawState createState() => _DrawState();
  }
  
class _DrawState extends State<Draw>{

  List<DrawModel> pointList = [];

  final pointsStream = BehaviorSubject<List<DrawModel>>();
  
  @override
  void dispose() {
    pointsStream.close();
    super.dispose();
  }
  GlobalKey key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      body: GestureDetector(

        onPanStart:(details){
          RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;

          Paint paint = Paint();

          paint.color = Colors.black;
          paint.strokeWidth = 3.0;
          paint.strokeCap = StrokeCap.round;
          
          pointList.add(DrawModel(
            renderBox.localToGlobal(details.globalPosition),
            Paint()
            ));
            pointsStream.add(pointList);
        } ,
        onPanUpdate:(details){
          RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;

          Paint paint = Paint();

          paint.color = Colors.black;
          paint.strokeWidth = 3.0;
          paint.strokeCap = StrokeCap.round;
          
          pointList.add(DrawModel(
            renderBox.localToGlobal(details.globalPosition),
            Paint()
            ));
            pointsStream.add(pointList);
        } ,
        onPanEnd: (details){
         
          pointsStream.add(pointList); 
        },

        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
      
          child:StreamBuilder<List<DrawModel>>(
            stream: pointsStream.stream,
            builder: (context, snapshot) {
              return CustomPaint(
                painter: DrawingPainter((snapshot.data??[])),
                );
              },
            ),
          ),
      ),
       );
  }

}
class DrawModel {
  final Offset offset;
  final Paint paint;

  DrawModel(this.offset,this.paint);
}

class DrawingPainter extends CustomPainter{
  final List <DrawModel> pointsList;
  //constructor
  DrawingPainter(this.pointsList);
  @override
  void paint(Canvas canvas, Size size) {
    for(int i = 0; i <(pointsList.length - 1); i ++){
      if(pointsList[i] != null && pointsList[i+1] != null){
          canvas.drawLine(pointsList[i].offset , pointsList[i+1].offset, pointsList[i].paint);
      }else if(pointsList[i] != null && pointsList[i+1] == null){
        List<Offset> offsetList = [];
        offsetList.add(pointsList[i] as Offset);
        canvas.drawPoints(PointMode.points, offsetList, pointsList[i].paint);
      };
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

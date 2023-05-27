import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int count = 1;
  bool isTrue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 50,
      decoration: BoxDecoration(
        //color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: isTrue==true ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          InkWell(
            onTap: (){
              setState(() {
                if(count==1){
                  isTrue = false;
                }
              });
              if(count>1){
                setState(() {
                  count--;
                });
              }
            },
              child: Icon(Icons.remove, size: 25, weight: 50,color: Colors.grey,)),
          Text('$count', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
          InkWell(
            onTap: (){
              setState(() {
                count++;
              });
            },
              child: Icon(Icons.add, size: 25, weight: 50, color: Colors.grey, )),
        ],
      ): Center(child: InkWell(
          onTap: (){
            setState(() {
              isTrue = true;
            });
          },
          child: Text('ADD'))),
    );
  }
}

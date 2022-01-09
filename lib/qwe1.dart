

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String str='';
int count=0;
String s="";
int c=0;



class qwe1 extends StatefulWidget {
  const qwe1({Key? key}) : super(key: key);


  @override
  _qwe1State createState() => _qwe1State();
}

class _qwe1State extends State<qwe1> {

  void _WriteToFile(s)async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
      setState((){ print(c);print(count);
      prefs.setString("key", s);}
      );
  }
  void _Writetofile1(c)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
   if (c>count){
    prefs.setInt("key1", c);
  }
  }
  void _Start1() async{
    //вывод из файла в переменные
    SharedPreferences prefs = await SharedPreferences.getInstance();
      str=prefs.getString('key') ?? 'нет';
      count=prefs.getInt('key1') ?? 0;
      print(s);print(c);
  }
    @override

  Widget build(BuildContext context) {
    const borderStyle=OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(
            color:Color(0xFFf0f0f0),width: 2
        )
    );

    return Scaffold(
        body:Center(
            child: Column(
              children: [
                SizedBox(height: 30,),
                TextField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    filled:true,
                    fillColor:Colors.black12,
                    enabledBorder:borderStyle,
                    focusedBorder:borderStyle,
                    labelText:"Введите Ваше имя",
                  ),
                  onChanged: (str){
                    _Start1();
                    _WriteToFile(str);
                    },//
                ),
                SizedBox(height: 30,),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled:true,
                    fillColor:Colors.black12,
                    enabledBorder:borderStyle,
                    focusedBorder:borderStyle,
                    labelText:"Введите счёт",
                  ),
                  onChanged: (String count){
                    _Writetofile1(int.parse(count));
                  },//_
                ),

                SizedBox(height: 30,),
                TextButton(
                    child:const Text('Посмотреть лучший результат',
                      style: TextStyle(
                          fontSize: 25.0,//размер
                          color: Colors.blue,//цвет текста
                          fontStyle: FontStyle.italic),
                    ),
                    onPressed:()async{
                      //вывод из файла в переменные
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      setState((){
                        s=prefs.getString('key') ?? 'нет';
                        c=prefs.getInt('key1') ?? 0;
                       // print(s);print(c);
                      },);
                    }
                ),

                //печать переменных
                SizedBox(height: 30,),
                Text(s,
                  style: const TextStyle(
                      fontSize: 20.0,//размер
                      color: Colors.black,//цвет текста
                      fontStyle: FontStyle.italic),),
                Text("$c",
                  style: const TextStyle(
                      fontSize: 20.0,//размер
                      color: Colors.black,//цвет текста
                      fontStyle: FontStyle.italic),),
              ],
            )

      ),
    );
  }
}

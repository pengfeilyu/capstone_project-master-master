import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';
import 'package:capstone_project/authentication/auth.dart';
import 'package:capstone_project/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:capstone_project/homepage.dart';
import 'package:capstone_project/screen/dailyinput.dart';
import 'package:capstone_project/screen/resulttrans.dart';
import 'package:capstone_project/screen/cloudpage.dart';



class ProFile extends StatefulWidget {
  @override
  _ProFileState createState() => _ProFileState();
}

class _ProFileState extends State<ProFile> {

  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPage())
        );
      }
    });
    super.initState();
  }

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    switch(index){
      case 0:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage())
        );

        break;

      case 1:

        // Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(builder: (context) => ProFile())
        // );

        break;

      case 2:

        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => DailyInput())
        );

        break;

      case 3:

        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ResultTrans())
        );

        break;

      case 4:

        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => CloudPage())
        );

        break;

      default:
        print("error");
        break;
    }

  }


  @override
  Widget build(BuildContext context) {
    var auth_service = Provider.of<Auth>(context);
    return Scaffold(
      backgroundColor: Colors.blue[100],

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            SizedBox(height: 50,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(onPressed: () => auth_service.logout(),
                  color: Colors.blue[400],
                  child: Text('Sign Out', style: TextStyle(fontFamily: 'Calibri', fontSize: 10,),),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black)
                  ),



                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child:
                  Text('Profile', style: TextStyle(fontFamily: 'Calibri', fontSize: 50,color: Colors.white),),
                ),

                RaisedButton.icon(onPressed: (){

                },
                  label: Text(''),
                  icon: Icon(Icons.camera),
                  color: Colors.blue[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black)
                  ),
                ),


              ],

            ),

            SizedBox(height: 100,),

            Text('Email: cse4852020@gmail.com', style: TextStyle(fontFamily: 'Calibri', fontSize: 15),),

            SizedBox(height: 20,),

            Text('User name: cse485', style: TextStyle(fontFamily: 'Calibri', fontSize: 15),),

            SizedBox(height: 50,),

            FlatButton(onPressed: (){}, child: Text('privacy setting', style:TextStyle(fontFamily: 'Calibri', fontSize: 15),)),

            SizedBox(height: 50,),

            FlatButton(onPressed: (){}, child: Text('Notifications', style: TextStyle(fontFamily: 'Calibri', fontSize: 15),)),

            SizedBox(height: 50,),

            FlatButton(onPressed: (){}, child: Text('Your Activity', style: TextStyle(fontFamily: 'Calibri', fontSize: 15),)),






          ],


        ),

      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create),
            label: 'create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'result',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud_queue),
            label: 'cloud',
          ),




        ],

        onTap: _onItemTapped,
      ),


    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
        actions: <Widget>[

          IconButton(
            icon: Icon(Icons.arrow_back_ios,color: Colors.transparent,),
            onPressed: (){
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 60.0,
                    backgroundImage: AssetImage("Images/bequeath.png"),

                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Text("Our apps main objective is to provide a platform between those in need and those who are willing to donate. We are looking forward to connect through NGO across. Anyone who's willing to donate any kind of garments,stationary,clothes,toys they can put it up ans any NGO who have people in need of it can access it.  "
                      ,style: TextStyle(
                          fontSize: 20.0

                      ),),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text("Connect with Us",style: TextStyle(
                    fontSize: 25.0, fontWeight: FontWeight.bold, color: Theme.of(context).accentColor,

                  ),),
                  SizedBox(
                    height: 10,
                  ),
                  Text("For more information"),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.mail_outline,size: 18,
                          color: Theme.of(context).accentColor,),
                        SizedBox(
                          width: 10,
                        ),
                        FlatButton(onPressed: (){

                        },
                            child: Text("bequeath@gmail.com", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                      ],
                    ),
                  ),
                  SizedBox
                    (
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.contact_mail,size: 18,
                          color: Theme.of(context).accentColor,),
                        SizedBox(
                          width: 8,
                        ),
                        FlatButton(
                          onPressed: (){

                          },
                          child: Text("linkedin.com/bequeath"
                            , style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 45.0,
                  ),
                  Center(child: Text("Developed By Slogfy.co", style: TextStyle(
                    fontSize: 13.0,
                    color: Colors.grey,
                  ),)),




                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:ui' as ui;

import 'package:datastore/DetailModel/DIS.dart';
import 'package:datastore/Pages/AboutUs.dart';
import 'package:datastore/Pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'Login.dart';
import 'SignUp.dart';
import 'feedback.dart';



class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double _borderRadius = 24;
//  Color(0xffff477e)

  var items = [
    PlaceInfo('SHARE AT DOOR STEPS',
  Color(0xff7b2cbf),
        Color(0xff7b2cbf), 4,
        'Delhi · Mayur Vihar',
        'Clothes · Stationery ·',
        'Images/SDS.png',
        'Share At Door Step provides you with the most convenient and easy way to donate those items that are just lying at some corner of your house, gathering dust and taking up some much-needed space. It’s time to donate them and give those books, toys, clothes etc a new life'),
    PlaceInfo('WISHING WELL', Color(0xff7b2cbf), Color(0xff7b2cbf), 3.7,
        'Noida · Sector 26', 'Clothes · Jacket · Groups','Images/WW.png','The organisation, primarily, acts as a bridge between two entities—the lesser privileged and the donors. Wishing Well is an attempt to bridge this gap by matching volunteers, services and donations with the needs of NGOs,” says Arti Vakil. She is also a front runner for similar causes across the city. we tend to help by donating clothes, books and any other item we deem usable by others.'),
    PlaceInfo('HAPPIEE SOULS', Color(0xff7b2cbf), Color(0xff7b2cbf), 4.5,
        'Chennai · Rasoma Square', 'Socks · Shoes','Images/HS.png','Our mission is to connect users to the verified NGO’s and the beneficiaries nearby with the rightsupplies at the time when it matters to them the most.It is to make "giving" a practice and “Happiness” a culture.'),
    PlaceInfo('GOONJ', Color(0xff7b2cbf), Color(0xff7b2cbf), 4.1,
        'Gurgaon · Sector 47', 'Casual Sneakers · Bedsheets · Quilt','Images/GJ.png','We aim to recognize and value the potential of local resource and traditional wisdom of people.Our focus is concentrated on the receiver’s dignity instead of the donor’s pride.'),
    PlaceInfo('MORE WELFARE TRUST', Color(0xff7b2cbf), Color(0xff7b2cbf), 4.2,
        'Mumbai · Ville Parle', '...','Images/HS.png','This is your chance to earn goodwill with community, feel good about helping someone in need, and uplift those who are not as fortunate as you.'),
    PlaceInfo('RISO',Color(0xff7b2cbf), Color(0xff7b2cbf), 4.2,
        'Mumbai · Juhu', '...','Images/RISO.png','To inspire and mobilize Indian youth and gather active public support in order to work for the betterment of the society in all ways possible, and to garner cooperation among various social-service bodies for achieving this.'),
    PlaceInfo('DONATE AID SOCIETY',Color(0xff7b2cbf), Color(0xff7b2cbf), 4.2,
        'Jaipur · Bani Park', '...','Images/DIS.png','We are a group of passionate, energetic mission oriented people, who have come together to address various pressing social, environment and educational issues'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bequeath',
          style: TextStyle(color: Color(0xfff5ffeb)),
        ),
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new ListTile(
              title: new Text('Login'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>  Login()));
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text('SignUp'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            SignUp()));
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text('Privacy Policy'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => new Privacy()));
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text('About Us'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new AboutUs()));
              },
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: (){
                      print(items[index].name);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>NGODetails(address: items[index].location, name: items[index].name, desc: items[index].desc,path: items[index].path,)));
//                       if (items[index].name=='SHARE AT DOOR STEPS'){
//                         Navigator.push(context, MaterialPageRoute(builder: (context)=> DIS()));
//                       }
//                     Navigator.pushReplacement(context, new MaterialPageRoute<DetailP>(
//                      builder: (BuildContext context) {
//                        return new DetailP(name: items[index].name, desc: items[index].desc, address: items[index].location);
//                      },
//                    ));
                    },
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(_borderRadius),
                        gradient: LinearGradient(colors: [
                          items[index].startColor,
                          items[index].endColor
                        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                        boxShadow: [
                          BoxShadow(
                            color: items[index].endColor,
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    top: 0,
                    child: CustomPaint(
                      size: Size(100, 150),
                      painter: CustomCardShapePainter(_borderRadius,
                          items[index].startColor, items[index].endColor),
                    ),
                  ),
                  Positioned.fill(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Image.asset(
                            items[index].path,
                            height: 64,
                            width: 64,
                          ),
                          flex: 2,
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                items[index].name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Avenir',
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                items[index].category,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Avenir',
                                ),
                              ),
                              SizedBox(height: 16),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Flexible(
                                    child: Text(
                                      items[index].location,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Avenir',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                items[index].rating.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Avenir',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                              //RatingBar(rating: items[index].rating),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class PlaceInfo {
  final String name;
  final String category;
  final String location;
  final double rating;
  final Color startColor;
  final Color endColor;
  final String path;
  final String desc;

  PlaceInfo(this.name, this.startColor, this.endColor, this.rating,
      this.location, this.category, this.path, this.desc);
}

class CustomCardShapePainter extends CustomPainter {
  final double radius;
  final Color startColor;
  final Color endColor;

  CustomCardShapePainter(this.radius, this.startColor, this.endColor);

  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;

    var paint = Paint();
    paint.shader = ui.Gradient.linear(
        Offset(0, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      endColor
    ]);

    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}



import 'package:datastore/Pages/DonateB.dart';
import 'package:flutter/material.dart';

class NGODetails extends StatelessWidget {
  NGODetails({ this.name,  this.desc, @required  this.address, this.path});
  final  String name ;
  final  String desc;
  final String address;
  final String path;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:getbody(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DonatePage(name: name,)));
        },
          child: Icon(
              Icons.add_circle
          ),
          elevation: 0.0,

        ),
      ),
    );

  }
  Widget getbody(context){
    var size= MediaQuery.of(context).size;

    return SingleChildScrollView(
        child: Stack(
            children: [
              Container(
                width: size.width,
                height: size.height*0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(path),
                    fit: BoxFit.fill,
                    //Image path
                  ) ,


                ),
              ),
              //
              Container(
                  margin: EdgeInsets.only(top: size.height*0.45),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(50)),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Align(
                            child: Container(
                              width: 150,
                              height: 7,
                              decoration: BoxDecoration(
                                  color: Colors.red[50],
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            name,
                            style: TextStyle(fontSize: 20, height: 1.5),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,

                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://www.google.com/search?q=location+icon&rlz=1C1UEAD_enIN943IN943&tbm=isch&source=iu&ictx=1&fir=5azjL4UXv549CM%252CWRdMjnyQjWHlaM%252C_&vet=1&usg=AI4_-kTw2QzCFmwnjcN4njXCxqFysoSqew&sa=X&ved=2ahUKEwidw4ysivnvAhW0yzgGHe2wCQwQ9QF6BAgGEAE#imgrc=5azjL4UXv549CM"),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    address,
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.bold),
                                  ),

                                ],
                              )
                            ],
                          ),

                          SizedBox(height: 20,),
                          Row(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(3)),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text("Stationary"),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(3)),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text("Toys"),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(3)),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text("Cloths"),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(3)),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text("Shoes"),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20,),
                          Text(desc,style: TextStyle(
                              height: 1.6
                          ),),
                          SizedBox(height: 20,),
                          Center(
                            child: Text("Making a donation is ultimate sign of solidarity",style: TextStyle(
                                fontSize: 18,
                              fontWeight: FontWeight.bold,


                            ),),
                          ),



                        ]
                    ),
                  ),

              ),



            ]
        )

    );

  }
}


//class DetailP extends StatefulWidget {
//  DetailP({@required this.name,@required  this.desc,@required  @required  this.address});
//
//
//
//
//  @override
//  _DetailPState createState() => _DetailPState();
//}
//
//class _DetailPState extends State<DetailP> {
//
//
//DetailP d= DetailP();
//
//
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: getbody(),
//    );
//  }
//

//}

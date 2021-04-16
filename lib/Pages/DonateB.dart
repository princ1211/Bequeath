import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Widget/InputDeco_design.dart';
import 'dart:io';
import 'package:path/path.dart';

class DonatePage extends StatefulWidget {
  DonatePage({this.name});
  final String name;


  @override
  _DonatePageState createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {

  File _image;
  final picker = ImagePicker();


  @override
  Widget build(BuildContext context) {

//    String name,email,phone, item, date , pitem, quantity , description;
    TextEditingController fullname = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController phonenumber = TextEditingController();
    TextEditingController itemname = TextEditingController();
    TextEditingController date = TextEditingController();
    TextEditingController address = TextEditingController();
    TextEditingController quantity = TextEditingController();
    TextEditingController description = TextEditingController();

    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

    final _storage= FirebaseStorage.instance;

    Future getImage() async {
      var image = await picker.getImage(source: ImageSource.gallery);

      setState(() {


        if (image != null) {
          _image = File(image.path);
          print('Image Path $_image');
        } else {
          print('No image selected.');
        }

      });
    }
    final db = FirebaseFirestore.instance;

    Future UploadData(BuildContext context) async{
      Map<String, dynamic> data = {'Name': fullname.text,
        'Email': email.text,
        'Phone' :phonenumber.text,
        'Item Name': itemname.text,
        'Date' : date.text,
        'address' : address.text,
      'Quantity': quantity.text,
      'Description': description.text};
      db
          .collection(widget.name)
          .add(data).then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));


    }

    Future uploadImageToFirebase(BuildContext context) async {

      var  fileName = File(_image.path);
      print(fileName);
      var snapshot=  await _storage.ref().child('foldername/imagename').putFile(fileName);
    }

    return Scaffold(
      appBar: AppBar(

        title: Text("Donate",textAlign: TextAlign.center,),

      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 100,
                          backgroundColor: Color(0xff476cfb),
                          child: ClipOval(
                            child: new SizedBox(
                              width: 180.0,
                              height: 180.0,
                              child: (_image!=null)?Image.file(
                                _image,
                                fit: BoxFit.fill,
                              ):Image.network(
                                "https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 60.0),
                        child: IconButton(
                          icon: Icon(
                            FontAwesomeIcons.camera,
                            size: 30.0,
                          ),
                          onPressed: () {
                            getImage();
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(Icons.person,"Full Name"),
                      controller: fullname,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: email,

                      decoration:buildInputDecoration(Icons.email,"Email"),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration:buildInputDecoration(Icons.phone,"Phone No"),
                      controller: phonenumber,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration:buildInputDecoration(Icons.category,"Item type"),
                      controller: itemname,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.datetime,
                      decoration:buildInputDecoration(Icons.date_range,"Pickup date"),
                      controller: date,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration:buildInputDecoration(Icons.category,"Address"),
                      controller: address,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration:buildInputDecoration(Icons.score,"quantity"),
                      controller: quantity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration:buildInputDecoration(Icons.description,"description"),
                      controller: description,
                    ),
                  ),

                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(


                      onPressed: (){

                        uploadImageToFirebase(context);
                        UploadData(context);

                        if(_formkey.currentState.validate())
                        {
                          print("successful");

                          return;
                        }else{
                          print("UnSuccessfull");
                        }
                        Navigator.pop(context);
                      },


                      style: ButtonStyle(
                       backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                      ),



                      child: Text("Donate"),

                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
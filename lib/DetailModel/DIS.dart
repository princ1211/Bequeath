import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Privacy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy"),
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
                      height: 30,
                    ),
                    Center(
                      child: Text("We are very concerned about safeguarding the confidentiality of your information, we do not collect PersonalInformation, and we employ administrative, physical and electronic measure designed to protect your Non-personal Information fromunauthorized access and use.",
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold

                        ),),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text("SENSITIVE INFORMATION",style: TextStyle(
                        fontSize: 14.0, fontWeight: FontWeight.bold
                    ),
                    ),
                    SizedBox(height: 8),
                    Text("We ask that you do not send us or disclose any sensitive Information(Example, Information related to origin, political opinions, religion, health, criminal background etc)on or through an Application.",style: TextStyle(
                        fontSize: 14.0, fontWeight: FontWeight.bold
                    ),
                    ),SizedBox(
                      height: 8,
                    ),
                    Text("HOW DO WE USE INFORMATION",style: TextStyle(
                        fontSize: 14.0, fontWeight: FontWeight.bold
                    ),),SizedBox(
                      height: 8,
                    ),

                    Text("a. Personal Information\n We do not store personal information and therefore we do not disclose your personal information",style: TextStyle(
                        fontSize: 14.0, fontWeight: FontWeight.bold
                    ),),SizedBox(
                      height: 8,
                    ),
                    Text("b. Non-Personal Information\n  We do not sell, trade, or otherwise transfer to outside parties your information. We do not combine Non-Personal information with personal information (such as combining your name with your unique userdevice number). \n\nc. Legal Reasons \nWe will access, use or disclose your information with other organizations or entites for reasonsthat required by any applicable law, regulations, legal, process or enforceable government request; detect , prevent, or otherwise fraud,security or technical issues; protect against harm to rights."
                      ,style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold
                      ),),SizedBox(
                      height: 8,
                    ),
                    Text("INFORMATION WE COLLECT",style: TextStyle(
                        fontSize: 14.0, fontWeight: FontWeight.bold
                    ),),SizedBox(
                      height: 8,
                    ),
                    Text("a. Personal Information\n  We do notcollect Personal Information.Personal Information is information that identifies you or another person, such as your Name, Address,Email ID, Telephone, Fax, SSN etc.",style: TextStyle(
                        fontSize: 14.0, fontWeight: FontWeight.bold
                    ),),SizedBox(
                      height: 8,
                    ),
                    Text("b. Non-personal Information\n We collect your non personal information when you visit our website, including your device information(device ID excluded), Operation System, Logs. Information you provide.We may collect your information when you communicate with us or you give us.",style: TextStyle(
                        fontSize: 14.0, fontWeight: FontWeight.bold
                    ),),SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ),
          ]
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Updateprofile extends StatefulWidget {
  const Updateprofile({Key? key}) : super(key: key);

  @override
  _UpdateprofileState createState() => _UpdateprofileState();
}

class _UpdateprofileState extends State<Updateprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.deepPurple,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.deepPurple,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
              Center(
                child: Text(
                  "Edit Profile",
                  style: TextStyle(color:Colors.white,fontSize: 25, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(

                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/profile.jpg"),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 125,
                        top: 80,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: Colors.deepPurple),
                          child: Icon(
                            Icons.camera,
                            color: Colors.white,
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  // controller: nameController,
                  // onChanged: (value) {
                  //   username = value;
                  // // },
                  // validator: (value) {
                  //   if (value!.isEmpty) {
                  //     return 'Username is required';
                  //   } else if (value.length > 8) {
                  //     return null;
                  //   } else {
                  //     return 'Username length must be greater than 8';
                  //   }
                  // },
                  decoration: new InputDecoration(
                    enabledBorder: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        borderSide:
                        new BorderSide(color: Colors.white)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  // controller: nameController,
                  // onChanged: (value) {
                  //   username = value;
                  // // },
                  // validator: (value) {
                  //   if (value!.isEmpty) {
                  //     return 'Username is required';
                  //   } else if (value.length > 8) {
                  //     return null;
                  //   } else {
                  //     return 'Username length must be greater than 8';
                  //   }
                  // },
                  decoration: new InputDecoration(
                    enabledBorder: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        borderSide:
                        new BorderSide(color: Colors.white)),
                  ),
                ),
              ),
              // buildTextField("Username", "rubytorubs"),
              // buildTextField("E-mail", "rubytorubs@gmail.com"),
              Padding(
                padding: const EdgeInsets.only(top:12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Update",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            )),
      ),
    );
  }
}

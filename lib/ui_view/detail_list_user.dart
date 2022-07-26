import 'package:flutter/material.dart';
import 'package:apiflutter/model/model_user.dart';
import 'package:apiflutter/main.dart';
import 'package:apiflutter/ui_view/page_list_user.dart';

class DetaiListUser extends StatelessWidget {

  final ModelUsers user;
  DetaiListUser(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.email),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
          
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    user.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.green),
                    ),
                  Text(user.email),
                  Text(user.phone),
                  Text(user.website),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Address", style:TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),

                  ),
                  Text(user.address.street),
                  Text(user.address.city),
                  Text(user.address.suite),
                  Text(user.address.zipcode),
                  SizedBox(height: 5.0,),
                  Text("Company",style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  Text(user.company.name)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


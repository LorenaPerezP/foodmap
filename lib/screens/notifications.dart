import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: ()=>Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          "Notificaciones",
        ),
        elevation: 0.0,
      ),

      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.map,
                  color: Colors.white,
                ),
              ),
              title: Text("Hemos enlazado la ruta a tu punto FoodMap"),
              onTap: (){},
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.chat,
                  color: Colors.white,
                ),
              ),
              title: Text("Danos tu opnion de nuestro punto FoodMap"),
              onTap: (){},
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Icon(
                  Icons.star,
                  color: Colors.white,
                ),
              ),
              title: Text("Gracias por tus comentarios"),
              onTap: (){},
            ),
            Divider(),
      /*      ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.save,
                  color: Colors.white,
                ),
              ),
              title: Text("Please Verify your email address"),
              onTap: (){},
            ),*/
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PerfilUserUi extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
       //  var user = Provider.of<LoginState>(context, listen: false).currenUser();
    return Scaffold(

      //backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage:AssetImage("assets/backGround/FondoBlancoATW.png") ,
                radius: 100,
                            child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    
image: DecorationImage(image:   AssetImage(
                    "assets/icon/LogoPadres2.png",

                  ),
                  fit: BoxFit.contain,
                  colorFilter:  ColorFilter.mode(
            //Colors.black.withOpacity(0.2), BlendMode.colorBurn),
            Colors.black.withOpacity(0.2),
            BlendMode.dstIn),

)
                  ),
                ),
              ),
            ),
            
           /*  ClipRRect(
              borderRadius: BorderRadius.circular(500),
                          child: Container(
                            color: Colors.blueGrey,
                child: SizedBox(
                  height: 150,
                  width: double.infinity,
                  child:       Image.asset(
                    "assets/icon/LogoPadres2.png",
                  /*   width: 40,
                    height: 40, */
                  ),
                  
                 /*  StreamBuilder(
                  stream: Firestore.instance
                      .collection('user')
                      .document(user.uid)
                      .collection('registroMonitorEps')
                      .snapshots(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return CircleAvatar(
                        backgroundImage: NetworkImage('${user.photoUrl}'),
                        radius: 50,
                      );
                    }
                  },
                ), */
                ),
              ),
            ), */
            Container(
              margin: EdgeInsets.fromLTRB(16.0, 200.0, 16.0, 16.0),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(16.0),
                        margin: EdgeInsets.only(top: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 96.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Little Butterfly", style: Theme.of(context).textTheme.title,),
                                  ListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    title: Text("Product Designer"),
                                    subtitle: Text("Kathmandu"),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Row(
                              children: <Widget>[
                                Expanded(child: Column(
                                  children: <Widget>[
                                    Text("285"),
                                    Text("Likes")
                                  ],
                                ),),
                                Expanded(child: Column(
                                  children: <Widget>[
                                    Text("3025"),
                                    Text("Comments")
                                  ],
                                ),),
                                Expanded(child: Column(
                                  children: <Widget>[
                                    Text("650"),
                                    Text("Favourites")
                                  ],
                                ),),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage('assets/marce.png'),
                            fit: BoxFit.cover
                          )
                        ),
                        margin: EdgeInsets.only(left: 16.0),
                        ),
                    ],
                  ),

                  SizedBox(height: 20.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(title: Text("User information"),),
                        Divider(),
                        ListTile(
                          title: Text("Email"),
                          subtitle: Text("butterfly.little@gmail.com"),
                          leading: Icon(Icons.email),
                        ),
                        ListTile(
                          title: Text("Phone"),
                          subtitle: Text("+977-9815225566"),
                          leading: Icon(Icons.phone),
                        ),
                        ListTile(
                          title: Text("Website"),
                          subtitle: Text("https://www.littlebutterfly.com"),
                          leading: Icon(Icons.web),
                        ),
                        ListTile(
                          title: Text("About"),
                          subtitle: Text("Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nulla, illo repellendus quas beatae reprehenderit nemo, debitis explicabo officiis sit aut obcaecati iusto porro? Exercitationem illum consequuntur magnam eveniet delectus ab."),
                          leading: Icon(Icons.person),
                        ),
                        ListTile(
                          title: Text("Joined Date"),
                          subtitle: Text("15 February 2019"),
                          leading: Icon(Icons.calendar_view_day),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            )
          ],
        ),
      ),
    );
  }
}
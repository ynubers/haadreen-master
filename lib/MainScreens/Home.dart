import 'package:flutter/material.dart';
import 'package:haadreen/Model/UserService.dart';
import 'package:share/share.dart';

import '../General/Constant.dart';
import '../SubScreens/Drawer.dart';
import 'Services.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: myDrawerMenu(),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.teal.withOpacity(1),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: kTextColor,
          elevation: 0,
          title: Text(
            "حاضرين",
            style: TextStyle(fontSize: 25, fontFamily: "Raleway"),
          ),
          leading: IconButton(
              icon: Icon(
                Icons.share,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {});
                share(context);
              }),
          actions: [
            IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                scaffoldKey.currentState.openEndDrawer();
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            height: height,
            width: width,
            child: Column(
              children: [
                Image.asset(
                  'Image/location.jpg',
                  fit: BoxFit.fill,
                  height: height / 3.5,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.teal.withOpacity(.4),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 7, 5, 2),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(15),
                          child: Form(
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                  color: kTextColor,
                                  fontSize: 22,
                                  fontFamily: 'Raleway'),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: kShadowColor,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: kTextColor,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(15.0)),
                                labelText: "Search",
                                labelStyle: TextStyle(
                                    fontSize: 18,
                                    color: kTextColor,
                                    fontFamily: 'Raleeway'),
                                hintText: "enter your search here",
                                hintStyle: TextStyle(
                                    fontSize: 18,
                                    color: kTextColor,
                                    fontFamily: 'Raleeway'),
                                suffixIcon: Icon(
                                  Icons.search,
                                  color: kTextColor,
                                  size: 26,
                                ),
                              ),
                              onChanged: (value) {
                                searchResults(value);
                                print('value :' + value);
                              },
                            ),
                          ),
                        ),
                      ),
                      GridView(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, childAspectRatio: 0.95),
                        children: [
                          FutureBuilder(
                              future: fetchList(),
                              builder: (context, projectSnap) {
                                if (projectSnap.connectionState ==
                                        ConnectionState.none &&
                                    projectSnap.hasData == null) {
                                  return CircularProgressIndicator();
                                }
                                return Container(
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    itemCount: user.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                    ),
                                    itemBuilder: (context, index) =>
                                        buildCard(index),
                                  ),
                                );
                              }),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      // backgroundColor: Colors.red,
    );
  }

  share(BuildContext context) {
    final RenderBox box = context.findRenderObject();

    Share.share(
        "link to my app\n"
        "www.google╧.com",
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  GestureDetector buildCard(int i) {
    HaadreenList currUser = user[i];
    // var v = currUser.iCONS;
    // int x = int.parse(currUser.quantity);
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SecondScreen()));
      },
      child: Card(
        elevation: 3,
        color: kTextColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${currUser.category}',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Raleway", color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
// Stack(
// children: [
//

// ],
// ),
}

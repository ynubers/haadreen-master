import 'package:flutter/material.dart';
import 'package:haadreen/Utility/ApiHelper.dart';

import '../General/Constant.dart';
import '../Model/UserService.dart';

class SecondScreen extends StatefulWidget {
  // Text('Image/member list.jpg'),
  @override
  _SecondScreen createState() => _SecondScreen();
}

class _SecondScreen extends State<SecondScreen> {
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  Future<List<HaadreenList>> fetchList() async {
    if (user != null) {
      if (user.length > 0) return user;
    }
    ApiBaseHelper api = new ApiBaseHelper();
    final response = await api.excute({"query": "MyprocedureListHaadreen "});
    user = response
        .map<HaadreenList>((json) => HaadreenList.fromJson(json))
        .toList();
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //
        //   backgroundColor: Color.fromARGB(255, 33, 99, 133),
        //   leading: IconButton(
        //     icon: Icon(Icons.arrow_back),
        //     onPressed: (){
        //       Navigator.pop(context);
        //     },
        //   ),
        // ),

        body: Column(
          children: [
            Container(
              color: Color.fromARGB(255, 33, 99, 133),
              height: 100,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomCenter / 1.5,
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  Text('خدماتك',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: "Raleway",
                        color: Colors.white,
                      )),
                ],
              ),
            ),
            Container(
                child: Column(
              children: [
                Image.asset('Image/location.jpg'),
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

                              // padding: EdgeInsets.symmetric(horizontal: 1.0),

                              itemCount: user.length,

                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                              ),

                              itemBuilder: (context, index) => buildCard(index),
                            ),
                          );
                        }),
                  ],
                ),
              ],
            )),
          ],
        ),
      ),
    );
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
        color: kTextColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          // height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${currUser.category}\n ',
                style: TextStyle(
                    fontFamily: "Raleway", color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

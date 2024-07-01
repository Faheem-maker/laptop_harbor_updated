import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 300.0,
            width: double.infinity,
            child: Center(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://th.bing.com/th/id/OIP.OHF6pTug7nRx2ck-EhetjAHaE8?rs=1&pid=ImgDetMain"),
                      fit: BoxFit.fill),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      "New Deals Available",
                      style: TextStyle(fontSize: 36, color: Colors.white),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Shop Now",
                        style: TextStyle(fontSize: 18, color: Colors.redAccent),
                      ),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                              side: BorderSide(color: Colors.red)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 500,
                  height: 200,
                  child: Image.network(
                    width: double.infinity,
                    "https://th.bing.com/th/id/OIP.uFaigrHmsXbTBmNQGZqLbgHaHa?w=700&h=700&rs=1&pid=ImgDetMain"),
                ),
                Text("ROG ZEPHURUS", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text("\$250"),
              ],
            ),
          )
      ],
    );
  }
}

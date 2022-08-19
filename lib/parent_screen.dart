// ignore_for_file: sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../consts/AppAssets.dart';

import 'package:dam_dor/models/json_model.dart';
import 'package:dam_dor/views/market/screens/market_details.dart';

class ParentScreen extends StatefulWidget {
  final String title;
  const ParentScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<ParentScreen> createState() => _ParentScreenState();
}

class _ParentScreenState extends State<ParentScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: size.height * 0.08,
                  margin: EdgeInsets.only(left: 10),
                  color: Color(0xff9c26b0),
                  child: Align(
                    child: Text(
                      'Area',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  width: double.infinity,
                  height: size.height * 0.08,
                  color: Colors.green,
                  child: Align(
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            color: Color(0xff483064),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Market Name',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // show the market list here
          Expanded(
            child: ListView.builder(
              itemCount: ariaBazarData.length,
              itemBuilder: (context, index) {
                if (ariaBazarData[index]['area'] == widget.title) {
                  return Column(
                    children: [
                      // show the market list in column
                      for (var market in ariaBazarData[index]['market'])
                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MarketDetails(
                                title: market,
                              ),
                            ),
                          ),
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            width: double.infinity,
                            height: size.height * 0.08,
                            color: Colors.blue,
                            child: Align(
                              child: Text(
                                market,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}

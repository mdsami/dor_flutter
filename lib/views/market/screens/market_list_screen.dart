import 'package:dam_dor/models/json_model.dart';
import 'package:dam_dor/views/market/screens/market_details.dart';
import 'package:flutter/material.dart';

class MarketList extends StatefulWidget {
  final String title;

  const MarketList({Key? key, required this.title}) : super(key: key);

  @override
  State<MarketList> createState() => _MarketListState();
}

class _MarketListState extends State<MarketList> {
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      child: Text(
                        widget.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
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

                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left:size.width*0.05,right: size.width*0.05),
                              child: Align(
                                child: Text(
                                  market,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
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

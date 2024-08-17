import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bit_coins_app/models/BitCoin.dart';
import 'package:bit_coins_app/models/InputMethod.dart';
import 'package:bit_coins_app/views/coins/bit_coins.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
class CoinsView extends StatefulWidget {
  const CoinsView({super.key});

  @override
  State<CoinsView> createState() => _CoinsViewState();
}

class _CoinsViewState extends State<CoinsView> with SingleTickerProviderStateMixin{
  late TabController tabController;
  List<Data> bitCoinData=[];
  bool loader=true;
  @override
  void initState() {
    tabController=TabController(length: 3, vsync: this);
    connectToSocket();
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Coins',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                SizedBox(height: 8,),
                Container(
                  width: size.width-16,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.black,width: 1.2),
                    color: Colors.grey.shade200
                  ),
                  child:const  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey,fontSize: 14),
                              hintText: "Search",
                            ),
                          ),
                        ),
                        Icon(Icons.search,color: Colors.grey,size: 25,)
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TabBar(
                  controller: tabController,
                    indicatorColor: Colors.blue,
                    labelColor: Colors.black,
                    dividerHeight: 0,
                    tabs: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('     Coins    '),
                  ),
                  Text('          SIP          '),
                  Text('Favrouties'),
                  ]),
               const  SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: TabBarView(
                      controller: tabController,
                      children: [
                        BitCoins(bitCoinData: bitCoinData,loader: loader,),
                        Center(child: Text('SIP Screen')),
                        Center(child: Text('Favrouties Screen')),
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void connectToSocket()async{
    const url= 'ws://prereg.ex.api.ampiy.com/prices';
    InputMethod inputMethod=InputMethod(method:"SUBSCRIBE",params: ["all@ticker"],cid: 1);
    try {
      WebSocketChannel webSocketChannel = WebSocketChannel.connect(Uri.parse(url));
      webSocketChannel.sink.add(jsonEncode(inputMethod.toJson()));
      webSocketChannel.stream.listen((data){
        BitCoin bitCoin=BitCoin.fromJson(jsonDecode(data));
        if(bitCoin.data!=null && bitCoin.data!.isNotEmpty) {
          bitCoinData.clear();
          bitCoinData.addAll(bitCoin.data ?? []);
          loader=false;
          setState(() {

          });
        }
      });
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Connection Error",style: TextStyle(color: Colors.white),),backgroundColor: Colors.redAccent, ));
    }
  }


}

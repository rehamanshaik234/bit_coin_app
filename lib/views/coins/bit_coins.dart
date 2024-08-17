import 'package:flutter/material.dart';

import '../../models/BitCoin.dart';
class BitCoins extends StatefulWidget {
  late List<Data> bitCoinData;
  bool loader;
  BitCoins({super.key,required this.bitCoinData,required this.loader});

  @override
  State<BitCoins> createState() => _BitCoinsState();
}

class _BitCoinsState extends State<BitCoins> {

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return !widget.loader && widget.bitCoinData.isNotEmpty? Column(
      children: [
        Row(
          children: [
            SizedBox(
                width: size.width*0.5,
                child: Text('Name',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),)),
            SizedBox(
                width: size.width*0.25-12,
                child: Text('Price',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),)
            ),
            SizedBox(
                width: size.width*0.25-12,
                child: Text('Change',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),)
            ),
          ],
        ),
        const SizedBox(height: 8,),
        SizedBox(
          width: size.width,
          child: const Divider(
            color: Colors.grey,
            height: 2,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Expanded(
          child: ListView.separated(
              separatorBuilder: (context,i)=>const  SizedBox(height: 8,),
              itemCount: widget.bitCoinData.length,
              itemBuilder: (context,index){
                return Row(
                  children: [
                    SizedBox(
                        width: size.width*0.5,
                        child: Text('${widget.bitCoinData[index].s}')),
                    SizedBox(
                        width: size.width*0.25-12,
                        child: Text('₹ ${convertToShortForm('${widget.bitCoinData[index].c}')}',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),)
                    ),
                    SizedBox(
                        width: size.width*0.25-12,
                        child: Row(
                          children: [
                            widget.bitCoinData[index].P.toString().contains('-')?Icon(Icons.arrow_downward_outlined,color: Colors.redAccent,size: 14,):Icon(Icons.arrow_upward,color: Colors.green,size: 14,),
                            Text('${widget.bitCoinData[index].P}',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: widget.bitCoinData[index].P.toString().contains('-')?Colors.redAccent:Colors.green),),
                          ],
                        )
                    ),
                  ],
                );
              }),
        ),
      ],
    ):Center(
      child: widget.loader? const CircularProgressIndicator(color: Colors.blue,) : const Text("Unable to Fetch The Data"),
    );
  }

  String convertToShortForm(String numberStr) {
    double number = double.parse(numberStr);
    if (number >= 1000000) {
      double millions = number / 1000000;
      return '${millions.toStringAsFixed(0)}L';
    } else if (number >= 1000) {
      double thousands = number / 1000;
      return '${thousands.toStringAsFixed(0)}K';
    } else {
      return numberStr;
    }
  }
}

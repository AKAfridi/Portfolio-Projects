import 'package:ecommerce_shop_app/constants/globalthemecolors.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class FeedWidgets extends StatelessWidget {
  const FeedWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Material(
      color: Colors.white38,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: RichText(
                          text:  TextSpan(
                              text: "\$",
                              style: const TextStyle(
                                  color: Color.fromRGBO(33, 150, 243, 1)),
                          children: <TextSpan>[
                            TextSpan(text: '168.00',
                            style: TextStyle(
                              color: lightTxtColor,
                              fontWeight: FontWeight.w600
                            ))
                          ]))
                  ),
                  const Icon(IconlyBold.heart)
                ],
              ),
            ),
            const SizedBox(height: 10,),
            ClipRRect(borderRadius: BorderRadius.circular(12),
              child: FancyShimmerImage(
              width: double.infinity,
              height: size.height*0.2,
                errorWidget: Image.asset("assets/images/download_1.png"),
                  imageUrl: "assets/images/download_1.png",
                  boxFit: BoxFit.cover)
            ),
            const SizedBox(height: 10,),
            const Padding(padding: EdgeInsets.all(8),
            child: Text("Title",
            maxLines: 2,overflow:TextOverflow.ellipsis,
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,),),),
            SizedBox(height: size.height*0.01,),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../widgets/appbar_icons.dart';
import '../widgets/feeds_widget.dart';
class FeedsScreen extends StatefulWidget {
  const FeedsScreen({super.key});

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Products"),
      ),
      body:  GridView.builder(shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 5,gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing:8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.78
          ) ,
          itemBuilder: (context,index){
            return const FeedWidgets();
          })
    );
  }
}

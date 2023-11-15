import 'package:card_swiper/card_swiper.dart';
import 'package:ecommerce_shop_app/constants/globalthemecolors.dart';
import 'package:ecommerce_shop_app/screens/feeds_screen.dart';
import 'package:ecommerce_shop_app/widgets/appbar_icons.dart';
import 'package:ecommerce_shop_app/widgets/feeds_widget.dart';
import 'package:ecommerce_shop_app/widgets/sale_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  late TextEditingController searchController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController =TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    searchController.dispose();
    super.dispose();

  }


  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("HomeScreen"),

          leading: AppBarIcons(function: (){}, icon: IconlyBold.category),
          actions: [
            AppBarIcons(function: (){}, icon: IconlyBold.user3)
          ],
        ),
        body:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(children: [
            TextField(controller: searchController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).cardColor,
                hintText: "Search",
                suffixIcon: Icon(IconlyLight.search,color: lightIconsColor),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).cardColor
                  )
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 2,
                    color:lightIconsColor,
                  )
                )
              ),
            ),
            Expanded(
              child: SingleChildScrollView(child: Column(children: [
                SizedBox(height: size.height*0.25,
                  child: Swiper(itemCount: 3,
                      autoplay: true,
                      pagination:const SwiperPagination(alignment: Alignment.bottomCenter,
                          builder: DotSwiperPaginationBuilder(activeColor: Colors.red,
                              color: Colors.white)),
                      itemBuilder: (context,index){
                        return const SaleWidget();
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    const Text("Latest Products",
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                    const Spacer(),
                    AppBarIcons(function: (){
                      Navigator.push(context, PageTransition(child: FeedsScreen(), type: PageTransitionType.fade));
                    }, icon: IconlyBold.arrowRight2)
                  ],),
                ),
                GridView.builder(shrinkWrap: true,
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
              ],),),
            )
          ],),
        ),
      ),

    );
  }
}

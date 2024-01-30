// ignore_for_file: use_build_context_synchronously, sized_box_for_whitespace, prefer_const_constructors

import 'package:amazon/MyLayouts/screen_layout.dart';
import 'package:amazon/MyModels/product_model.dart';
import 'package:amazon/Mythemes/color_theme.dart';
import 'package:amazon/Mythemes/contants.dart';
import 'package:amazon/screens/full_review_screen.dart';
import 'package:amazon/utilss/next_screen.dart';
import 'package:amazon/utilss/screen_size.dart';
import 'package:amazon/widget/product_cost.dart';
import 'package:amazon/widget/rating_star_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  RoundedLoadingButtonController buyController =
      RoundedLoadingButtonController();
  RoundedLoadingButtonController addToCartController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MyScreenSize().getScreenSize();

    return Scaffold(
      appBar: AppBar(
        title: Text("Amazon Clone"),
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black45,
          ),
          onPressed: () {
            nextScreenReplace(context, const ScreenLayout());
          },
        ),
      ),
      body: SafeArea(
        // appBar: const MySearchBar(isReadOnly: true, hasBackButtom: true),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: kAppBarHeight / 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  widget.product.sellerName,
                                  style: const TextStyle(
                                      color: activeCyanColor, fontSize: 16),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  widget.product.productName,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          RatingStar(rating: widget.product.rating),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: Container(
                        // decoration: const BoxDecoration(
                        color: Colors.transparent,
                        height: screenSize.height * 0.5,
                        width: screenSize.width * 0.86,
                        child: FittedBox(
                          child: Image.network(widget.product.url),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        ProductCost(
                          color: Colors.black,
                          cost: widget.product.cost,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        SizedBox(
                          height: screenSize.height / 24,
                          child: Image.network(
                              "https://m.media-amazon.com/images/I/51Iht+dUqDL._AC_UF1000,1000_QL80_.jpg"),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // SignInButtom(
                    //   child: const Text(
                    //     "Buy",
                    //     style: TextStyle(color: Colors.black),
                    //   ),
                    //   color: Colors.orange,
                    //   isLoading: false,
                    //   onPressed: () async {
                    // await MyFireStore().addProductToOrder(
                    //     model: widget.product,
                    //     userInfo: Provider.of<UserDetailsProvider>(context,
                    //             listen: false)
                    //         .userDetails);
                    // MyScreenSize().showSnakBar(
                    //     context: context,
                    //     content:
                    //         "Product will be delivered soon , continue your shopping");
                    //   },
                    // ),
                    // buy now
                    RoundedLoadingButton(
                      controller: buyController,
                      successColor: Colors.orange,
                      color: Colors.orange,
                      width: screenSize.width * 0.44,
                      onPressed: () {},
                      child: const Wrap(
                        children: [
                          Icon(
                            FontAwesomeIcons.dollarSign,
                            size: 20,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Buy Now",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // add to cart

                    RoundedLoadingButton(
                      controller: addToCartController,
                      successColor: Colors.yellow,
                      color: Colors.yellow,
                      width: screenSize.width * 0.44,
                      onPressed: () {},
                      child: const Wrap(
                        children: [
                          Icon(
                            FontAwesomeIcons.cartShopping,
                            size: 20,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Add to cart",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // RoundedButtom(onPressed: () {}, text: "Add a review"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // drop a review

                        SizedBox(
                          width: screenSize.width * 0.3,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow),
                            child: const Text(
                              "Drop a review",
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Row(
                            children: [
                              Text("details "),
                              Icon(Icons.info),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    // raing section

                    // Padding(
                    //   padding: const EdgeInsets.only(left: 15),
                    //   child: SizedBox(
                    //     height: screenSize.height * 0.7,
                    //     child: StreamBuilder(
                    //       stream: FirebaseFirestore.instance
                    //           .collection("products")
                    //           .doc(widget.product.uid)
                    //           .collection("reviews")
                    //           .snapshots(),
                    //       builder: (context, snapshot) {
                    //         // ProductReviewModel models;
                    //         if (snapshot.connectionState ==
                    //             ConnectionState.waiting) {
                    //           return Container();
                    //         } else {
                    //           return ListView.builder(
                    //             itemCount: snapshot.data!.docs.length <= 4
                    //                 ? snapshot.data!.docs.length
                    //                 : snapshot.data!.docs.length -
                    //                     (snapshot.data!.docs.length - 4),
                    //             itemBuilder: (context, index) {
                    //               ProductReviewModel model =
                    //                   ProductReviewModel.getModelFromJson(
                    //                       snapshot.data!.docs[index].data());
                    //               return MyReview(reviews: model);
                    //             },
                    //           );
                    //         }
                    //         // return MyReview(reviews: models)
                    //       },
                    //     ),
                    //   ),
                    // ),
                    Container(
                      decoration: BoxDecoration(color: Colors.grey[400]!),
                      width: screenSize.width,
                      child: TextButton(
                        child: const Row(
                          children: [
                            Text("See full reviews"),
                            Icon(Icons.star),
                          ],
                        ),
                        onPressed: () {
                          nextScreen(context, FullReviewScreen());
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

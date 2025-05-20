import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yummy_app/core/model/cart_manager.dart';
import 'package:yummy_app/core/model/restaurant.dart';
import 'package:yummy_app/core/resources/color_manager.dart';
import 'package:yummy_app/features/components/custom_text_button.dart';
import 'package:yummy_app/features/components/custom_text_form_field.dart';
import 'package:yummy_app/features/components/menu_item.dart';
import 'package:yummy_app/features/components/order_summery_list.dart';

class RestaurantDetails extends StatefulWidget {
  RestaurantDetails({
    super.key,
    required this.restaurant,
    required this.cartManager,
    required this.onTapAddToCart,
  });

  final Restaurant restaurant;
  final CartManager cartManager;
  final VoidCallback onTapAddToCart;
  final formKey = GlobalKey<FormState>();
  final contactNameController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();


  @override
  State<RestaurantDetails> createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  void showDatePickerMethod() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2025),
      lastDate: DateTime(2026),
    );

    if (pickedDate != null) {
      setState(() {
        widget.dateController.text = DateFormat('dd/MM/yy').format(pickedDate);
      });
    }
  }

  void showTimePickerMethod() async {
    TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now());
    if (pickedTime != null) {
      setState(() {
        widget.timeController.text = pickedTime.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 300.0,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).viewPadding.top + kToolbarHeight,
                    right: 20.0,
                    left: 20.0,
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image(
                          image: AssetImage(
                            widget.restaurant.imageUrl,
                          ),
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      Positioned(
                        left: 10.0,
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.pinkAccent.shade100,
                          ),
                          child: Icon(
                            Icons.store,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(left: 20.0, top: 20.0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  spacing: 5.0,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.restaurant.name,
                      style: textTheme.headlineLarge,
                    ),
                    Text(
                      widget.restaurant.address,
                    ),
                    Text(
                      widget.restaurant.getRatingAndDistance(),
                    ),
                    Text(
                      widget.restaurant.attributes,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Menu",
                      style: textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(bottom: 80.0),
              sliver: SliverList.separated(
                  itemCount: widget.restaurant.items.length,
                  itemBuilder: (context, index) {
                    return MenuItem(
                      item: widget.restaurant.items[index],
                      cartManager: widget.cartManager,
                      onTapAddToCart: () {
                        setState(() {});
                      },
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 10.0,
                      )),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Row(
            children: [
              Icon(
                Icons.shopping_cart,
              ),
              Text("${widget.cartManager.items.length} number of items"),
            ],
          ),
        ),
        endDrawer: Drawer(
          width: MediaQuery.of(context).size.width * .88,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: widget.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.arrow_back),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child: Text(
                        "Order Details",
                        style: textTheme.headlineSmall,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                                color: Colors.pink.shade100,
                                border: Border.all(color: Colors.grey.shade400),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                )),
                            child: Row(
                              spacing: 10.0,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.pedal_bike_rounded,
                                ),
                                Text(
                                  'Delivery',
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                            ),
                            child: Row(
                              spacing: 10.0,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.shopping_bag,
                                ),
                                Text(
                                  'PickUp',
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      controller: widget.contactNameController,
                      decoration: InputDecoration(
                        hintText: "Contact Name",
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Contact Name Can't be Empty";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        SizedBox(
                          width: 130,
                          child: CustomDateAndTimeTextFormField(
                            textEditingController: widget.dateController,
                            onTap: showDatePickerMethod,
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return "Empty Date";
                              }
                              return null;
                            },
                            text: "Select Date",
                          ),
                        ),
                        SizedBox(
                          width: 130,
                          child: CustomDateAndTimeTextFormField(
                            text: "Select Time",
                            textEditingController: widget.timeController,
                            onTap: showTimePickerMethod,
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return "Empty Time";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        "Order Summery",
                        style: textTheme.headlineSmall!.copyWith(
                            fontSize: 18.0),
                      ),
                    ),
                    OrderSummeryList(
                      cartManager: widget.cartManager,
                    ),
                    CustomTextButton(
                      onPressed: () {
                        if (widget.formKey.currentState!.validate()) {
                          /// TODO : NAVIGATION
                        }
                      },
                      text: "Submit Order - \$${widget.cartManager.totalCost} ",
                      height: 55,
                      backGroundColor: Colors.white38,
                      fontColor: ColorManager.burgundyColor,
                      borderRadius: BorderRadius.circular(30.0),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}




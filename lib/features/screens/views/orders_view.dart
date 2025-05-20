import 'package:flutter/material.dart';
import 'package:yummy_app/core/resources/assets_manager.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        spacing: 15.0,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("My Orders",
            style: textTheme.bodyLarge!.copyWith(
              fontSize: 20
            ),
          ),
          Row(
            spacing: 10.0,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                 AssetsManager.burger,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 2.0,
                children: [
                  Text("Scheduled",
                    style: textTheme.bodyMedium,
                  ),
                  Text("Moab, Date: 2025-05-18, Time: 13:46",
                    style: textTheme.bodyMedium,
                  ),
                  Text("Delivery",
                    style: textTheme.bodyMedium,
                  ),
                ],
              )

            ],
          )
        ],
      ),
    );
  }
}

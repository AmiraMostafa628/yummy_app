import 'package:flutter/material.dart';
import 'package:yummy_app/core/resources/assets_manager.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 50.0),
      child: Column(
        children: [
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                AssetsManager.profile,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Stef",
            style: textTheme.headlineMedium,
          ),
          Text(
            "Flutteristas",
            style: textTheme.bodyLarge,
          ),
          Text(
            "100 Points",
            style: textTheme.bodyLarge,
          ),
          SizedBox(
            height: 40,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "View Kodeco",
              style: textTheme.headlineSmall,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Log Out",
              style: textTheme.headlineSmall,
            ),
          ),
        ],
      ),
    );
  }
}

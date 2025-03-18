import 'package:event_planner/shared_components/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../shared_components/theme/color_pallet.dart';

class OrganizerListItem extends StatelessWidget {
  const OrganizerListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.2), // Change color as needed
            width: 2.0, // Border thickness
          ),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              child: Image.network(
                "https://images.unsplash.com/photo-1579353977828-2a4eab540b9a?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                fit: BoxFit.fill,
                loadingBuilder:
                    (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes !=
                          null
                          ? loadingProgress
                          .cumulativeBytesLoaded /
                          (loadingProgress
                              .expectedTotalBytes ??
                              1)
                          : null,
                      color: ColorPallet.primaryColor,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.error),
              ),
            ),
          ),
          Gap(15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name",style: ThemeTextStyles.subtitlesS2,),
              Text("Email",style: ThemeTextStyles.subTextStyle,),
            ],
          ),
          Spacer(),
          Icon(Icons.message)
        ],
      ),
    );
  }
}

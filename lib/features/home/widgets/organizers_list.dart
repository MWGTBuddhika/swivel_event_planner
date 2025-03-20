import 'package:event_planner/features/home/blocs/home_bloc.dart';
import 'package:event_planner/features/home/widgets/organizer_list_item.dart';
import 'package:event_planner/shared_components/theme/color_pallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrganizersList extends StatelessWidget {
  const OrganizersList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc,HomeState>(
      builder: (context,homeState) {
        return ListView.builder(
            itemCount: homeState.organizers.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context, index) {
              return  OrganizerListItem(organizer: homeState.organizers[index]);
            }
        );
      }
    );
  }
}

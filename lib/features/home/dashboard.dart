import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:event_planner/core/route/app_router.gr.dart';
import 'package:event_planner/features/home/blocs/home_bloc.dart';
import 'package:event_planner/features/home/widgets/bottom_nav_bar.dart';
import 'package:event_planner/features/home/widgets/app_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/route/app_router.dart';
import '../../shared_components/widgets/page_base.dart';


@RoutePage()
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeBloc>().add(GetSliderImages());
      context.read<HomeBloc>().add(GetOrganizers());
      context.read<HomeBloc>().add(GetPosts());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc,HomeState>(
        builder: (context,homeState) {
          return AutoTabsRouter(
              routes: [
                HomeRoute(),
                UserProfileRoute(),
              ],
              homeIndex: 0,
              duration: Duration(milliseconds: 400),
              transitionBuilder: (context, child, animation){
                tabsRouter = AutoTabsRouter.of(context);
                int currentIndex = tabsRouter.activeIndex;
                int previousIndex = tabsRouter.previousIndex??0;
                // Determine the transition direction based on indices
                bool isTransitionToRight = currentIndex > previousIndex;
                return SlideTransition(
                  position:
                  Tween<Offset>(
                    begin: (isTransitionToRight ? Offset(1.0, 0.0) : Offset(-1.0, 0.0)),
                    end: Offset(0.0, 0.0),
                  ).animate(animation),
                  child: child,
                );
              },
              builder: (context, child) {
                tabsRouter = AutoTabsRouter.of(context);
                return PageBase(
                    bottomTabNavbar: BottomTabNavigationBar(),
                    showAppBar: false,
                    bodyObservesSafeArea: false,
                    resizeToAvoidBottomInset: false,
                    drawer: AppDrawer(),
                    body: child
                );
              }
          );
        }
    );
  }
}

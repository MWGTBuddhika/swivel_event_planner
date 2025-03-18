import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/route/app_router.dart';
import '../../shared_components/theme/color_pallet.dart';
import '../../shared_components/theme/text_styles.dart';

class PageBase extends StatefulWidget {
  final Widget body;
  final bool showAppBar;
  final AppBar? appBar;
  final Color? backgroundColor;
  final bool bodyObservesSafeArea;
  final bool showProgress;
  final String? progressMessage;
  final Function? onBack;
  final String? pageTitle;
  final double? appbarElevation;
  final Widget? bottomTabNavbar;
  final bool? resizeToAvoidBottomInset;
  final Widget? drawer;


  const PageBase({
    Key? key,
    this.onBack,
    this.appBar,
    this.showAppBar = true,
    this.backgroundColor,
    required this.body,
    this.bodyObservesSafeArea = true,
    this.showProgress = false,
    this.progressMessage,
    this.pageTitle,
    this.appbarElevation,
    this.bottomTabNavbar,
    this.resizeToAvoidBottomInset,
    this.drawer

  }) : super(key: key);

  @override
  State<PageBase> createState() => _PageBaseState();
}

class _PageBaseState extends State<PageBase> {
  final _baseKey = GlobalKey();

  @override
  initState() {
    super.initState();
  }
  @override
  dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Widget body = _PageBaseBody(
      body: widget.body,
      showProgress: widget.showProgress,
      progressMessage: widget.progressMessage,
    ) as Widget;

    return WillPopScope(
        onWillPop: () async {
          widget.onBack?.call();
          return true;
        },
        child: IgnorePointer(
          ignoring: widget.showProgress,
          child: Scaffold(
            key: _baseKey,
            resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
            backgroundColor: ColorPallet.defaultColor,
            drawer: widget.drawer,
            appBar: widget.showAppBar ? (widget.appBar ?? AppBar(
              elevation: widget.appbarElevation??0.0,
              automaticallyImplyLeading: false,
              scrolledUnderElevation: 0,
              backgroundColor: ColorPallet.defaultColor,
              actions: <Widget>[
                Container(),
              ],
              title: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (widget.pageTitle != null)
                          Flexible(
                            child: Text(
                              widget.pageTitle ?? '',
                              style: ThemeTextStyles.headingH3,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            )) : null,
            bottomNavigationBar: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                widget.bottomTabNavbar??Container(),
              ],
            ),
            body: widget.bodyObservesSafeArea ? SafeArea(child: body) : body,
          ),
        )
    );
  }
}

class _PageBaseBody extends StatefulWidget {
  final Widget body;
  final bool? showProgress;
  final String? progressMessage;

  const _PageBaseBody({
    Key? key,
    required this.body,
    this.showProgress,
    this.progressMessage,

  }) : super(key: key);

  @override
  State<_PageBaseBody> createState() => _PageBaseBodyState();
}

class _PageBaseBodyState extends State<_PageBaseBody>{
  final _bodyKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      key: _bodyKey,
      children: <Widget>[
        widget.body,
        if (widget.showProgress ?? false) buildProgress(),
      ],
    );
  }

  Widget buildProgress() {
    return Positioned.fill(
      child: Container(
        color: Colors.black54,
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
              color: ColorPallet.defaultColor,
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
            ),
            padding: EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                ),
                if (widget.progressMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Text(
                      widget.progressMessage!,
                      style: ThemeTextStyles.progressMessageStyle,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}

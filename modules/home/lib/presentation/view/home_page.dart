import 'package:common_base/common_base.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colors = theme.colors;
    final locale = context.appLocale;
    final greenColor = colors.buttonColors.bgPrimary;
    final times = [
      locale.time18,
      locale.time19,
      locale.time20,
      locale.time21,
      locale.time22,
      locale.time23,
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      child: Column(
        children: [
          WeekDaysWidget(
            controller: _scrollController,
          ),
          TabBar(
            padding: EdgeInsets.zero,
            labelPadding: EdgeInsets.zero,
            labelColor: greenColor,
            indicatorColor: greenColor,
            controller: _tabController,
            tabs: [
              Tab(
                text: locale.openedStadium,
              ),
              Tab(
                text: locale.closedStadium,
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: times.length,
                  padding: EdgeInsets.only(top: 20),
                  itemBuilder: (context, index) {
                    return TimeCartWidget(
                      text: times[index],
                      function: () {
                        return showDialog(
                            context: context,
                            builder: (context) {
                              return BookingDialog(
                                selectedTime: times[index],
                              );
                            });
                      },
                    );
                  },
                ),
                ListView.builder(
                  itemCount: times.length,
                  padding: EdgeInsets.only(top: 20),
                  itemBuilder: (context, index) {
                    return TimeCartWidget(
                      text: times[index],
                      function: () {},
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

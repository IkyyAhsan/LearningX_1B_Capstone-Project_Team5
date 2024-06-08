import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';

class TabSection extends StatefulWidget {
  const TabSection({super.key});

  @override
  _TabSectionState createState() => _TabSectionState();
}

class _TabSectionState extends State<TabSection> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 50,
          child: TabBar(
            controller: _tabController,
            tabs: [
              Tab(child: Text("Self Photo", style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: SlectivColors.blackColor)),),),
              Tab(child: Text("Wide Photobox", style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: SlectivColors.blackColor)),), ),
              Tab(child: Text("Photo booth", style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: SlectivColors.blackColor)),),),
              Tab(child: Text("Creative", style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: SlectivColors.blackColor)),),),
            ],
          ),
        ),
        SizedBox(
          height: 400,
          child: TabBarView(
            controller: _tabController,
            children: [
              Container(
                child: const Column(
                  children: [
                    Text('Self Photo Content'),
                  ],
                ),
              ),
              Container(
                child: const Column(
                  children: [
                    // Your Wide Photobox content goes here
                    Text('Wide Photobox Content'),
                  ],
                ),
              ),
              Container(
                child: const Column(
                  children: [
                    // Your Photobooth content goes here
                    Text('Photobooth Content'),
                  ],
                ),
              ),
              Container(
                child: const Column(
                  children: [
                    // Your Creative content goes here
                    Text('Creative Content'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

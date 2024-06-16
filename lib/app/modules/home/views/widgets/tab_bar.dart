import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slectiv_studio_app/app/modules/home/views/widgets/Tab/potrait.dart';
import 'package:slectiv_studio_app/app/modules/home/views/widgets/Tab/photobooth.dart';
import 'package:slectiv_studio_app/app/modules/home/views/widgets/Tab/self_photo.dart';
import 'package:slectiv_studio_app/app/modules/home/views/widgets/Tab/wide_photobox.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class SlectivTabSection extends StatefulWidget {
  const SlectivTabSection({super.key});

  @override
  _TabSectionState createState() => _TabSectionState();
}

class _TabSectionState extends State<SlectivTabSection> with TickerProviderStateMixin {
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
              Tab(child: Text(SlectivTexts.selfPhotoTitle, textAlign: TextAlign.center, style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: SlectivColors.blackColor)),),),
              Tab(child: Text(SlectivTexts.widePhotoboxTitle, textAlign: TextAlign.center, style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: SlectivColors.blackColor)),), ),
              Tab(child: Text(SlectivTexts.photoboothTitle, textAlign: TextAlign.center, style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: SlectivColors.blackColor)),),),
              Tab(child: Text(SlectivTexts.potraitTitle, textAlign: TextAlign.center, style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: SlectivColors.blackColor)),),),
            ],
          ),
        ),
        SizedBox(
          height: 400,
          child: TabBarView(
            controller: _tabController,
            children: const [
              SlectivSelfPhoto(),
              SlectivWidePhotobox(),
              SlectivPhotobooth(),
              SlectivPortrait(),
            ],
          ),
        ),
      ],
    );
  }
}

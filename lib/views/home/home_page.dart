import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/constants/app_icons.dart';

import '../../core/constants/app_defaults.dart';
import '../../core/routes/app_routes.dart';
import 'components/ad_space.dart';
import 'components/our_new_item.dart';
import 'components/popular_packs.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: 100,
              leading: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.drawerPage);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF2F6F3),
                    shape: const CircleBorder(),
                  ),
                  child: SvgPicture.asset(AppIcons.sidebarIcon),
                ),
              ),
              floating: true,
              title: Image.asset(
                "assets/images/XX.png",
                height: 90,
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 4, top: 4, bottom: 4),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.search);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF2F6F3),
                      shape: const CircleBorder(),
                    ),
                    child: SvgPicture.asset(AppIcons.search),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8, top: 4, bottom: 4),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.introLogin,
                        (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF2F6F3),
                      shape: const CircleBorder(),
                    ),
                    child: SvgPicture.asset(AppIcons.profileLogout),
                  ),
                ),
              ],
            ),
            const SliverToBoxAdapter(
              child: AdSpace(),
            ),
            const SliverToBoxAdapter(
              child: PopularPacks(),
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(vertical: AppDefaults.padding),
              sliver: SliverToBoxAdapter(
                child: OurNewItem(),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}

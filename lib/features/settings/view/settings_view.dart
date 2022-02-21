import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widgets/appbar_button.dart';
import '../../../core/widgets/custom_card.dart';
import '../../../core/widgets/custom_tile.dart';
import 'widgets/appearance_page.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomTile(
              leading: const CustomCard(
                child: Icon(Icons.notifications),
              ),
              title: Text(
                'Notifications',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 20),
              ),
              trailing: const Icon(Icons.keyboard_arrow_right),
            ),
            CustomTile(
              leading: const CustomCard(
                child: Icon(Icons.security),
              ),
              onTap: () {},
              title: Text(
                'Security',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 20),
              ),
              trailing: const Icon(Icons.keyboard_arrow_right),
            ),
            CustomTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const AppearancePage();
                  },
                ));
              },
              leading: const CustomCard(
                child: Icon(Icons.remove_red_eye),
              ),
              title: Text(
                'Appearance',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 20),
              ),
              trailing: const Icon(Icons.keyboard_arrow_right),
            ),
            CustomTile(
              leading: const CustomCard(
                child: Icon(Icons.help),
              ),
              title: Text(
                'Help',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 20),
              ),
              trailing: const Icon(Icons.keyboard_arrow_right),
            ),
            CustomTile(
              leading: CustomCard(
                bgColor: Theme.of(context).errorColor,
                child: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
              ),
              title: Text(
                'Logout',
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: 20,
                    ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: const AppbarButton(),
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}

///Examples
// CustomTile(
//   leading: CustomCard(
//     padding: const EdgeInsets.all(0),
//     child: AspectRatio(
//       aspectRatio: 1 / 1,
//       child: Image.network(
//         "https://gogocdn.net/cover/shingeki-no-kyojin-the-final-season-part-2.png",
//         loadingBuilder: (context, child, loadingProgress) {
//           if (loadingProgress == null) return child;
//           if (loadingProgress.expectedTotalBytes == null) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           final percentage = loadingProgress.cumulativeBytesLoaded /
//               loadingProgress.expectedTotalBytes!;
//           if (percentage == 1) return child;
//           // if () {
//           // return child;
//           // }
//           return Center(
//             child: CircularProgressIndicator(
//               value: percentage,
//             ),
//           );
//         },
//         fit: BoxFit.cover,
//       ),
//     ),
//   )
//   // Image.asset(
//   //   "assets/images/splash_screen.jpg",
//   // )
//   ,
//   title: const Text(
//     "Shingeki no Kyojin: The Final Season Part 2",
//     maxLines: 1,
//     style: TextStyle(
//         // fontSize: 10,
//         ),
//   ),
//   subtitle: const Text(
//     "Episode 4",
//   ),
//   trailing: const Icon(
//     Icons.keyboard_arrow_right,
//     color: Color.fromRGBO(80, 88, 253, 1),
//   ),
// ),
// const CustomTile(
//   leading: CustomCard(
//     padding: EdgeInsets.all(0),
//     child: AspectRatio(
//       aspectRatio: 1 / 1,
//       child: CachedImage(
//           url:
//               "https://gogocdn.net/cover/shingeki-no-kyojin-the-final-season-part-2.png"),
//     ),
//   )
//   // Image.asset(
//   //   "assets/images/splash_screen.jpg",
//   // )
//   ,
//   title: Text(
//     "Shingeki no Kyojin: The Final Season Part 2",
//     maxLines: 1,
//     style: TextStyle(
//         // fontSize: 10,
//         ),
//   ),
//   subtitle: Text(
//     "Episode 4",
//   ),
//   trailing: Icon(
//     Icons.keyboard_arrow_right,
//     color: Color.fromRGBO(80, 88, 253, 1),
//   ),
// ),
// const CustomCard(
//   padding: EdgeInsets.symmetric(
//     horizontal: 15,
//     vertical: 10,
//   ),
//   text: "Home",
//   child: Icon(Icons.home),
// ),
// Tag(
//   text: "All",
//   isActive: false,
//   // textStyle: TextStyle(
//   //     // fontSize: 30,
//   //     ),
//   onClick: () {},
// ),
// ElevatedButton(
//   onPressed: () async {
//     // await DefaultCacheManager().emptyCache();

//     ref.read(settingsProvider).value.theme == ThemeType.light
//         ? await ref
//             .read(settingsProvider.notifier)
//             .changeTheme(ThemeType.dark)
//         : await ref
//             .read(settingsProvider.notifier)
//             .changeTheme(ThemeType.light);
//   },
//   child: Text("toggle mode"),
// ),

import 'package:dykiosk/Theme/light-Theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

List menus = ["아아", "카페라때", "아이스 초코", "애플망고", "레몬에이드", "청포도에이드", "딸기라떼"];

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("DY BookCafe"),
          titleTextStyle: TextStyle(
            fontSize: size.height * 0.03,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  delegate: TabBarDelegate(
                    maxHeight: 90,
                    minHeight: 90,
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: size.height * 0.01),
                      child: Text(
                        "어서오세요 덕영고등학교 북카페입니다",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: size.height * 0.03,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: MenuClass(
                    title: "커피",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  final double maxHeight;
  final double minHeight;
  final Widget child;

  TabBarDelegate({
    required this.maxHeight,
    required this.minHeight,
    required this.child,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(TabBarDelegate oldDelegate) {
    return oldDelegate.maxHeight != maxHeight ||
        oldDelegate.minHeight != minHeight ||
        oldDelegate.child != child;
  }
}

class MenuClass extends StatelessWidget {
  MenuClass({super.key, required this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: size.height * 0.05, bottom: size.height * 0.02),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: size.height * 0.03,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Container(
          height: size.height * 1,
          child: GridView.builder(
            itemCount: menus.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffefefef),
                ),
                child: Text(menus[index]),
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 1개의 행에 항목을 3개씩
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: size.height *  0.0008,
            ),
          ),
        ),
      ],
    );
  }
}

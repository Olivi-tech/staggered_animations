import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  final String _title = 'Home Page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _morningAnimation;
  late Animation<double> _flexAvatar1Animation;
  late Animation<double> _scheduleAnimation;
  late Animation<double> _flexAvatar2Animation;
  late Animation<double> _cardTextAnimation;
  late Animation<double> _cardIconAnimation;
  late Animation<double> _textOpacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..forward();
    _morningAnimation = Tween<double>(begin: 0, end: 40).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0, 0.2, curve: Curves.elasticInOut)));

    _flexAvatar1Animation = Tween<double>(begin: 0, end: 50).animate(
        CurvedAnimation(
            parent: _animationController, curve: const Interval(0.2, 0.4)));
    _scheduleAnimation = Tween<double>(begin: 0, end: 25).animate(
        CurvedAnimation(
            parent: _animationController, curve: const Interval(0.4, 0.6)));
    _flexAvatar2Animation = Tween<double>(begin: 0, end: 20).animate(
        CurvedAnimation(
            parent: _animationController, curve: const Interval(0.6, 0.8)));
    _cardTextAnimation = Tween<double>(begin: 0, end: 20).animate(
        CurvedAnimation(
            parent: _animationController, curve: const Interval(0.8, 0.9)));
    _cardIconAnimation = Tween<double>(begin: 0, end: 30).animate(
        CurvedAnimation(
            parent: _animationController, curve: const Interval(0.9, 1)));
    _textOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: _animationController, curve: const Interval(0.8, 0.9)));

    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    var items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    return SafeArea(
        child: Scaffold(
      extendBody: true,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(widget._title),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
          flex: 2,
          child: Stack(
            children: [
              Image(
                width: size.width,
                height: size.height,
                //   fit: BoxFit.cover,
                image: const AssetImage(
                  'assets/images/neelam.jpg',
                ),
                fit: BoxFit.cover,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Good Morning!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: _morningAnimation.value,
                        )),
                    Badge(
                      badgeContent: const Text('3'),
                      position: BadgePosition.topStart(top: 40, start: 90),
                      animationDuration: const Duration(seconds: 3),
                      elevation: 40,
                      animationType: BadgeAnimationType.slide,
                      toAnimate: false,
                      borderRadius: BorderRadius.circular(30),
                      badgeColor: Colors.green,
                      child: CircleAvatar(
                        radius: _flexAvatar1Animation.value,
                        backgroundImage:
                            const AssetImage('assets/images/uncle.jpeg'),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 0.9.toInt(),
          child: Text(
            'Here is your Schedule',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: _scheduleAnimation.value,
                color: Colors.amber.shade900),
          ),
        ),
        Expanded(
            flex: 4,
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: _flexAvatar2Animation.value,
                      backgroundImage:
                          const AssetImage('assets/images/uncle.jpeg'),
                    ),
                    title: Text(
                      'First Meeting',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: _cardTextAnimation.value),
                    ),
                    subtitle: Opacity(
                        opacity: _textOpacityAnimation.value,
                        child: const Text('1pm-2pm')),
                    trailing: Icon(Icons.person_add_outlined,
                        color: Colors.green, size: _cardIconAnimation.value),
                  ),
                );
              },
            ))
      ]),
    ));
  }
}

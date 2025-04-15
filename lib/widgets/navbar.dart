import 'package:flutter/material.dart';
import 'package:scarlet_app/screens/maps/realtime_page.dart';
import 'package:scarlet_app/screens/teams/forecast_page.dart';
import 'package:scarlet_app/screens/teams/welcome_team_page.dart';
import 'package:scarlet_app/screens/user/profile_page.dart';

class NavBar extends StatefulWidget {
  final int initialIndex;
  final int subIndex;
  const NavBar(
      {super.key,
      this.initialIndex = 0,
      this.subIndex = 0,});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late int _currentIndex;
  late int _subIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _subIndex = widget.subIndex;
  }

  @override
  Widget build(BuildContext context) {
    final List<List<Widget>> children = [
      [
        const RealTimePage(),
      ],
      [
        const ForecastPage(),
      ],
      [
        const WelcomeTeamPage(),
      ],
      [
        const ProfilePage(),
      ],
    ];
    return Theme(data: Theme.of(context).copyWith(canvasColor: Colors.white),
      child: Scaffold(
      backgroundColor: Colors.white,
      body: children[_currentIndex][_subIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border:
            Border(top: BorderSide(color: Color(0xffe4e4e4), width: 1)
          )
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              _subIndex = 0;
            });
          },
          selectedItemColor: const Color(0XFFDF8946),
          showUnselectedLabels: true,
          enableFeedback: false,
          unselectedItemColor: const Color(0XFF6a6a6a),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.local_fire_department_outlined,
                  color: Color(0XFF6a6a6a), size: 24),
              label: 'Tiempo Real',
              activeIcon: Icon(Icons.local_fire_department_outlined,
                  color: Color(0XFFDF8946), size: 24),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined,
                  color: Color(0XFF6a6a6a), size: 24),
              label: 'Pronostico',
                activeIcon: Icon(Icons.calendar_today_outlined,
                  color: Color(0XFFDF8946), size: 24),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.groups,
                  color: Color(0XFF6a6a6a), size: 24),
              label: 'Equipos',
              activeIcon: Icon(Icons.groups,
                  color: Color(0XFFDF8946), size: 24),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_pin_circle_outlined,
                  color: Color(0XFF6a6a6a), size: 24),
              label: 'Perfil',
              activeIcon: Icon(Icons.person_pin_circle_outlined,
                  color: Color(0XFFDF8946), size: 24),
            ),
          ],
        ),
      )
      )
    ) ;
  }
}
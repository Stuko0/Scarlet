import 'package:flutter/material.dart';
import 'package:scarlet_app/screens/maps/pastfires_page.dart';
import 'package:scarlet_app/screens/teams/members_page.dart';

class WelcomeTeamPage extends StatefulWidget {
  const WelcomeTeamPage({super.key});

  @override
  State<WelcomeTeamPage> createState() => _WelcomeTeamPage();
}

class _WelcomeTeamPage extends State<WelcomeTeamPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFf9fafb),
        body: Padding(
            padding: EdgeInsets.fromLTRB(
                screenWidth * 0.06, screenHeight * 0.03, screenWidth * 0.06, 20),
            child: SingleChildScrollView(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Bienvenido, Stuko",
                  style: TextStyle(
                      fontFamily: "DMSans",
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 41, 32, 32)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MembersPage()
                          )
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(
                            screenWidth * 0.03,
                            screenHeight * 0.04,
                            screenWidth * 0.1,
                            screenHeight * 0.03),
                        width: screenWidth * 0.45,
                        decoration: const BoxDecoration(
                            color: Color(0xff8dbece),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: screenWidth * 0.302,
                              child: Row(
                                children: [
                                  Icon(Icons.people_alt_outlined,
                                      color: Colors.white,
                                      size: screenWidth * 0.06),
                                  const SizedBox(width: 8,),
                                  const Text(
                                    "Miembros",
                                    style: TextStyle(
                                        fontFamily: "DMSans",
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        overflow: TextOverflow.clip),
                                  ),
                                ],
                              )
                            ),
                            const Text(
                              "3/12",
                              style: TextStyle(
                                  fontFamily: "DMSans",
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: screenWidth * 0.25,
                              child: const Text(
                                "Activos",
                                style: TextStyle(
                                    fontFamily: "DMSans",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    overflow: TextOverflow.clip
                                  ),
                              ),
                            ),
                          ],
                        )),
                    ),
                    const SizedBox(width: 8),
                    Container(
                        padding: EdgeInsets.fromLTRB(
                            screenWidth * 0.03,
                            screenHeight * 0.04,
                            screenWidth * 0.06,
                            screenHeight * 0.02),
                        width: screenWidth * 0.4,
                        decoration: const BoxDecoration(
                            color: Color(0xfff0b556),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: screenWidth * 0.31,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.local_fire_department_outlined,
                                      color: Colors.white,
                                      size: screenWidth * 0.06),
                                  const SizedBox(width: 8,),
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Incendios",
                                        style: TextStyle(
                                            fontFamily: "DMSans",
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                            overflow: TextOverflow.clip),
                                      ),
                                      Text(
                                        "Atendidos",
                                        style: TextStyle(
                                            fontFamily: "DMSans",
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                            overflow: TextOverflow.clip),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ),
                            const Text(
                              "16",
                              style: TextStyle(
                                  fontFamily: "DMSans",
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        ))
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PastFiresPage()
                      )
                    );
                  },
                  child: Container(
                  padding: EdgeInsets.only(
                      left:  screenWidth * 0.06,
                      top: screenHeight * 0.02,
                      bottom: screenHeight * 0.025),
                  width: screenWidth,
                  decoration: const BoxDecoration(
                      color: Color(0xffFEF2F2),
                      border: Border(
                        left: BorderSide(
                          color: Color(0xffde4c17),
                          width: 5,
                        ),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Icon(Icons.fireplace_outlined,
                              color: const Color(0xffde4c17), size: screenWidth * 0.07),
                          const SizedBox(width: 8,),
                          const Text(
                            "Incendios Pronosticados",
                            style: TextStyle(
                                fontFamily: "DMSans",
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      const Text(
                        "3",
                        style: TextStyle(
                            fontFamily: "DMSans",
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      const Text(
                        "2 con probabilidad alta",
                        style: TextStyle(
                            fontFamily: "DMSans",
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffde4c17)),
                      ),
                    ],
                  )),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Text(
                      "Mis Tareas",
                      style: TextStyle(
                          fontFamily: "DMSans",
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    Spacer(),
                    Text(
                      "3 Urgentes",
                      style: TextStyle(
                          fontFamily: "DMSans",
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffde4c17)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.02,
                    right: screenWidth * 0.02,
                    top: screenHeight * 0.02,
                    bottom: screenHeight * 0.025),
                  width: screenWidth,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    color: Colors.white,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.check_circle_outline_rounded,
                                color: const Color(0xff517b5b), size: screenWidth * 0.06),
                            const SizedBox(width: 8,),
                            const Text(
                              "Tarea 1",
                              style: TextStyle(
                                  fontFamily: "DMSans",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: screenWidth * 0.2,
                                  height: screenHeight * 0.03,
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(right: 8),
                                  decoration: const BoxDecoration(
                                      color: Color(0xffFEF2F2),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: const Text(
                                    "Urgente",
                                    style: TextStyle(
                                        fontFamily: "DMSans",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffde4c17)),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  "Limite: 1 hora",
                                  style: TextStyle(
                                      fontFamily: "DMSans",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff6B7280)),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Divider(
                          color: Color(0xffE5E7EB),
                          thickness: 1,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.crisis_alert_outlined,
                                color: const Color(0xffde4c17), size: screenWidth * 0.06),
                            const SizedBox(width: 8,),
                            const Text(
                              "Tarea 2",
                              style: TextStyle(
                                  fontFamily: "DMSans",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: screenWidth * 0.2,
                                  height: screenHeight * 0.03,
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(right: 8),
                                  decoration: const BoxDecoration(
                                      color: Color(0xffFEF2F2),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: const Text(
                                    "Urgente",
                                    style: TextStyle(
                                        fontFamily: "DMSans",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffde4c17)),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  "Limite: 3 horas",
                                  style: TextStyle(
                                      fontFamily: "DMSans",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff6B7280)),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Divider(
                          color: Color(0xffE5E7EB),
                          thickness: 1,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.crisis_alert_outlined,
                                color: const Color(0xffde4c17), size: screenWidth * 0.06),
                            const SizedBox(width: 8,),
                            const Text(
                              "Tarea 3",
                              style: TextStyle(
                                  fontFamily: "DMSans",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: screenWidth * 0.2,
                                  height: screenHeight * 0.03,
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(right: 8),
                                  decoration: const BoxDecoration(
                                      color: Color(0xffFEF2F2),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: const Text(
                                    "Urgente",
                                    style: TextStyle(
                                        fontFamily: "DMSans",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffde4c17)),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  "Limite: 12 horas",
                                  style: TextStyle(
                                      fontFamily: "DMSans",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff6B7280)),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Divider(
                          color: Color(0xffE5E7EB),
                          thickness: 1,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.access_time_rounded,
                                color: Colors.grey, size: screenWidth * 0.06),
                            const SizedBox(width: 8,),
                            const Text(
                              "Tarea 4",
                              style: TextStyle(
                                  fontFamily: "DMSans",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: screenWidth * 0.2,
                                  height: screenHeight * 0.03,
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(right: 8),
                                  decoration: const BoxDecoration(
                                      color: Color(0xff8dbece),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: const Text(
                                    "Normal",
                                    style: TextStyle(
                                        fontFamily: "DMSans",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  "Limite: 15/04/2025ob",
                                  style: TextStyle(
                                      fontFamily: "DMSans",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff6B7280)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Text(
                      "Tareas del Equipo",
                      style: TextStyle(
                          fontFamily: "DMSans",
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    Spacer(),
                    Text(
                      "3 Urgentes",
                      style: TextStyle(
                          fontFamily: "DMSans",
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffde4c17)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.02,
                    right: screenWidth * 0.02,
                    top: screenHeight * 0.02,
                    bottom: screenHeight * 0.025),
                  width: screenWidth,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    color: Colors.white,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.check_circle_outline_rounded,
                                color: const Color(0xff517b5b), size: screenWidth * 0.06),
                            const SizedBox(width: 8,),
                            const Text(
                              "Tarea 1",
                              style: TextStyle(
                                  fontFamily: "DMSans",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: screenWidth * 0.2,
                                  height: screenHeight * 0.03,
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(right: 8),
                                  decoration: const BoxDecoration(
                                      color: Color(0xffFEF2F2),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: const Text(
                                    "Urgente",
                                    style: TextStyle(
                                        fontFamily: "DMSans",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffde4c17)),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  "Limite: 1 hora",
                                  style: TextStyle(
                                      fontFamily: "DMSans",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff6B7280)),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Divider(
                          color: Color(0xffE5E7EB),
                          thickness: 1,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.crisis_alert_outlined,
                                color: const Color(0xffde4c17), size: screenWidth * 0.06),
                            const SizedBox(width: 8,),
                            const Text(
                              "Tarea 2",
                              style: TextStyle(
                                  fontFamily: "DMSans",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: screenWidth * 0.2,
                                  height: screenHeight * 0.03,
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(right: 8),
                                  decoration: const BoxDecoration(
                                      color: Color(0xffFEF2F2),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: const Text(
                                    "Urgente",
                                    style: TextStyle(
                                        fontFamily: "DMSans",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffde4c17)),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  "Limite: 3 horas",
                                  style: TextStyle(
                                      fontFamily: "DMSans",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff6B7280)),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Divider(
                          color: Color(0xffE5E7EB),
                          thickness: 1,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.crisis_alert_outlined,
                                color: const Color(0xffde4c17), size: screenWidth * 0.06),
                            const SizedBox(width: 8,),
                            const Text(
                              "Tarea 3",
                              style: TextStyle(
                                  fontFamily: "DMSans",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: screenWidth * 0.2,
                                  height: screenHeight * 0.03,
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(right: 8),
                                  decoration: const BoxDecoration(
                                      color: Color(0xffFEF2F2),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: const Text(
                                    "Urgente",
                                    style: TextStyle(
                                        fontFamily: "DMSans",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffde4c17)),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  "Limite: 12 horas",
                                  style: TextStyle(
                                      fontFamily: "DMSans",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff6B7280)),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Divider(
                          color: Color(0xffE5E7EB),
                          thickness: 1,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.access_time_rounded,
                                color: Colors.grey, size: screenWidth * 0.06),
                            const SizedBox(width: 8,),
                            const Text(
                              "Tarea 4",
                              style: TextStyle(
                                  fontFamily: "DMSans",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: screenWidth * 0.2,
                                  height: screenHeight * 0.03,
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(right: 8),
                                  decoration: const BoxDecoration(
                                      color: Color(0xff8dbece),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: const Text(
                                    "Normal",
                                    style: TextStyle(
                                        fontFamily: "DMSans",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  "Limite: 15/04/2025ob",
                                  style: TextStyle(
                                      fontFamily: "DMSans",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff6B7280)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    )),
              ],
            )
            )
          ),
      ),
    );
  }
}

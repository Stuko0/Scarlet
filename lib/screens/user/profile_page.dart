import 'package:flutter/material.dart';
import 'package:scarlet_app/data/user_services.dart';
import 'package:scarlet_app/screens/authentication/login_page.dart';
import 'package:scarlet_app/screens/user/edit_profile.dart';
import 'package:scarlet_app/screens/user/notifications_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xFFf9fafb),
          appBar: AppBar(
            backgroundColor: const Color(0xFFf9fafb),
            title: const Text(
              "Perfil",
              style: TextStyle(
                  fontFamily: "DMSans",
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.notifications_none_rounded,
                    color: Color(0xff6B7280)),
                tooltip: 'Show Snackbar',
                onPressed: () {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('This is a snackbar')));
                }
              )
            ],
            centerTitle: true,
            elevation: 0,
          ),
          body: Padding(
              padding: EdgeInsets.fromLTRB(screenWidth * 0.06,
                  screenHeight * 0.01, screenWidth * 0.06, 0),
              child: SingleChildScrollView(
                clipBehavior: Clip.none,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: screenWidth,
                      padding: EdgeInsets.only(bottom: 8, top: 8),
                      margin: EdgeInsets.only(bottom: 24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF000000).withAlpha(50),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: ClipOval(
                              child: Image.network(
                                "https://picsum.photos/200",
                                width: screenWidth * 0.25,
                                height: screenHeight * 0.12,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Alexander Villanueva Porcel",
                            style: TextStyle(
                                fontFamily: "DMSans",
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Especialista de campo Senior",
                            style: TextStyle(
                                fontFamily: "DMSans",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF6B7280)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.01),
                            width: screenWidth*0.5,
                            height: screenHeight * 0.03,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(right: 8),
                            decoration: const BoxDecoration(
                                color: Color(0xffFEF2F2),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.stars_rounded,
                                  color: Color(0xffde4c17),
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "42 Incendios Atendidos",
                                  style: TextStyle(
                                      fontFamily: "DMSans",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffde4c17)),
                                ),
                              ],
                            )
                          ),
                        ],
                      )
                    ),
                    Container(
                      width: screenWidth,
                      padding: EdgeInsets.only(bottom: 8, top: 8,),
                      margin: EdgeInsets.only(bottom: 24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF000000).withAlpha(50),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 20, top: 10),
                            child: Text(
                              "Información Personal",
                              style: TextStyle(
                                  fontFamily: "DMSans",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            color: Color(0xFFe5e7eb),
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Experiencia",
                                      style: TextStyle(
                                          fontFamily: "DMSans",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF6B7280)),
                                    ),
                                    Spacer(),
                                    Text(
                                      "5 años",
                                      style: TextStyle(
                                          fontFamily: "DMSans",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF111827)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Especialidad",
                                      style: TextStyle(
                                          fontFamily: "DMSans",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF6B7280)),
                                    ),
                                    Spacer(),
                                    Text(
                                      "Quema controlada",
                                      style: TextStyle(
                                          fontFamily: "DMSans",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF111827)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(
                                  color: Color(0xFFe5e7eb),
                                  thickness: 1,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Certificaciones",
                                  style: TextStyle(
                                      fontFamily: "DMSans",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF6B7280)),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.shield_outlined,
                                        color: Color(0xff517b5b)),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8),
                                      child: Text(
                                        "Quema controlada",
                                        style: TextStyle(
                                            fontFamily: "DMSans",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF111827)),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.shield_outlined,
                                        color: Color(0xff517b5b)),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8),
                                      child: Text(
                                        "Operaciones de rescate",
                                        style: TextStyle(
                                            fontFamily: "DMSans",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF111827)),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.shield_outlined,
                                        color: Color(0xff517b5b)),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8),
                                      child: Text(
                                        "Operacion de drones",
                                        style: TextStyle(
                                            fontFamily: "DMSans",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF111827)),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ),
                        ],
                      )
                    ),
                    Container(
                      width: screenWidth,
                      padding: EdgeInsets.only(top: 8,),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF000000).withAlpha(50),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const EditProfilePage(),
                                ),
                              );
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(left: 20,top: 10,bottom: 10),
                              child: Row(
                                children: [
                                  Icon(Icons.person_outline_rounded,
                                      color: Color(0xff6B7280)),
                                  SizedBox(width: 12),
                                  Text(
                                    "Editar Perfil",
                                    style: TextStyle(
                                        fontFamily: "DMSans",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                ],
                              )
                            )
                          ),
                          const Divider(
                            color: Color(0xFFe5e7eb),
                            thickness: 1,
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const NotificationsPage(),
                                ),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 20, top:10, bottom: 10),
                              child: Row(
                                children: [
                                  Icon(Icons.notifications_none_rounded,
                                      color: Color(0xff6B7280)),
                                  SizedBox(width: 12),
                                  Text(
                                    "Notificaciones",
                                    style: TextStyle(
                                        fontFamily: "DMSans",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                ],
                              )
                            ),
                          ),
                          const Divider(
                            color: Color(0xFFe5e7eb),
                            thickness: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, bottom: 10, top: 10),
                            child: Row(
                              children: [
                                const Icon(Icons.exit_to_app_rounded,
                                    color: Color(0xff6B7280)),
                                const SizedBox(width: 12),
                                InkWell(
                                  onTap: () async {
                                    final prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.clear();
                                    Navigator.push(
                                      // ignore: use_build_context_synchronously
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const LoginPage(),
                                      ),
                                    );
                                  },
                                  child:const Text(
                                    "Cerrar Sesión",
                                    style: TextStyle(
                                        fontFamily: "DMSans",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                )
                              ],
                            )
                          ),
                        ]
                      ),
                    ),
                  ],
                )
              )
            )
          ),
    );
  }
}

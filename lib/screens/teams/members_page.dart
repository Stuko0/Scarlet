import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scarlet_app/screens/teams/add_members_page.dart';
import 'package:scarlet_app/screens/teams/manage_member_page.dart';

class MembersPage extends StatefulWidget {
  const MembersPage({super.key});

  @override
  State<MembersPage> createState() => _MembersPage();
}

class _MembersPage extends State<MembersPage> {
  final TextEditingController memberName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
          backgroundColor: const Color(0xFFf9fafb),
          appBar: AppBar(
            backgroundColor: const Color(0xFFf9fafb),
            title: const Text(
              "Equipo",
              style: TextStyle(
                  fontFamily: "DMSans",
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            centerTitle: true,
            elevation: 0,
            leading: InkWell(
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.pop(context);
                }),
          ),
          body: Padding(
            padding: EdgeInsets.fromLTRB(screenWidth * 0.06,screenHeight * 0.01, screenWidth * 0.06, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: screenWidth,
                  height: screenHeight * 0.067,
                  padding: EdgeInsets.only(left: screenWidth * 0.05,),
                  decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      border: Border.all(color: const Color(0xFF000000).withAlpha(50)),
                      borderRadius: BorderRadius.circular(10)),
                  child: SizedBox(
                    width: screenWidth * 0.5,
                    height: screenHeight * 0.08,
                    child: TextField(
                      controller: memberName,
                      keyboardType: TextInputType.name,
                      inputFormatters: <TextInputFormatter> [
                        FilteringTextInputFormatter.allow(
                            RegExp(r"[a-zA-Z ]")),
                      ],
                      autofocus: false,
                      decoration: const InputDecoration(
                        hintText: "Buscar miembros",
                        hintStyle: TextStyle(
                            fontFamily: "DMSans",
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(height: screenHeight * 0.1, width: screenWidth,
                  padding: EdgeInsets.only(top: screenHeight * 0.02),
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              const Text(
                                "Miembros",
                                style: TextStyle(
                                    fontFamily: "DMSans",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF1E1E2C)),
                              ),
                              SizedBox(
                                height: screenHeight * 0.01,
                              ),
                              const Text(
                                "3 miembros",
                                style: TextStyle(
                                    fontFamily: "DMSans",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF6B7280)),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AddMembersPage()),
                              );
                            },
                            child: Container(
                              width: 36,
                              height: 36,
                              margin: EdgeInsets.only(top: screenHeight * 0.01),
                              decoration: BoxDecoration(
                                  color: const Color(0xFFDC2626),
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      fontFamily: "DMSans",
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ),
                Padding(padding: EdgeInsets.only(top:screenHeight*0.02),
                  child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: screenHeight * 0.02, bottom: screenHeight * 0.02, left: screenWidth * 0.03, right: screenWidth * 0.03),
                            height: screenHeight * 0.17,
                            width: screenWidth,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(10),
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipOval(
                                      child: Image.network(
                                        "https://picsum.photos/200",
                                        width: screenWidth * 0.15,
                                        height: screenHeight * 0.07,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.only(left: screenWidth * 0.02, top: screenHeight * 0.01),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text("Alexander Villanueva",
                                            style: TextStyle(
                                                fontFamily: "DMSans",
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF1E1E2C)),
                                          ),
                                          SizedBox(height: screenHeight * 0.01,),
                                          const Text("Lider del equipo",
                                            style: TextStyle(
                                                fontFamily: "DMSans",
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF1E1E2C)),
                                          ),
                                        ],
                                      ),
)
                                  ],
                                ),
                                Divider(
                                  color: Colors.grey[300],
                                  thickness: 1,
                                  height: screenHeight * 0.02,
                                ),
                                Padding(padding: EdgeInsets.only(top: screenHeight * 0.01),
                                  child: const Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Yo",
                                        style: TextStyle(
                                            fontFamily: "DMSans",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF1E1E2C)),
                                      ),
                                      Spacer(),
                                      Text("Disponible",
                                        style: TextStyle(
                                            fontFamily: "DMSans",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF1E1E2C)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02,),
                          Container(
                      padding: EdgeInsets.only(top: screenHeight * 0.02, bottom: screenHeight * 0.02, left: screenWidth * 0.03, right: screenWidth * 0.03),
                      height: screenHeight * 0.17,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10),
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipOval(
                                child: Image.network(
                                  "https://picsum.photos/200",
                                  width: screenWidth * 0.15,
                                  height: screenHeight * 0.07,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(left: screenWidth * 0.02, top: screenHeight * 0.01),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Chuck Mayo",
                                      style: TextStyle(
                                          fontFamily: "DMSans",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF1E1E2C)),
                                    ),
                                    SizedBox(height: screenHeight * 0.01,),
                                    const Text("Primeros Auxilios",
                                      style: TextStyle(
                                          fontFamily: "DMSans",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF1E1E2C)),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Padding(padding: EdgeInsets.only(top: screenHeight * 0.01,bottom: screenHeight*0.01),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const ManageMemberPage()),
                                  );
                                },
                                child: Container(
                                  width: screenWidth * 0.1,
                                  height: screenHeight * 0.05,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFF3F4F6),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Center(
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.black,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ))
                            ],
                          ),
                          Divider(
                            color: Colors.grey[300],
                            thickness: 1,
                            height: screenHeight * 0.02,
                          ),
                          Padding(padding: EdgeInsets.only(top: screenHeight * 0.01),
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Activo",
                                  style: TextStyle(
                                      fontFamily: "DMSans",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF1E1E2C)),
                                ),
                                Spacer(),
                                Text("Disponible",
                                  style: TextStyle(
                                      fontFamily: "DMSans",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF1E1E2C)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02,),
                    Container(
                      padding: EdgeInsets.only(top: screenHeight * 0.02, bottom: screenHeight * 0.02, left: screenWidth * 0.03, right: screenWidth * 0.03),
                      height: screenHeight * 0.17,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10),
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipOval(
                                child: Image.network(
                                  "https://picsum.photos/200",
                                  width: screenWidth * 0.15,
                                  height: screenHeight * 0.07,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(left: screenWidth * 0.02, top: screenHeight * 0.01),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Deirdre Gallegos",
                                      style: TextStyle(
                                          fontFamily: "DMSans",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF1E1E2C)),
                                    ),
                                    SizedBox(height: screenHeight * 0.01,),
                                    const Text("Agente de Campo",
                                      style: TextStyle(
                                          fontFamily: "DMSans",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF1E1E2C)),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Padding(padding: EdgeInsets.only(top: screenHeight * 0.01,bottom: screenHeight*0.01),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const ManageMemberPage()),
                                  );
                                },
                                child: Container(
                                  width: screenWidth * 0.1,
                                  height: screenHeight * 0.05,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFF3F4F6),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Center(
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.black,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ))
                            ],
                          ),
                          Divider(
                            color: Colors.grey[300],
                            thickness: 1,
                            height: screenHeight * 0.02,
                          ),
                          Padding(padding: EdgeInsets.only(top: screenHeight * 0.01),
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Activo",
                                  style: TextStyle(
                                      fontFamily: "DMSans",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF1E1E2C)),
                                ),
                                Spacer(),
                                Text("Disponible",
                                  style: TextStyle(
                                      fontFamily: "DMSans",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF1E1E2C)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                        ],
                      )
                    )
                  ),
                // Expanded(child:_buildMemberList(screenWidth,screenHeight))
              ],
            ),
          )
        ),
    );
  }
}

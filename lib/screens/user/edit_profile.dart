import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});
  @override
  State<EditProfilePage> createState() => _EditProfilePage();
}

class _EditProfilePage extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFf9fafb),
          appBar: AppBar(
            backgroundColor: const Color(0xFFf9fafb),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text(
              "Editar Perfil",
              style: TextStyle(
                  fontFamily: "DMSans",
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
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
                    ).showSnackBar(
                        const SnackBar(content: Text('This is a snackbar')));
                  })
            ],
            centerTitle: false,
            elevation: 0,
          ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(screenWidth * 0.06,
              screenHeight * 0.02, screenWidth * 0.06, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      ClipOval(
                        child: Image.network(
                          "https://picsum.photos/200",
                          width: screenWidth * 0.25,
                          height: screenHeight * 0.12,
                          fit: BoxFit.cover,
                        ),
                      ),
                      InkWell(
                        onTap:(){},
                        child: ClipOval(
                          child: Container(
                              width: screenWidth * 0.1,
                              height: screenWidth * 0.1,
                              color: Color(0xffde4c17),
                              alignment: Alignment.center,    
                              child: Icon(Icons.camera_alt_outlined,
                                  color: Colors.white,
                                  size: screenWidth * 0.06,
                              ),
                          )
                        )
                      )
                    ],
                  )
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Text(
                  "Nombre",
                  style: TextStyle(
                      fontFamily: "DMSans",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Alexander Villanueva Porcel",
                    hintStyle: TextStyle(
                        fontFamily: "DMSans",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff6B7280)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Color(0xff6B7280),
                        width: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Text(
                  "Email",
                  style: TextStyle(
                      fontFamily: "DMSans",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "avplaying@gmail.com",
                    hintStyle: TextStyle(
                        fontFamily: "DMSans",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff6B7280)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Color(0xff6B7280),
                        width: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Text(
                  "Telefono",
                  style: TextStyle(
                      fontFamily: "DMSans",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "+591 67602979",
                    hintStyle: TextStyle(
                        fontFamily: "DMSans",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff6B7280)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Color(0xff6B7280),
                        width: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Text(
                  "Experiencia",
                  style: TextStyle(
                      fontFamily: "DMSans",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "5",
                    hintStyle: TextStyle(
                        fontFamily: "DMSans",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff6B7280)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Color(0xff6B7280),
                        width: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                InkWell(
                  onTap:(){},
                  child: Container(
                      width: screenWidth,
                      height: screenHeight * 0.06,
                      decoration: BoxDecoration(
                          color: Color(0xffde4c17),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                              Icon(Icons.save_outlined, color: Colors.white,size: 30,),
                              SizedBox(
                                  width: 8,
                              ),
                              Text(
                                  "Guardar",
                                  style: TextStyle(
                                      fontFamily: "DMSans",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                              ),
                          ]
                      )
                  )
              )
              ],
            ),
          )
        )
      )
    );
  }
}
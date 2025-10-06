import 'package:flutter/material.dart';
class NotificationsPage extends StatefulWidget{
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState()=>_NotificationsPage();
}

class _NotificationsPage extends State<NotificationsPage>{
  @override
  Widget build(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool fireAlert=true;
    bool weatherUpdate=true;
    bool teamTask=true;

    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xFFf9fafb),
          appBar: AppBar(
            backgroundColor: const Color(0xFFf9fafb),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text(
              "Notificaciones",
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
                  screenHeight * 0.01, screenWidth * 0.06, 0),
              child: SingleChildScrollView(
                clipBehavior: Clip.none,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(bottom: screenHeight*0.02),
                      padding: EdgeInsets.only(
                          left:  screenWidth * 0.06,
                          right: screenWidth*0.06,
                          top: screenHeight * 0.02,
                          bottom: screenHeight * 0.025),
                      width: screenWidth,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            left: BorderSide(
                              color: Color(0xffde4c17),
                              width: 5,
                            ),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: 
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ClipOval(
                                child: Container(
                                    width: screenWidth * 0.08,
                                    height: screenWidth * 0.08,
                                    color: Colors.grey[200],
                                    alignment: Alignment.center,    
                                    child: Icon(Icons.warning_amber_rounded,
                                        color: Color(0xffde4c17),
                                        size: screenWidth * 0.06,
                                    ),
                                )
                              ),
                              const SizedBox(width: 8,),
                              SizedBox(
                                width: screenWidth*0.5,
                                child: Text(
                                  "Atencion Inmediata Necesaria",
                                  style: TextStyle(
                                      fontFamily: "DMSans",
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      overflow: TextOverflow.clip
                                    ),
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                width: screenWidth*0.1,
                                child: Text(
                                  "Hace 5 minutos",
                                  style: TextStyle(
                                      fontFamily: "DMSans",
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF6B7280),
                                      overflow: TextOverflow.clip
                                    ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: screenWidth*0.1),
                            width: screenWidth*0.6,
                            child: Text(
                              "Nuevo incendio detectado en Tunari",
                              style: TextStyle(
                                  fontFamily: "DMSans",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF6B7280),
                                  overflow: TextOverflow.clip
                                ),
                            ),
                          )
                        ],
                      ),
                    ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                      margin: EdgeInsets.only(bottom: screenHeight*0.02),
                      padding: EdgeInsets.only(
                          left:  screenWidth * 0.06,
                          right: screenWidth*0.06,
                          top: screenHeight * 0.02,
                          bottom: screenHeight * 0.025),
                      width: screenWidth,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            left: BorderSide(
                              color: Color(0xff8dbece),
                              width: 5,
                            ),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: 
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ClipOval(
                                child: Container(
                                    width: screenWidth * 0.08,
                                    height: screenWidth * 0.08,
                                    color: Colors.grey[200],
                                    alignment: Alignment.center,    
                                    child: Icon(Icons.people_alt_outlined,
                                        color: Color(0xff8dbece),
                                        size: screenWidth * 0.06,
                                    ),
                                )
                              ),
                              const SizedBox(width: 8,),
                              SizedBox(
                                width: screenWidth*0.5,
                                child: Text(
                                  "Nueva Tarea de Equipo",
                                  style: TextStyle(
                                      fontFamily: "DMSans",
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      overflow: TextOverflow.clip
                                    ),
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                width: screenWidth*0.1,
                                child: Text(
                                  "Hace 1 hora",
                                  style: TextStyle(
                                      fontFamily: "DMSans",
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF6B7280),
                                      overflow: TextOverflow.clip
                                    ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: screenWidth*0.1),
                            width: screenWidth*0.6,
                            child: Text(
                              "Actualizar rutas de evacuacion en Tunari",
                              style: TextStyle(
                                  fontFamily: "DMSans",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF6B7280),
                                  overflow: TextOverflow.clip
                                ),
                            ),
                          )
                        ],
                      ),
                    ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                      margin: EdgeInsets.only(bottom: screenHeight*0.02),
                      padding: EdgeInsets.only(
                          left:  screenWidth * 0.06,
                          right: screenWidth*0.06,
                          top: screenHeight * 0.02,
                          bottom: screenHeight * 0.025),
                      width: screenWidth,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            left: BorderSide(
                              color: Color(0xff517b5b),
                              width: 5,
                            ),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: 
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ClipOval(
                                child: Container(
                                    width: screenWidth * 0.08,
                                    height: screenWidth * 0.08,
                                    color: Colors.grey[200],
                                    alignment: Alignment.center,    
                                    child: Icon(Icons.map_outlined,
                                        color: Color(0xff517b5b),
                                        size: screenWidth * 0.06,
                                    ),
                                )
                              ),
                              const SizedBox(width: 8,),
                              SizedBox(
                                width: screenWidth*0.5,
                                child: Text(
                                  "Alerta del Clima",
                                  style: TextStyle(
                                      fontFamily: "DMSans",
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      overflow: TextOverflow.clip
                                    ),
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                width: screenWidth*0.1,
                                child: Text(
                                  "Hace 2 horas",
                                  style: TextStyle(
                                      fontFamily: "DMSans",
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF6B7280),
                                      overflow: TextOverflow.clip
                                    ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: screenWidth*0.1),
                            width: screenWidth*0.6,
                            child: Text(
                              "Fuertes vientos en Tunari",
                              style: TextStyle(
                                  fontFamily: "DMSans",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF6B7280),
                                  overflow: TextOverflow.clip
                                ),
                            ),
                          )
                        ],
                      ),
                    ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                      margin: EdgeInsets.only(bottom: screenHeight*0.02),
                      padding: EdgeInsets.only(
                          left:  screenWidth * 0.06,
                          right: screenWidth*0.06,
                          top: screenHeight * 0.02,
                          bottom: screenHeight * 0.025),
                      width: screenWidth,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            left: BorderSide(
                              color: Color(0xfff0b556),
                              width: 5,
                            ),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: 
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ClipOval(
                                child: Container(
                                    width: screenWidth * 0.08,
                                    height: screenWidth * 0.08,
                                    color: Colors.grey[200],
                                    alignment: Alignment.center,    
                                    child: Icon(Icons.task_outlined,
                                        color: Color(0xfff0b556),
                                        size: screenWidth * 0.06,
                                    ),
                                )
                              ),
                              const SizedBox(width: 8,),
                              SizedBox(
                                width: screenWidth*0.5,
                                child: Text(
                                  "Nueva Tarea Personal",
                                  style: TextStyle(
                                      fontFamily: "DMSans",
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      overflow: TextOverflow.clip
                                    ),
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                width: screenWidth*0.1,
                                child: Text(
                                  "Hace 1 dia",
                                  style: TextStyle(
                                      fontFamily: "DMSans",
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF6B7280),
                                      overflow: TextOverflow.clip
                                    ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: screenWidth*0.1),
                            width: screenWidth*0.6,
                            child: Text(
                              "Limpiar la indumentaria de trabajo",
                              style: TextStyle(
                                  fontFamily: "DMSans",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF6B7280),
                                  overflow: TextOverflow.clip
                                ),
                            ),
                          )
                        ],
                      ),
                    ),
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
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20, top: 10, bottom: 20),
                            child: Text(
                              "Configuracion de Notificaciones",
                              style: TextStyle(
                                  fontFamily: "DMSans",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: "Alertas de Incendio\n",
                                        style: TextStyle(
                                            fontFamily: "DMSans",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                            children:[
                                              TextSpan(
                                                text: "Alertas de baja prioridad",
                                                style: TextStyle(
                                                    fontFamily: "DMSans",
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xFF6B7280)),
                                              )
                                            ]
                                      ),
                                    ),
                                    const Spacer(),
                                    Switch(
                                      activeColor: Color(0xffde4c17),
                                      activeTrackColor: Colors.grey[200],
                                      value: fireAlert,
                                      onChanged: (bool value){
                                      setState(() {
                                        fireAlert=value;
                                      });
                                    })
                                  ],
                                ),
                                Row(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: "Tareas\n",
                                        style: TextStyle(
                                            fontFamily: "DMSans",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                            children:[
                                              TextSpan(
                                                text: "Tareas personales o de equipo",
                                                style: TextStyle(
                                                    fontFamily: "DMSans",
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xFF6B7280)),
                                              )
                                            ]
                                      ),
                                    ),
                                    const Spacer(),
                                    Switch(
                                      activeColor: const Color(0xffde4c17),
                                      activeTrackColor: Colors.grey[200],
                                      value: teamTask,
                                      onChanged: (value){
                                      setState(() {
                                        fireAlert=value;
                                      });
                                    })
                                  ],
                                ),
                                Row(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: "Cambios en el Clima\n",
                                        style: TextStyle(
                                            fontFamily: "DMSans",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                            children:[
                                              TextSpan(
                                                text: "Pronosticos y advertencias diarias",
                                                style: TextStyle(
                                                    fontFamily: "DMSans",
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xFF6B7280)),
                                              )
                                            ]
                                      ),
                                    ),
                                    const Spacer(),
                                    Switch(
                                      activeColor: const Color(0xffde4c17),
                                      activeTrackColor: Colors.grey[200],
                                      value: weatherUpdate,
                                      onChanged: (value){
                                      setState(() {
                                        fireAlert=value;
                                      });
                                    })
                                  ],
                                ),
                              ],
                            )
                          ),
                        ],
                      )
                    ),
                  ],
                ),
              )
          )
      )
    );
  }
}
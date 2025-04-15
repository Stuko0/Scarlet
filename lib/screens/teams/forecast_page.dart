import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scarlet_app/screens/maps/pastfires_page.dart';

class ForecastPage extends StatefulWidget {
  const ForecastPage({super.key});

  @override
  State<ForecastPage> createState() => _ForecastPage();
}

class _ForecastPage extends State<ForecastPage> {
    DateTime? selectedDate=DateTime.now();
    late String formatedMonth = DateFormat('EEE, MMMM d', 'es').format(selectedDate!);
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
            backgroundColor: Color(0xFFf9fafb),
            appBar: AppBar(
              backgroundColor: const Color(0xFFf9fafb),
              title: const Text(
                "Pronosticos",
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
                      ).showSnackBar(
                          const SnackBar(content: Text('This is a snackbar')));
                    })
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
                    children: [
                        Padding(padding: EdgeInsets.only(top: 8),
                            child:Row(
                                children: [
                                    InkWell(
                                        onTap:selectedDate!.isAfter(DateTime.now())?() {
                                            selectedDate = selectedDate?.subtract(Duration(days: 1));
                                            setState(() {
                                                formatedMonth = DateFormat('EEE, MMMM d', 'es').format(selectedDate!);
                                            });
                                        }:null,
                                        child:Icon(Icons.chevron_left_rounded, color: selectedDate!.isAfter(DateTime.now())?Color(0xff4B5563):Color(0xff6B7280),size: 30),
                                    ),
                                    Spacer(),
                                    InkWell(
                                        onTap: () {
                                            showDatePicker(context: context,initialEntryMode: DatePickerEntryMode.calendar, firstDate: DateTime.now(), lastDate: DateTime(2026), initialDate: selectedDate??DateTime.now()).then((value) {
                                                setState(() {
                                                    selectedDate = value;
                                                    formatedMonth = DateFormat('EEE, MMMM d','es').format(selectedDate!);
                                                });
                                            });
                                        },
                                        child: Icon(Icons.calendar_today_outlined, color: Color(0xff4B5563),),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(left: 8),
                                        child: RichText(
                                            text: TextSpan(
                                                text: formatedMonth,
                                                style: const TextStyle(
                                                    fontFamily: "DMSans",
                                                    fontSize: 16,
                                                    height: 1.5,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xff111827))
                                            )
                                        )
                                    ),
                                    Spacer(),
                                    InkWell(
                                        onTap: (){
                                            selectedDate = selectedDate?.add(Duration(days: 1));
                                            setState(() {
                                                formatedMonth = DateFormat('EEE, MMMM d','es').format(selectedDate!);
                                            });
                                        },
                                        child: Icon(Icons.chevron_right_rounded, color: Color(0xff4B5563),size: 30,),
                                    )
                                ],
                            ),
                        ),
                    Container(
                        width: screenWidth,
                        padding: EdgeInsets.only(bottom: 8, top: 8,),
                        margin: EdgeInsets.only(bottom: 24, top: 34),
                        decoration: BoxDecoration(
                            color: Color(0xFFf9fafb),
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
                        child: Padding(padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child:Text(
                                            "Nivel Riesgo Previsto",
                                            style: TextStyle(
                                                fontFamily: "DMSans",
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff6B7280)),
                                        )
                                    ),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                            Text(
                                                "Extremo",
                                                style: TextStyle(
                                                    fontFamily: "DMSans",
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff111827)),
                                            ),
                                            Spacer(),
                                            ClipOval(
                                                child: Container(
                                                    width: screenWidth * 0.2,
                                                    height: screenWidth * 0.2,
                                                    color: Color(0xffde4c17),
                                                    alignment: Alignment.center,    
                                                    child: Icon(Icons.warning_amber_rounded,
                                                        color: Colors.white,
                                                        size: screenWidth * 0.13,
                                                    ),
                                                )
                                            )
                                        ],
                                    ),
                                ],
                                ),
                        )
                    ),
                    Container(
                        width: screenWidth,
                        padding: EdgeInsets.only(bottom: 8, top: 8,),
                        margin: EdgeInsets.only(bottom: 24),
                        decoration: BoxDecoration(
                            color: Color(0xFFf9fafb),
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
                        child: Padding(padding: EdgeInsets.only(left: 20, top: 10, bottom: 20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child:Text(
                                            "Condiciones Climaticas",
                                            style: TextStyle(
                                                fontFamily: "DMSans",
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff6B7280)),
                                        )
                                    ),
                                    Row(
                                        children: [
                                            SizedBox(
                                                width: screenWidth * 0.4,
                                                child: Row(
                                                    children: [
                                                        Icon(Icons.thermostat_outlined, color: Color(0xffde4c17),),
                                                        Padding(
                                                            padding: EdgeInsets.only(left: 8),
                                                            child: RichText(
                                                                text: TextSpan(
                                                                    text: 'Temperatura\n',
                                                                    style: TextStyle(
                                                                        fontFamily: "DMSans",
                                                                        fontSize: 16,
                                                                        fontWeight: FontWeight.w400,
                                                                        color: Color(0xff6B7280)),
                                                                    children: const <TextSpan>[
                                                                        TextSpan(
                                                                            text: '23 °C',
                                                                            style: TextStyle(
                                                                                fontFamily: "DMSans",
                                                                                fontSize: 16,
                                                                                height: 1.5,
                                                                                fontWeight: FontWeight.w500,
                                                                                color: Color(0xff111827))
                                                                        )
                                                                    ]
                                                                )
                                                            )
                                                        )
                                                    ],
                                                ),
                                            ),
                                            Spacer(),
                                            SizedBox(
                                                width: screenWidth * 0.4,
                                                child: Row(
                                                    children: [
                                                        Icon(Icons.water_drop_outlined, color: Color(0xff9bbfcf),),
                                                        Padding(
                                                            padding: EdgeInsets.only(left: 8),
                                                            child: RichText(
                                                                text: TextSpan(
                                                                    text: 'Humedad\n',
                                                                    style: TextStyle(
                                                                        fontFamily: "DMSans",
                                                                        fontSize: 16,
                                                                        fontWeight: FontWeight.w400,
                                                                        color: Color(0xff6B7280)),
                                                                    children: const <TextSpan>[
                                                                        TextSpan(
                                                                            text: '15%',
                                                                            style: TextStyle(
                                                                                fontFamily: "DMSans",
                                                                                fontSize: 16,
                                                                                height: 1.5,
                                                                                fontWeight: FontWeight.w500,
                                                                                color: Color(0xff111827))
                                                                        )
                                                                    ]
                                                                )
                                                            )
                                                        )
                                                    ],
                                                ),
                                            )
                                        ],
                                    ),
                                    SizedBox(
                                        height: 16,
                                    ),
                                    SizedBox(
                                        width: screenWidth * 0.5,
                                        child: Row(
                                            children: [
                                                Icon(Icons.air_rounded, color: Color(0XFF6a6a6a),),
                                                Padding(
                                                    padding: EdgeInsets.only(left: 8),
                                                    child: RichText(
                                                        text: TextSpan(
                                                            text: 'Viento\n',
                                                            style: TextStyle(
                                                                fontFamily: "DMSans",
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.w400,
                                                                color: Color(0xff6B7280)),
                                                            children: const <TextSpan>[
                                                                TextSpan(
                                                                    text: '10 km/h NE',
                                                                    style: TextStyle(
                                                                        fontFamily: "DMSans",
                                                                        fontSize: 16,
                                                                        height: 1.5,
                                                                        fontWeight: FontWeight.w500,
                                                                        color: Color(0xff111827))
                                                                )
                                                            ]
                                                        )
                                                    )
                                                )
                                            ],
                                        ),
                                    )
                                ],
                                ),
                        )
                    ),
                    Container(
                        width: screenWidth,
                        padding: EdgeInsets.only(bottom: 8, top: 8,),
                        decoration: BoxDecoration(
                            color: Color(0xFFf9fafb),
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
                        child: Padding(padding: EdgeInsets.only(left: 20, top: 10, bottom: 20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child:Text(
                                            "Prevenciones por el Clima",
                                            style: TextStyle(
                                                fontFamily: "DMSans",
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff6B7280)),
                                        )
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(
                                            left:  screenWidth * 0.06,
                                            top: screenHeight * 0.02,
                                            bottom: screenHeight * 0.025),
                                        margin: EdgeInsets.only(bottom: 8),
                                        width: screenWidth*0.8,
                                        decoration: const BoxDecoration(
                                            color: Color(0xffFEF2F2),
                                            border: Border(
                                                left: BorderSide(
                                                color: Color(0xffde4c17),
                                                width: 5,
                                                ),
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(8))),
                                        child: Row(
                                            children: [
                                                Icon(Icons.fireplace_outlined,
                                                    color: const Color(0xffde4c17), size: screenWidth * 0.07),
                                                const SizedBox(width: 8,),
                                                const Text(
                                                "Precaucion 1",
                                                style: TextStyle(
                                                    fontFamily: "DMSans",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xffde4c17)),
                                                ),
                                            ],
                                        ),
                                    ),

                                    Container(
                                        padding: EdgeInsets.only(
                                            left:  screenWidth * 0.06,
                                            top: screenHeight * 0.02,
                                            bottom: screenHeight * 0.025),
                                        margin: EdgeInsets.only(bottom: 8),
                                        width: screenWidth*0.8,
                                        decoration: const BoxDecoration(
                                            color: Color(0xffFEF2F2),
                                            border: Border(
                                                left: BorderSide(
                                                color: Color(0xffde4c17),
                                                width: 5,
                                                ),
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(8))),
                                        child: Row(
                                            children: [
                                                Icon(Icons.fireplace_outlined,
                                                    color: const Color(0xffde4c17), size: screenWidth * 0.07),
                                                const SizedBox(width: 8,),
                                                const Text(
                                                "Precaucion 2",
                                                style: TextStyle(
                                                    fontFamily: "DMSans",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xffde4c17)),
                                                ),
                                            ],
                                        ),
                                    ),
                                ],
                                ),
                        )
                    ),
                    Container(
                        width: screenWidth,
                        padding: EdgeInsets.only(bottom: 8, top: 8,),
                        margin: EdgeInsets.only(bottom: 24, top: 24),
                        decoration: BoxDecoration(
                            color: Color(0xFFf9fafb),
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
                        child: Padding(padding: EdgeInsets.only(left: 20, top: 10, bottom: 20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child:Text(
                                            "Incendios Potenciales",
                                            style: TextStyle(
                                                fontFamily: "DMSans",
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff6B7280)),
                                        )
                                    ),
                                    Row(
                                        children: [
                                            Container(
                                                width: screenWidth * 0.8,
                                                padding: EdgeInsets.only(left: 8, right: 8, bottom: 16),
                                                child: Row(
                                                    children: const [
                                                        Text(
                                                            "3",
                                                            style: TextStyle(
                                                                fontFamily: "DMSans",
                                                                fontSize: 20,
                                                                fontWeight: FontWeight.w500,
                                                                color: Color(0xff111827)),
                                                        ),
                                                        Spacer(),
                                                        Text(
                                                            "Detectados en el area",
                                                            style: TextStyle(
                                                                fontFamily: "DMSans",
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.w400,
                                                                color: Color(0xff6B7280)),
                                                        )
                                                    ],
                                                ),
                                            ),
                                        ],
                                    ),
                                    InkWell(
                                        onTap:(){
                                          Navigator.push(context, MaterialPageRoute(
                                              builder: (context) => const PastFiresPage()));
                                        },
                                        child: Container(
                                            width: screenWidth * 0.8,
                                            height: screenHeight * 0.06,
                                            decoration: BoxDecoration(
                                                color: Color(0xffde4c17),
                                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                            ),
                                            padding: EdgeInsets.only(left: 8, right: 8),
                                            child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: const [
                                                    Text(
                                                        "Ver en el mapa",
                                                        style: TextStyle(
                                                            fontFamily: "DMSans",
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.w500,
                                                            color: Colors.white),
                                                    ),
                                                    SizedBox(
                                                        width: 8,
                                                    ),
                                                    Icon(Icons.map_rounded, color: Colors.white,size: 30,)
                                                ]
                                            )
                                        )
                                    )
                                ],
                                ),
                        )
                    ),
                    ],
                ),
              )
            )));
  }
}

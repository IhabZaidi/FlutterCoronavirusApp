// ignore_for_file: prefer_const_constructors, avoid_print
import 'package:coronavirusapp/logic/cubit/loaddata_cubit.dart';
import 'package:coronavirusapp/presentation/widgets/card_widget.dart';
import 'package:coronavirusapp/presentation/widgets/cutom_image.dart';
import 'package:coronavirusapp/presentation/widgets/icon_widget.dart';
import 'package:coronavirusapp/presentation/widgets/text_widget.dart';
import 'package:coronavirusapp/presentation/widgets/wsized.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomImageWidget(
            imgpath: 'assets/images/coronasp.png',
            width: 1,
            height: 1,
          ),
          Column(
            children: [
              WSizedBox(wval: 0, hval: 0.32),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      WSizedBox(wval: 0, hval: 0.04),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.12,
                        width: MediaQuery.of(context).size.width * .8,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 245, 246, 255),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Row(
                          children: [
                            IconWidget(
                              icon: Icons.question_answer,
                              size: 40.0,
                              iconColor: Colors.blue,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: 'why i made this ?',
                                    textcolor: Color.fromARGB(255, 74, 54, 89),
                                    textsize: 14,
                                  ),
                                  TextWidget(
                                    text:
                                        'i made this app to improve my flutter skills using: flutter widgets, Rest api, bloc, provider',
                                    textsize: 12,
                                    fontWeight: FontWeight.normal,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      WSizedBox(wval: 0, hval: 0.04),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BlocBuilder<LoaddataCubit, LoaddataState>(
                            builder: (context, state) {
                              return GestureDetector(
                                onTap: () {},
                                child: CardWidget(
                                  color: Colors.purpleAccent,
                                  path: 'assets/images/suspect.png',
                                  txt1: 'cases suspected',
                                  txt2: BlocProvider.of<LoaddataCubit>(context).casesSuspected.toString(),
                                ),
                              );
                            },
                          ),
                          BlocBuilder<LoaddataCubit, LoaddataState>(
                            builder: (context, state) {
                              return CardWidget(
                                color: Color.fromARGB(255, 255, 173, 62),
                                path: 'assets/images/confirmation.png',
                                txt1: 'cases confirmed',
                                txt2: BlocProvider.of<LoaddataCubit>(context).casesConfirmed.toString(),
                              );
                            },
                          ),
                        ],
                      ),
                      WSizedBox(wval: 0, hval: 0.04),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BlocBuilder<LoaddataCubit, LoaddataState>(
                            builder: (context, state) {
                              return CardWidget(
                                color: Color.fromARGB(255, 255, 138, 147),
                                path: 'assets/images/death.png',
                                txt1: 'deaths',
                                txt2: BlocProvider.of<LoaddataCubit>(context).casesDeath.toString(),
                              );
                            },
                          ),
                          BlocBuilder<LoaddataCubit, LoaddataState>(
                            builder: (context, state) {
                              return CardWidget(
                                color: Color.fromARGB(255, 3, 191, 164),
                                path: 'assets/images/potion.png',
                                txt1: 'recovered',
                                txt2: BlocProvider.of<LoaddataCubit>(context).casesRecovered.toString(),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

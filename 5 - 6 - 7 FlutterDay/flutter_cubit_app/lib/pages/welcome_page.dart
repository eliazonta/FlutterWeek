import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubits.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/pages/widgets/app_large_text.dart';
import 'package:flutter_cubit/pages/widgets/app_text.dart';
import 'package:flutter_cubit/pages/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",

  ];
  List title = [
    "Trips",
    "Freedom",
    "Places"
  ];
  List text = [
    "Mountain",
    "Happy",
    "Peaceful"
  ];
  List description = [
    "Mountain hikes gives you incredible sense of freedom along with endurance test",
    "Moutain views gives you incredible freedom sense",
    "Mountain places are free from urban chaos, the perfect place to relax and vibe"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (_, index){
        return Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "img/" + images[index]
              ),
              fit: BoxFit.cover
            ),
          ),
          child: Container(
            margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppLargeText(text: text[index]),
                    AppText(text: title[index], size: 30),
                    SizedBox(height: 20,),
                    Container(
                      width: 250,
                      child: AppText(
                        text: description[index],
                        color: AppColors.textColor2,
                        size: 14,
                      ),
                    ),
                    SizedBox(height: 40,),
                    GestureDetector(
                      onTap: (){
                        BlocProvider.of<AppCubits>(context).getData();
                      },
                      child: Container(
                        width: 200,
                        child: Row(
                          children: [
                             ResponsiveButton(width: 120,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                Column(
                  children: List.generate(3, (indexDots){
                    return Container(
                      margin: EdgeInsets.only(bottom: 2),
                      width: 8,
                      height: index == indexDots? 25:8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: index == indexDots?AppColors.mainColor:Colors.red.withOpacity(0.3),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
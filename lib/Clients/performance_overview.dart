import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Authentication/SignIn/sign_in_screen.dart';
import 'package:happi_workers_pract/Authentication/SignUp/sign_up_password.dart';
import 'package:happi_workers_pract/Onboarding/my_documents.dart';
import 'package:happi_workers_pract/constants.dart';

class PerformanceOverview extends StatefulWidget {
  const PerformanceOverview({super.key});

  @override
  State<PerformanceOverview> createState() => _PerformanceOverviewState();
}

class _PerformanceOverviewState extends State<PerformanceOverview> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SafeArea(
            bottom: false,

            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [

                      Positioned(
                          top: 0,
                          right: 0,
                          child: Image(
                              height: 280,
                              image: AssetImage("assets/images/conner.png"))),

                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      //color: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image(
                                    image: AssetImage("assets/images/Back_b.png")),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Back", style: TextStyle(fontSize: 20),)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                        ],
                      ),
                    ),

                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        //color: Colors.red,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                        child: ListView(
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Container(
                              height: MediaQuery.of(context).size.height,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Performance",
                                        style: TextStyle(
                                            fontSize: 48,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),



                                  Text(
                                    "Discharge End - Letter",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: happiPrimary
                                    ),
                                  ),


                                  SizedBox(
                                    height: 30,
                                  ),


                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Dear Fred Fafa",
                                        style: TextStyle(
                                            fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "I hope this letter finds you well. Attached is an End of Treatment letter summarising your therapeutic journey with us.",
                                        style: TextStyle(
                                            fontSize: 12,
                                        ),
                                      ),

                                    ],
                                  ),

                                  SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [
                                      Text(
                                        "COUNSELLING ASSESSMENT",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: happiPrimary
                                        ),
                                      ),

                                      SizedBox(
                                        height: 10,
                                      ),

                                      Text(
                                        "You demonstrated commitment and active participation throughout our time together, leading to positive changes and growth. We addressed symptoms such as Anxiety, PTS Disorder, Social Anxiety. Your initial assessment scores were 13.5 on the Patient Health Questionnaire (PHQ-9) and 20 on the Generalized Anxiety Disorder (GAD-7) questionnaire.",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "TREATMENT GOALS",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: happiPrimary
                                        ),
                                      ),

                                      SizedBox(
                                        height: 10,
                                      ),

                                      Text(
                                        "Our treatment goals focused on [state the goals agreed upon]. Over 10 Sessions, we explored various therapeutic approaches.",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),


                                  SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "TREATMENT SUMMARY",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: happiPrimary
                                        ),
                                      ),

                                      SizedBox(
                                        height: 10,
                                      ),

                                      Text(
                                        "During our final session, you achieved a PHQ-9 score of 13.5 and a GAD-7 score of 20 reflecting progress made. Healing is a gradual process, and setbacks do not diminish the value of your achievements. If you require further support, consider exploring available resources.",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),


                                  SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "RISK",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: happiPrimary
                                        ),
                                      ),

                                      SizedBox(
                                        height: 10,
                                      ),

                                      Text(
                                        "Your safety and well-being were paramount throughout our sessions. We immediately acted whenever you shared concerns or risks, ensuring your safety. [Provide specific details about actions taken and relevant information about the client's risk level].",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),


                                  SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "CONCLUSION",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: happiPrimary
                                        ),
                                      ),

                                      SizedBox(
                                        height: 10,
                                      ),

                                      Text(
                                        "As we conclude our therapeutic relationship, I sincerely appreciate you entrusting us with your therapy. You have developed valuable skills and insights during our time together. [Add any specific skills or insights observed in the client's progress]. I do not doubt that you will continue to grow and thrive.",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),


                                  SizedBox(
                                    height: 10,
                                  ),

                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => MyDocuments()));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                              color: happiDark,
                                              borderRadius: BorderRadius.circular(15)),
                                          child: Center(
                                            child: Text(
                                              "Save & Preview",
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => MyDocuments()));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                              color: happiPrimary,
                                              borderRadius: BorderRadius.circular(15)),
                                          child: Center(
                                            child: Text(
                                              "Send to client",
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )));
  }
}

import 'package:flutter/material.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                child: Container(
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
              ),
              Expanded(child: Container(
                child: Image.asset("assets/images/user.png"),
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Icon(Icons.more_horiz_outlined, color: Colors.white, size: 50,),
                  Icon(Icons.people, color: Colors.white,  size: 50,),
                  Icon(Icons.call_end, color: Colors.red,  size: 50,),
                  Icon(Icons.mic, color: Colors.white,  size: 50,),
                  Icon(Icons.videocam_rounded, color: Colors.white,  size: 50,),
                  SizedBox(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

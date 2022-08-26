import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:telephony/telephony.dart';
import 'Utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home());
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const platform = MethodChannel('phone');
    return Scaffold(
      body: Center(
          child: TextButton(
              onPressed: () async {
                Utils.showSnackBar(context, "Sending...");
                sendSMS(context,platform);
              },
              child: Text("Send SMS"))),
    );
  }

  void sendSMS(BuildContext context, MethodChannel platform) {
    Permission.sms.request().then((value) async => {
      /*if (value == PermissionStatus.granted){
        await platform.invokeMethod('sendSMS')}
      else {
        Utils.showSnackBar(context, "The app needs this permission to function please accept it")
      }*/
    });
    Telephony telephony = Telephony.instance;
    telephony.sendSms(to: "+919945922138", message: "Hi from cat");
  }
}

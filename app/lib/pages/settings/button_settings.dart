import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:friend_private/backend/schema/bt_device/bt_device.dart';
import 'package:friend_private/providers/device_provider.dart';
import 'package:friend_private/utils/analytics/intercom.dart';
import 'package:provider/provider.dart';

class ButtonSettings extends StatefulWidget {
  const ButtonSettings({super.key});

  @override
  State<ButtonSettings> createState() => _ButtonSettingsState();
}

class _ButtonSettingsState extends State<ButtonSettings> {
  String? singlePress;
  String? doublePress;
  String? longPress;

  //TODO: Adding "Trigger App Action" and "Custom Commands" as selected options
  final List<String> options = ['Power Off', 'End Active Conversation', 'Mute Microphone']; 

  //TODO: Beuatify the UI
  @override
  Widget build(BuildContext context) {
    return Consumer<DeviceProvider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          title: const Text('Button Settings'),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Text(
                        'Single Press:',
                        style: const TextStyle(color: Colors.white, fontSize: 16)
                        ),
                      DropdownButton<String>(
                        value: singlePress,
                        hint: Text('Choose an option'),
                        onChanged: (String? newValue) {
                          setState(() {
                            singlePress = newValue;
                          });
                        },
                        items: options.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Double Press:',
                        style: const TextStyle(color: Colors.white, fontSize: 16)
                        ),
                      DropdownButton<String>(
                        value: doublePress,
                        hint: Text('Choose an option'),
                        onChanged: (String? newValue) {
                          setState(() {
                            doublePress = newValue;
                          });
                        },
                        items: options.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Long Press:',
                        style: const TextStyle(color: Colors.white, fontSize: 16)
                      ),
                      DropdownButton<String>(
                        value: longPress,
                        hint: Text('Choose an option'),
                        onChanged: (String? newValue) {
                          setState(() {
                            longPress = newValue;
                          });
                        },
                        items: options.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 40)
                    ],
                  ),
                  if (!provider.isConnected)
                    ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 3.0,
                          sigmaY: 3.0,
                        ),
                        child: Container(
                          height: 410,
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              'Connect your device to\naccess these settings',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                height: 1.3,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}

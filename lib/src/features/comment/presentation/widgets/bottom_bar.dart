import 'package:final_task/src/core/constants/constants.dart';
import 'package:flutter/material.dart';

BottomNavigationBar bottomBar(BuildContext context, int current) {
  return BottomNavigationBar(
    currentIndex: current,
    items: [
      BottomNavigationBarItem(
          icon: AppIcons.chat, label: "posts", backgroundColor: Colors.black),
      BottomNavigationBarItem(
          icon: AppIcons.status,
          label: "statues",
          backgroundColor: Colors.black),
      BottomNavigationBarItem(
          icon: AppIcons.groups,
          label: "groups",
          backgroundColor: Colors.black),
      BottomNavigationBarItem(
          icon: AppIcons.calls, label: "calls", backgroundColor: Colors.black),
    ],
    onTap: (value) { },
  );
}

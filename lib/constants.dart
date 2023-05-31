import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/controller/auth_controller.dart';
import 'package:tiktok_clone/views/Screens/add_videos_screen.dart';
import 'package:tiktok_clone/views/Screens/video_screen.dart';

// COLORS
const backgroundColor = Colors.black;
var buttonColor = Colors.red.shade400;
const borderColor = Colors.grey;

// FIREBASE
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

// CONTROLLER
var authController = AuthController.instance;

//PAGES
List pages = [
  VideoScreen(),
  Text('Search Screen'),
  AddVideoScreen(),
  Text('Message Screen'),
  Text('Profile Screen'),
];

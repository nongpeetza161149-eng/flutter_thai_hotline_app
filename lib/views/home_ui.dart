// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/views/travel_ui.dart';
import 'package:flutter_thai_hotline_app/views/emg_ui.dart';
import 'package:flutter_thai_hotline_app/views/bank_ui.dart';
import 'package:flutter_thai_hotline_app/views/pub_ui.dart';
import 'package:flutter_thai_hotline_app/views/about_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
 
class HomeUI extends StatefulWidget {
  const HomeUI({super.key});
 
  @override
  State<HomeUI> createState() => _HomeUIState();
}
 
class _HomeUIState extends State<HomeUI> {
  // สร้างตัวแปรเก็บหมายเลข index ของ BarItem ที่เลือก
  int selectedIndex = 0;
 
  // สร้างตัวแปรประเภท List เก็บหน้าจอ TravelUI, EmgUI, BankUI, PubUI, AboutUI
  List subViewShow = [
    TravelUi(),
    EmgUi(),
    BankUi(),
    PubUi(),
    AboutUi(),
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ส่วนของ AppBar-------------------------------
      appBar: AppBar(
        backgroundColor: Colors.grey[200], // 🛠️ ปรับแก้: เปลี่ยนเป็นสีเทาอ่อนเพื่อให้เข้ากับธีมแอปพลิเคชันดูโมเดิร์นขึ้น
        elevation: 0, // ลบเงาใต้ AppBar ให้แบนเรียบกลืนกับจอ
        title: Text(
          'สายด่วน THAILAND',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutUi(),
                ),
              );
            },
          ),
        ],
        centerTitle: true,
      ),
      // ส่วนของ BottomNavigationBar------------------
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        currentIndex: selectedIndex,
        selectedItemColor: Colors.amber[800], // 🛠️ แนะนำปรับแก้: ใช้สีเด่น (เช่น สีส้ม/เหลือง) สำหรับไอเทมที่เลือก เพื่อให้ผู้ใช้มองเห็นชัดเจน
        unselectedItemColor: Colors.grey[600],
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.travel_explore,
            ),
            label: 'การเดินทาง',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.emergency,
            ),
            label: 'อุบัติเหตุ',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.moneyCheckDollar,
            ),
            label: 'ธนาคาร',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.buildingShield,
            ),
            label: 'สาธารณูปโภค',
          ),
          // 🛠️ แก้ไขหลัก: เพิ่มปุ่มรายการที่ 5 (index 4) ให้ตรงตามขนาด List ในตัวแปร subViewShow
          BottomNavigationBarItem(
            icon: Icon(
              Icons.info,
            ),
            label: 'เกี่ยวกับแอป',
          ),
        ],
      ),
      // ส่วนของ body---------------------------------
      body: subViewShow[selectedIndex],
    );
  }
}

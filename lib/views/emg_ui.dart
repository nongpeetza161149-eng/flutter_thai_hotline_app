// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmgUi extends StatefulWidget {
  const EmgUi({ super.key });

  @override
  State<EmgUi> createState() => _EmgUiState();
}

class _EmgUiState extends State<EmgUi> {
  // ฟังก์ชันโทรออก อยู่ในไฟล์นี้เลย ไม่ต้องพึ่ง phone_launcher.dart
  Future<void> launchPhoneCall(String number) async {
    final Uri uri = Uri(scheme: 'tel', path: number);
    await launchUrl(uri);
  }

  @override
  Widget build( BuildContext context ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: 25.0,
            ),
            color: Colors.white,
            child: Column(
              children: [
                Text(
                  'สายด่วน\nอุบัติเหตุ-เหตุฉุกเฉิน',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 1.2,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: 180.0,
                  height: 180.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      'assets/images/emergency/emg_0.png',
                      fit: BoxFit.cover,
                      errorBuilder: ( context, error, stackTrace ) {
                        return Container(
                          color: Colors.grey[200],
                          child: Icon(
                            Icons.image,
                            size: 60.0,
                            color: Colors.grey[400],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              children: [
                _buildCard( 'เหตุด่วนเหตุร้าย', '191', 'assets/images/emergency/emg_1.png' ),
                _buildCard( 'แจ้งไฟไหม้ สัตว์เข้าบ้าน', '199', 'assets/images/emergency/emg_2.png' ),
                _buildCard( 'สายด่วนรถหาย (ตำรวจแห่งชาติ)', '1192', 'assets/images/emergency/emg_3.png' ),
                _buildCard( 'อุบัติเหตุทางน้ำ', '1196', 'assets/images/emergency/emg_4.png' ),
                _buildCard( 'แจ้งคนหาย', '1300', 'assets/images/emergency/emg_5.png' ),
                _buildCard( 'ศูนย์ปลอดภัยคมนาคม', '1356', 'assets/images/emergency/emg_6.png' ),
                _buildCard( 'หน่วยแพทย์กู้ชีพ', '1554', 'assets/images/emergency/emg_7.png' ),
                _buildCard( 'ศูนย์เอราวัณ', '1646', 'assets/images/emergency/emg_8.png' ),
                _buildCard( 'เจ็บป่วยฉุกเฉิน', '1669', 'assets/images/emergency/emg_9.png' ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard( String title, String number, String imagePath ) {
    return InkWell(
      onTap: () => launchPhoneCall( number ),
      borderRadius: BorderRadius.circular( 16.0 ),
      child: Container(
        margin: EdgeInsets.only(
          bottom: 16.0,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 18.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: Colors.grey[300]!,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8.0,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 70.0,
              height: 70.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: Colors.grey[300]!,
                  width: 1.0,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: ( context, error, stackTrace ) {
                    return Container(
                      color: Colors.grey[100],
                      child: Icon(
                        Icons.image_outlined,
                        color: Colors.grey[500],
                        size: 30.0,
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    number,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.phone_in_talk_outlined,
              color: Colors.grey[700],
              size: 32.0,
            ),
          ],
        ),
      ),
    );
  }
}
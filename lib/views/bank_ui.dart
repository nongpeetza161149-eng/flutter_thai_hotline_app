// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BankUi extends StatefulWidget {
  const BankUi({ super.key });

  @override
  State<BankUi> createState() => _BankUiState();
}

class _BankUiState extends State<BankUi> {
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
                  'สายด่วน\nธนาคาร',
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
                      'assets/images/bank/bank_14.png',
                      fit: BoxFit.cover,
                      errorBuilder: ( context, error, stackTrace ) {
                        return Container(
                          color: Colors.grey[200],
                          child: Icon(
                            Icons.account_balance,
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
                _buildCard( 'ธนาคารกรุงเทพ', '1333' ),
                _buildCard( 'ธนาคารกสิกรไทย', '028888888' ),
                _buildCard( 'ธนาคารไทยพาณิชย์', '027777777' ),
                _buildCard( 'ธนาคารกรุงไทย', '021111111' ),
                _buildCard( 'ธนาคารกรุงศรีอยุธยา', '1572' ),
                _buildCard( 'ธนาคารทหารไทยธนชาต (ttb)', '1428' ),
                _buildCard( 'ธนาคารออมสิน', '1115' ),
                _buildCard( 'ธนาคาร ธ.ก.ส.', '025550555' ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard( String title, String number ) {
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
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: Colors.grey[300]!,
                  width: 1.0,
                ),
              ),
              child: Icon(
                Icons.account_balance,
                color: Colors.grey[600],
                size: 32.0,
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
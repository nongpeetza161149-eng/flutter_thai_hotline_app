// ignore_for_file: use_build_context_synchronously, unused_element, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/views/home_ui.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  @override
  void initState() {
    Future.delayed(
      Duration(
        seconds: 3,
      ),
      () {
        // ตรวจสอบความปลอดภัยของ context ก่อนทำการนำทาง (Navigation)
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeUI(),
            ),
          );
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          // ใช้ความสูงของพื้นที่ใช้งานจริงป้องกันปัญหา RenderFlex Overflow
          final screenHeight = constraints.maxHeight;

          return Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(flex: 3), // 🛠️ ปรับระยะสัดส่วนให้โลโก้อยู่ตรงกลางค่อนบนอย่างสวยงาม
                    Image.asset(
                      'assets/icons/icon.png',
                      width: screenHeight * 0.20,
                      height: screenHeight * 0.20,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: screenHeight * 0.20,
                          height: screenHeight * 0.20,
                          color: Colors.grey[200], // 🛠️ แก้ไข: เปลี่ยนคอนสแตนท์สีให้เรียกเฉดสีเทาตามระบบอย่างถูกต้อง
                          child: Icon(Icons.image_outlined, color: Colors.grey[600]),
                        );
                      },
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      'THAI HOTLINE APP',
                      style: TextStyle(
                        fontSize: screenHeight * 0.035, // ปรับขนาดฟอนต์ให้กระชับพอดีกับหน้าจอมือถือทุกสัดส่วน
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      'สายด่วนไทยแลนด์',
                      style: TextStyle(
                        fontSize: screenHeight * 0.022,
                        color: Colors.grey[600], // ปรับสีข้อความรองให้จางลงเล็กน้อยเพื่อความมีมิติ
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(flex: 2),
                    // 🛠️ สิ่งที่เพิ่มเข้ามา: ใส่ตัวหมุนโหลดข้อมูล (CircularProgressIndicator) เพื่อความสวยงามสมจริงของหน้าเริ่มแอป
                    CircularProgressIndicator(
                      color: Colors.amber, // สีเหลืองทองเข้าชุดกับเมนูในหน้า Home
                      strokeWidth: 3.0,
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

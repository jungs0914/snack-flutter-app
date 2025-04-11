import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snack/naver_authentication/presentation/providers/naver_auth_providers.dart';
import 'package:snack/kakao_authentication/presentation/providers/kakao_auth_providers.dart';
import '../../../google_authentication/presentation/providers/google_auth_providers.dart';
import '../../../home/home_module.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight, // 화면 전체 높이만큼 확보
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 로고
              Image.asset(
                'assets/images/hungle_app_logo.png',
                width: 180,
              ),

              const SizedBox(height: 50),

              // 카카오 로그인 버튼
              Consumer<KakaoAuthProvider>(
                builder: (context, kakaoProvider, child) {
                  return GestureDetector(
                    onTap: kakaoProvider.isLoading
                        ? null
                        : () async {
                      await kakaoProvider.login();
                      if (kakaoProvider.isLoggedIn) {
                        Navigator.pushReplacement(
                          context,
                          HomeModule.getHomeRoute(loginType: "Kakao"),
                        );
                      }
                    },
                    child: Image.asset(
                      'assets/images/kakao_login.png',
                      width: 200,
                      height: 50,
                      fit: BoxFit.fill,
                    ),
                  );
                },
              ),

              const SizedBox(height: 10),

              // 네이버 로그인 버튼
              Consumer<NaverAuthProvider>(
                builder: (context, naverProvider, child) {
                  return GestureDetector(
                    onTap: naverProvider.isLoading
                        ? null
                        : () async {
                      await naverProvider.login();
                      if (naverProvider.isLoggedIn) {
                        Navigator.pushReplacement(
                          context,
                          HomeModule.getHomeRoute(loginType: "Naver"),
                        );
                      }
                    },
                    child: Image.asset(
                      'assets/images/naver_login.png',
                      width: 200,
                      height: 50,
                      fit: BoxFit.fill,
                    ),
                  );
                },
              ),

              const SizedBox(height: 10),

              // 구글 로그인 버튼
              Consumer<GoogleAuthProvider>(
                builder: (context, googleProvider, child) {
                  return GestureDetector(
                    onTap: googleProvider.isLoading
                        ? null
                        : () async {
                      await googleProvider.login();
                      if (googleProvider.isLoggedIn) {
                        Navigator.pushReplacement(
                          context,
                          HomeModule.getHomeRoute(loginType: "Google"),
                        );
                      }
                    },
                    child: Image.asset(
                      'assets/images/google_login.png',
                      width: 200,
                      height: 50,
                      fit: BoxFit.fill,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

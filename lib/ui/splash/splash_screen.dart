import 'package:flutter/material.dart';
import 'package:approve_payment_flow/ui/theme/theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: BrandColors.primaryNavy,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.verified_user_rounded,
              size: 72,
              color: BrandColors.emerald,
            ),
            SizedBox(height: 24),
            Text(
              'Approve Payment Flow',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'High-Security Payment Authorization',
              style: TextStyle(
                fontSize: 14,
                color: BrandColors.textSecondary,
              ),
            ),
            SizedBox(height: 32),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(BrandColors.emerald),
            ),
          ],
        ),
      ),
    );
  }
}

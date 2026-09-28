import 'package:flutter/material.dart';
import 'package:approve_payment_flow/ui/theme/theme.dart';

class ApprovalsScreen extends StatelessWidget {
  const ApprovalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pending Approvals',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: BrandColors.emerald.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle_outline_rounded,
                  color: BrandColors.emerald,
                  size: 38,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'No Pending Approvals',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: BrandColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'All payment disbursements are currently up to date.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: BrandColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

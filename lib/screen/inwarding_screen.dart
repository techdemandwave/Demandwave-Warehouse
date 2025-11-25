import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../widgets/custom_screen_related.dart';

class InwardingScreen extends StatefulWidget {
  const InwardingScreen({super.key});
  static String route = 'route';

  @override
  State<InwardingScreen> createState() => _InwardingScreenState();
}

class _InwardingScreenState extends State<InwardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Inwarding', context: context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [_asnCard(), _asnCard()]),
        ),
      ),
    );
  }

  Widget _asnCard() {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 2),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(
          color: AppColors.getMaterialColorFromColor(AppColors.purple).shade500,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [appText('ASN NO'), appText('MRP')],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [appText('SKU NAME'), appText('EXPIRY')],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [appText('BATCH'), appText('GTX'), appText('PO NO')],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border: Border.all(
                    color: AppColors.getMaterialColorFromColor(
                      AppColors.green,
                    ).shade500,
                  ),
                ),
                child: appText('Start ASN', fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

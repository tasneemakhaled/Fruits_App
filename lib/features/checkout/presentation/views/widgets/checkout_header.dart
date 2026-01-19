import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/address_widget.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/payment_widget.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/time_widget.dart';

class CheckoutHeader extends StatefulWidget {
  const CheckoutHeader({super.key});

  @override
  State<CheckoutHeader> createState() => _CheckoutHeaderState();
}

class _CheckoutHeaderState extends State<CheckoutHeader> {
  int currentPage = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  void _navigateToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _goToNextPage() {
    if (currentPage < 2) {
      _navigateToPage(currentPage + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header مع الدوائر والخطوط
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // دايرة Time
              InkWell(
                onTap: () => _navigateToPage(0),
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: 2),
                  ),
                  child: Center(
                    child: Container(
                      width: currentPage == 0 ? 8 : 0,
                      height: currentPage == 0 ? 8 : 0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              DottedLine(
                dashColor: Colors.grey,
                dashGapLength: 3,
                dashLength: 8,
                lineLength: 130,
                direction: Axis.horizontal,
              ),
              // دايرة Address
              InkWell(
                onTap: () => _navigateToPage(1),
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: 2),
                  ),
                  child: Center(
                    child: Container(
                      width: currentPage == 1 ? 8 : 0,
                      height: currentPage == 1 ? 8 : 0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              DottedLine(
                dashColor: Colors.grey,
                dashGapLength: 3,
                dashLength: 8,
                lineLength: 130,
                direction: Axis.horizontal,
              ),
              // دايرة Payment
              InkWell(
                onTap: () => _navigateToPage(2),
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: 2),
                  ),
                  child: Center(
                    child: Container(
                      width: currentPage == 2 ? 8 : 0,
                      height: currentPage == 2 ? 8 : 0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // PageView للصفحات
        Expanded(
          child: PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            physics: NeverScrollableScrollPhysics(),
            children: [
              TimeWidget(onContinue: _goToNextPage),
              AddressWidget(onContinue: _goToNextPage),
              PaymentWidget(onContinue: _goToNextPage),
            ],
          ),
        ),
      ],
    );
  }
}

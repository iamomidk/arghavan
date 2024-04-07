import 'package:flutter/material.dart';

class NewEvent extends StatelessWidget {
  const NewEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildInfoCard(context),
        buildRecordCard(context),
        buildExportCard(context),
      ],
    );
  }

  Widget buildInfoCard(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 1 / 3.2,
      child: Card.filled(
        shadowColor: const Color(0x29000000),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        color: Colors.white,
        child: buildInfoTextInputs(),
      ),
    );
  }

  Widget buildInfoTextInputs() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff0a2c5e),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                child: Text(
                  'واردکردن از گوگل',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Sahel',
                  ),
                ),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 8.0,
                  ),
                  child: Divider(
                    height: 1.0,
                    color: Color(0xff707070),
                  ),
                ),
              ),
              Text(
                'اطلاعات',
                style: TextStyle(
                  color: Color(0xff707070),
                  fontSize: 18,
                  fontFamily: 'Sahel',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        buildInfoTextInput('سفارش دهنده', TextEditingController()),
        buildInfoTextInput('عنوان برنامه', TextEditingController()),
        buildInfoTextInput('تاریخ برگزاری', TextEditingController()),
        buildMultipleInfoTextInput(
          'ساعت',
          TextEditingController(),
          TextEditingController(),
        ),
        buildInfoTextInput('مکان', TextEditingController()),
        buildInfoTextInput('مسئول', TextEditingController()),
        buildInfoTextInput('شماره تماس', TextEditingController()),
        buildInfoTextInput('توضیحات', TextEditingController()),
      ],
    );
  }

  Widget buildInfoTextInput(String title, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                cursorColor: const Color(0xff0a2c5e),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xffefefef).withOpacity(0.75),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Color(0xff707070),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 128,
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xff707070),
                fontSize: 18,
                fontFamily: 'Sahel',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMultipleInfoTextInput(
    String title,
    TextEditingController controller1,
    TextEditingController controller2,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controller1,
                      cursorColor: const Color(0xff0a2c5e),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffefefef).withOpacity(0.75),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(
                            color: Color(0xff707070),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Flexible(
                  flex: 1,
                  child: Text(
                    'الی',
                    style: TextStyle(
                      color: Color(0xff707070),
                      fontSize: 16,
                      fontFamily: 'Sahel',
                    ),
                  ),
                ),
                Flexible(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controller2,
                      cursorColor: const Color(0xff0a2c5e),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffefefef).withOpacity(0.75),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(
                            color: Color(0xff707070),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 128,
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xff707070),
                fontSize: 18,
                fontFamily: 'Sahel',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRecordCard(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 1 / 3.2,
      child: Card.filled(
        shadowColor: const Color(0x29000000),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        color: Colors.white,
        child: buildRecordTextInputs(),
      ),
    );
  }

  Widget buildRecordTextInputs() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff0a2c5e),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                child: Text(
                  'واردکردن از گوگل',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Sahel',
                  ),
                ),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 8.0,
                  ),
                  child: Divider(
                    height: 1.0,
                    color: Color(0xff707070),
                  ),
                ),
              ),
              Text(
                'اطلاعات',
                style: TextStyle(
                  color: Color(0xff707070),
                  fontSize: 18,
                  fontFamily: 'Sahel',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        buildRecordTextInput('سفارش دهنده', TextEditingController()),
        buildRecordTextInput('عنوان برنامه', TextEditingController()),
        buildRecordTextInput('تاریخ برگزاری', TextEditingController()),
        buildMultipleRecordTextInput(
          'ساعت',
          TextEditingController(),
          TextEditingController(),
        ),
        buildRecordTextInput('مکان', TextEditingController()),
        buildRecordTextInput('مسئول', TextEditingController()),
        buildRecordTextInput('شماره تماس', TextEditingController()),
        buildRecordTextInput('توضیحات', TextEditingController()),
      ],
    );
  }

  Widget buildRecordTextInput(String title, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                cursorColor: const Color(0xff0a2c5e),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xffefefef).withOpacity(0.75),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Color(0xff707070),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 128,
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xff707070),
                fontSize: 18,
                fontFamily: 'Sahel',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMultipleRecordTextInput(
    String title,
    TextEditingController controller1,
    TextEditingController controller2,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controller1,
                      cursorColor: const Color(0xff0a2c5e),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffefefef).withOpacity(0.75),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(
                            color: Color(0xff707070),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Flexible(
                  flex: 1,
                  child: Text(
                    'الی',
                    style: TextStyle(
                      color: Color(0xff707070),
                      fontSize: 16,
                      fontFamily: 'Sahel',
                    ),
                  ),
                ),
                Flexible(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controller2,
                      cursorColor: const Color(0xff0a2c5e),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffefefef).withOpacity(0.75),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(
                            color: Color(0xff707070),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 128,
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xff707070),
                fontSize: 18,
                fontFamily: 'Sahel',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildExportCard(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 1 / 3.2,
      child: Card.filled(
        shadowColor: const Color(0x29000000),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        color: Colors.white,
        child: buildExportTextInputs(),
      ),
    );
  }

  Widget buildExportTextInputs() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff0a2c5e),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                child: Text(
                  'واردکردن از گوگل',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Sahel',
                  ),
                ),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 8.0,
                  ),
                  child: Divider(
                    height: 1.0,
                    color: Color(0xff707070),
                  ),
                ),
              ),
              Text(
                'اطلاعات',
                style: TextStyle(
                  color: Color(0xff707070),
                  fontSize: 18,
                  fontFamily: 'Sahel',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        buildExportTextInput('سفارش دهنده', TextEditingController()),
        buildExportTextInput('عنوان برنامه', TextEditingController()),
        buildExportTextInput('تاریخ برگزاری', TextEditingController()),
        buildMultipleExportTextInput(
          'ساعت',
          TextEditingController(),
          TextEditingController(),
        ),
        buildExportTextInput('مکان', TextEditingController()),
        buildExportTextInput('مسئول', TextEditingController()),
        buildExportTextInput('شماره تماس', TextEditingController()),
        buildExportTextInput('توضیحات', TextEditingController()),
      ],
    );
  }

  Widget buildExportTextInput(String title, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                cursorColor: const Color(0xff0a2c5e),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xffefefef).withOpacity(0.75),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Color(0xff707070),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 128,
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xff707070),
                fontSize: 18,
                fontFamily: 'Sahel',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMultipleExportTextInput(
    String title,
    TextEditingController controller1,
    TextEditingController controller2,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controller1,
                      cursorColor: const Color(0xff0a2c5e),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffefefef).withOpacity(0.75),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(
                            color: Color(0xff707070),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Flexible(
                  flex: 1,
                  child: Text(
                    'الی',
                    style: TextStyle(
                      color: Color(0xff707070),
                      fontSize: 16,
                      fontFamily: 'Sahel',
                    ),
                  ),
                ),
                Flexible(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controller2,
                      cursorColor: const Color(0xff0a2c5e),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffefefef).withOpacity(0.75),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(
                            color: Color(0xff707070),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 128,
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xff707070),
                fontSize: 18,
                fontFamily: 'Sahel',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

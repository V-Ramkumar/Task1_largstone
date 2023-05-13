import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:task1/Database/DatabaseModel/MarketModel.dart';
import 'package:task1/Database/DbHelper.dart';
import 'package:task1/Screens/HomeScreen.dart';
import 'package:task1/Utils/Appwidgets.dart';

import '../Utils/Colors.dart';
import '../Utils/Strings.dart';


class Createlead extends StatefulWidget {
  const Createlead({Key? key}) : super(key: key);

  @override
  State<Createlead> createState() => _CreateleadState();
}

class _CreateleadState extends State<Createlead> {
  final TextEditingController leadIdController = TextEditingController();
  final TextEditingController customerNameController = TextEditingController();
  final TextEditingController managedbyController = TextEditingController();
  final TextEditingController customerType = TextEditingController();
  final TextEditingController entryDateController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  void dispose() {
    leadIdController.dispose();
    customerNameController.dispose();
    managedbyController.dispose();
    customerType.dispose();
    entryDateController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Appcolors.primaryColor, // header background color
              // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Appcolors.primaryColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      helpText: "Select Date",
      firstDate: DateTime.now().subtract(const Duration(days: 0)),
      lastDate: DateTime(2035),
      context: context,
      initialDate: selectedDate,
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        String formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
        entryDateController.text = formattedDate;
        // StorageUtil.instance.setStringValue(StringConstants.Date, _dateController.text.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 60),
        child: AppBar(
          backgroundColor: Appcolors.primaryColor,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Appcolors.primaryColor,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const HomeScreen()));
                },
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Appcolors.cardColor,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                Strings.Createlead,
              ),
              const Spacer(flex: 1),
              const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WillPopScope(
          onWillPop:onbackPress ,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const SizedBox(width: 10,),
                        Text(
                          "* Lead Form",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: TextField(
                              decoration: const InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  contentPadding: EdgeInsets.only(left: 15),
                                  hintText: 'Lead ID',
                                  hintStyle: TextStyle(color: Colors.grey)),
                              controller: leadIdController,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: TextField(
                              controller: customerNameController,
                              decoration: const InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  contentPadding: EdgeInsets.only(left: 15),
                                  hintText: 'Lead /Customer Name',
                                  hintStyle: TextStyle(color: Colors.grey)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: TextField(
                              controller: managedbyController,
                              decoration: const InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  contentPadding: EdgeInsets.only(left: 15),
                                  hintText: 'Address',
                                  hintStyle: TextStyle(color: Colors.grey)),
                            ),
                          ),
                        ),
                         Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: TextField(
                              controller: customerType,
                              decoration: const InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  contentPadding: EdgeInsets.only(left: 15),
                                  hintText: 'Lead / Customer Type',
                                  hintStyle: TextStyle(color: Colors.grey)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: TextField(
                              controller: entryDateController,
                              onTap: () {
                                _selectDate(context);
                              },
                              decoration: InputDecoration(
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    _selectDate(context);
                                  },
                                  icon: const Icon(
                                    Icons.date_range_sharp,
                                    color: Colors.black,
                                  ),
                                ),
                                contentPadding:
                                    const EdgeInsets.only(left: 15, top: 15),
                                hintText: 'Entry date',
                                hintStyle: const TextStyle(color: Colors.grey),
                              ),
                              readOnly: true,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            createAndSave();
                          });
                        },
                        child: const Text("Create"),
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(110, 40),
                            backgroundColor: Appcolors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void createAndSave() async {
    DatabaseHelper helper = DatabaseHelper.instance;
    if (leadIdController.text.isEmpty &
        customerNameController.text.isEmpty &
        managedbyController.text.isEmpty &
        customerType.text.isEmpty &
        entryDateController.text.isEmpty) {
      AppWidgets().showErrorToastMsg("All the fields is Required");
    } else if (leadIdController.text.isEmpty) {
      AppWidgets().showErrorToastMsg("Lead Id is Required");
    } else if (customerNameController.text.isEmpty) {
      AppWidgets().showErrorToastMsg("CustomerName is required");
    } else if (managedbyController.text.isEmpty) {
      AppWidgets().showErrorToastMsg("managedBy is required");
    } else if (customerType.text.isEmpty) {
      AppWidgets().showErrorToastMsg("CustomerType is Required");
    } else if (entryDateController.text.isEmpty) {
      AppWidgets().showErrorToastMsg("Date is required");
    } else {
      MarketModel model = MarketModel(
          leadId: leadIdController.text,
          customerName: customerNameController.text,
          managedBy: managedbyController.text,
          customerType: customerType.text,
          date: entryDateController.text);
      await helper.insert(model).then((value) => {
            if (value != 0)
              {
                setState(() {
                  AppWidgets().showSuccessToastMsg(
                      "Lead Created Successfully", context);
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const HomeScreen()));
                }),
              }
            else
              {
                AppWidgets().showSuccessToastMsg("Something Wrong", context),
              }
          });
    }

  }

  Future<bool>onbackPress()async {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const HomeScreen()));
    return true;
  }


}

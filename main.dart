import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoperone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const RegisterScreen(),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  // Initial Selected Value
  String dropdownvalue = 'Female';   
  
  // List of items in our dropdown menu
  var genders = [    
    'Female',
    'Male',
    'Prefer Not to Say'
  ];

  DateTime _birthday = DateTime.now();

  Future<void> _selectDate(context) async {
    final DateTime? datePicked = await showDatePicker(
      context: context,
      initialDate: _birthday,
      firstDate: DateTime(1950, 8),
      lastDate: DateTime.now(),
    );

    if (datePicked != null && datePicked != _birthday) {
      setState(() => _birthday = datePicked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "SHOPerone",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold
              ),
            ),
            Form(
              child: Container(
                margin: const EdgeInsets.only(left: 5, top: 20, right: 5),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 7, bottom: 5),
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "First name",
                            style: TextStyle(
                              color: Color.fromRGBO(89, 89, 89, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            prefixStyle: const TextStyle(fontWeight: FontWeight.bold),
                            hintText: "e.g Juanita",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.redAccent,
                              ),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.redAccent,
                              ),
                            ),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 229, 229, 229),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 12.0,
                              horizontal: 12.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15.0),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 7, bottom: 5),
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Last name",
                            style: TextStyle(
                              color: Color.fromRGBO(89, 89, 89, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            prefixStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            hintText: "e.g Dela Cruz",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.redAccent,
                              ),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.redAccent,
                              ),
                            ),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 229, 229, 229),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 12.0,
                              horizontal: 12.0,
                            ),
                          )
                        ),
                      ],
                    ),

                    _buildBirthday(),

                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 7, bottom: 5),
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Age",
                            style: TextStyle(
                              color: Color.fromRGBO(89, 89, 89, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            prefixStyle: const TextStyle(fontWeight: FontWeight.bold),
                            hintText: "e.g 19",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.redAccent,
                              ),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.redAccent,
                              ),
                            ),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 229, 229, 229),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 12.0,
                              horizontal: 12.0,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 7, bottom: 5),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Email",
                              style: TextStyle(
                                color: Color.fromRGBO(89, 89, 89, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              prefixStyle: const TextStyle(fontWeight: FontWeight.bold),
                              hintText: "example@gmail.com",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              focusedErrorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.redAccent,
                                ),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.redAccent,
                                ),
                              ),
                              filled: true,
                              fillColor: const Color.fromARGB(255, 229, 229, 229),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 12.0,
                                horizontal: 12.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Column(
                        children: [
                          const Center(
                            child: Text(
                              "Gender",
                              style: TextStyle(
                                color: Color.fromRGBO(89, 89, 89, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          DropdownButton(
                          
                          // Initial Value
                          value: dropdownvalue,
                            
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),    
                            
                          // Array list of items
                          items: genders.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) { 
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            

            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InputBodyMeasurementsScreen()),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 50),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(159, 156, 150, 1),
                  borderRadius: BorderRadius.circular(8.0)
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text("Sign In", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBirthday() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 7, bottom: 5),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Birthday",
              style: TextStyle(
                color: Color.fromRGBO(89, 89, 89, 1),
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => _selectDate(context),
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 229, 229, 229)
              ),
              padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 5),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "${_birthday.month}",
                              ),
                              const Text(" / "),
                              Text(
                                "${_birthday.day}",
                              ),
                              const Text(" / "),
                              Text(
                                "${_birthday.year}",
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                ],
              )
            ),
          ),
        ],
      ),
    );
  }
}

class InputBodyMeasurementsScreen extends StatefulWidget {
  const InputBodyMeasurementsScreen({super.key});

  @override
  State<InputBodyMeasurementsScreen> createState() => _InputBodyMeasurementsScreenState();
}

class _InputBodyMeasurementsScreenState extends State<InputBodyMeasurementsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Input your body measurements",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
                
                _heightBuilder(),
                _weightBuilder(),
                _armBuilder(),
                _shoulderBuilder(),
                _chestBuilder(),
                _waistBuilder(),
                _hipsBuilder(),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MeasuringGuide()),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 50),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 177, 177, 177),
                        borderRadius: BorderRadius.circular(8.0)
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text("CLICK FOR MEASURING GUIDE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ]
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TopBrandsScreen()),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 50),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(159, 156, 150, 1),
                        borderRadius: BorderRadius.circular(8.0)
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text("DONE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ]
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _heightBuilder() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 7, bottom: 5),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Height",
                    style: TextStyle(
                      color: Color.fromRGBO(89, 89, 89, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    prefixStyle: const TextStyle(fontWeight: FontWeight.bold),
                    hintText: "e.g. 165 cm",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.redAccent,
                      ),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.redAccent,
                      ),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 229, 229, 229),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 12.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _weightBuilder() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 7, bottom: 5),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Weight",
                    style: TextStyle(
                      color: Color.fromRGBO(89, 89, 89, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    prefixStyle: const TextStyle(fontWeight: FontWeight.bold),
                    hintText: "e.g. 173 pounds",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.redAccent,
                      ),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.redAccent,
                      ),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 229, 229, 229),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 12.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _armBuilder() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 7, bottom: 5),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Arm",
                    style: TextStyle(
                      color: Color.fromRGBO(89, 89, 89, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    prefixStyle: const TextStyle(fontWeight: FontWeight.bold),
                    hintText: "e.g. 173 pounds",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.redAccent,
                      ),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.redAccent,
                      ),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 229, 229, 229),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 12.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _shoulderBuilder() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 7, bottom: 5),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Shoulder",
                    style: TextStyle(
                      color: Color.fromRGBO(89, 89, 89, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    prefixStyle: const TextStyle(fontWeight: FontWeight.bold),
                    hintText: "e.g. 173 pounds",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.redAccent,
                      ),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.redAccent,
                      ),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 229, 229, 229),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 12.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _chestBuilder() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 7, bottom: 5),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Chest",
                    style: TextStyle(
                      color: Color.fromRGBO(89, 89, 89, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    prefixStyle: const TextStyle(fontWeight: FontWeight.bold),
                    hintText: "e.g. 173 pounds",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.redAccent,
                      ),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.redAccent,
                      ),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 229, 229, 229),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 12.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _waistBuilder() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 7, bottom: 5),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Waist",
                    style: TextStyle(
                      color: Color.fromRGBO(89, 89, 89, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    prefixStyle: const TextStyle(fontWeight: FontWeight.bold),
                    hintText: "e.g. 173 pounds",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.redAccent,
                      ),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.redAccent,
                      ),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 229, 229, 229),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 12.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _hipsBuilder() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 7, bottom: 5),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Hips",
                    style: TextStyle(
                      color: Color.fromRGBO(89, 89, 89, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    prefixStyle: const TextStyle(fontWeight: FontWeight.bold),
                    hintText: "e.g. 173 pounds",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.redAccent,
                      ),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.redAccent,
                      ),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 229, 229, 229),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 12.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MeasuringGuide extends StatelessWidget {
  const MeasuringGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Quick & easy way to measure yourself!",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),

                Container(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      info(
                        context,
                        "Height",
                        "Stand straight with your feet together. Begin at the top of your head and pull the tape measure straight down to the floor!"
                      ),
                      info(
                        context,
                        "Arm",
                        "Measure circumference of your arm. Wrap the tape measure around the widest part of upper arm from front to back and around!"
                      ),
                      info(
                        context,
                        "Shoulder",
                        "Place measuring tape at the boniest art of your shoulder, straight across your back, to the same point on the other shoulder!"
                      ),
                      info(
                        context,
                        "Chest",
                        "Measure at the fullest part of your bust/pecs and wrap it around!"
                      ),
                      info(
                        context,
                        "Waist",
                        "Measure the circumference of your natural waistline, located above belly button & below your rib cage, and wrap it around! Don't suck in!"
                      ),
                      info(
                        context,
                        "Hips",
                        "Stand with your feet together. Measure around the fullest part of the hips and rear. Tape should brush across both hipbones!"
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 50),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 177, 177, 177),
                        borderRadius: BorderRadius.circular(8.0)
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text("GO BACK", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ]
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget info(BuildContext context, String title, String desc) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title: ",
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Text(desc)
          )
        ],
      ),
    );
  }
}

class TopBrandsScreen extends StatefulWidget {
  const TopBrandsScreen({super.key});

  @override
  State<TopBrandsScreen> createState() => _TopBrandsScreenState();
}

class _TopBrandsScreenState extends State<TopBrandsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Select your top 3 brands",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 40,
                    crossAxisSpacing: 40,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.black
                        ),
                        child: Image.asset('assets/hm-logo.png', fit: BoxFit.cover),
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3)
                        ),
                        child: Image.asset('assets/gap-logo.png', fit: BoxFit.cover),
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: const Color.fromRGBO(0, 1, 1, 1)
                        ),
                        child: Image.asset('assets/zara-logo.png', fit: BoxFit.contain),
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3)
                        ),
                        child: Image.asset('assets/forever21-logo.jpg', fit: BoxFit.cover),
                      ),  
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: const Color.fromARGB(255, 133, 133, 133)
                        ),
                        child: Image.asset('assets/topshop-logo.png', fit: BoxFit.cover),
                      ),
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3)
                        ),
                        child: Image.asset('assets/uniqlo-logo.png', fit: BoxFit.cover),
                      ),
                    ],
                  ),
                ),

                GestureDetector(
                  onTap: () => Navigator.pushAndRemoveUntil<void>(
                    context,
                    MaterialPageRoute<void>(builder: (BuildContext context) => const Home()),
                    (_) => false
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 50),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(159, 156, 150, 1),
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text("DONE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ]
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  int _selectedIndex = 0;

  void _onItemTapped(int index) {

    if (index == 2) {
      Navigator.push(context, MaterialPageRoute<void>(builder: (BuildContext context) => const OnMe()));

      return;
    }

    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SHOPerone'),
        backgroundColor: const Color.fromRGBO(255, 215, 215, 215),
        titleTextStyle: const TextStyle(
          color: Color.fromRGBO(34, 34, 34, 1),
          fontWeight: FontWeight.bold,
          fontSize: 35
        ),
        elevation: 0,
        toolbarHeight: 120,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Offstage(
                offstage: _selectedIndex != 0,
                child: TickerMode(
                  enabled: _selectedIndex == 1,
                  child: const HomeIndex(),
                ),
              ),
              Offstage(
                offstage: _selectedIndex != 3,
                child: TickerMode(
                  enabled: _selectedIndex == 4,
                  child: const FitMe(),
                ),
              ),
            ],
          ),
        ),
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'On Me!',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_num),
            label: 'Fit Me!',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.black38,
        selectedItemColor: Colors.black87,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeIndex extends StatelessWidget {
  const HomeIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width, 
              height: MediaQuery.of(context).size.height / 2.4,
              child: Image.asset('assets/model1.jpg', fit: BoxFit.cover),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: const BoxDecoration(
                    color: Colors.white
                  ),
                  child: const Text(
                    "SUGGESTED BRANDS",
                    style: TextStyle(
                      color:Color.fromRGBO(159, 156, 150, 1),
                      fontSize: 21
                    )
                  ),
                ),
              ),
            )
          ],
        ),
        Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width, 
              height: MediaQuery.of(context).size.height / 2.4,
              child: Image.asset('assets/model2.jpg', fit: BoxFit.cover),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: const BoxDecoration(
                    color: Colors.white
                  ),
                  child: const Text(
                    "NEW ARRIVALS",
                    style: TextStyle(
                      color:Color.fromRGBO(159, 156, 150, 1),
                      fontSize: 21
                    )
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class OnMe extends StatefulWidget {
  const OnMe({super.key});

  @override
  State<OnMe> createState() => _OnMeState();
}

class _OnMeState extends State<OnMe> {

  late List<CameraDescription> cameras;
  late CameraController _controller;

  @override
  void initState() {
    super.initState();

    startCamera();
  } 

  @override
  Widget build(BuildContext context) {
    if (_controller.value.isInitialized) {
      return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              CameraPreview(_controller),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 70,
                    height: 70,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white
                    ),
                    child: const Text(
                      "ON ME!",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold)
                    ),
                  ),
                )
              )
            ],
          ),
        )
      );
    }

    return const Scaffold(
      body: Text("LOADING...")
    );
  }

  void startCamera() async {
    cameras = await availableCameras();

    _controller = CameraController(
      cameras[0],
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.yuv420,
    );

    await _controller.initialize().then((value) {
      if (!mounted) {
        return;
      }

      setState(() {});
    }).catchError((e) => print(e));
  }
}

class FitMe extends StatefulWidget {
  const FitMe({super.key});

  @override
  State<FitMe> createState() => _FitMeState();
}

class _FitMeState extends State<FitMe> {

  bool onChecking = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              prefixStyle: const TextStyle(fontWeight: FontWeight.bold),
              hintText: "Search",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none,
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.redAccent,
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.redAccent,
                ),
              ),
              filled: true,
              fillColor: const Color.fromARGB(255, 229, 229, 229),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 12.0,
              ),
              suffixIcon: const Icon(Icons.search)
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: GestureDetector(
            onTap: () => setState(() => onChecking = true),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 234, 234, 234),
                borderRadius: BorderRadius.circular(5)
              ),
              child: Row(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3)
                    ),
                    child: Image.asset('assets/zara-logo.png', fit: BoxFit.cover),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Zara", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  )
                ],
              )
            ),
          ),
        ),

        !onChecking
          ? const SizedBox()
          : Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Text("ZARA SIZE CHART", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      size("SIZE", "XS", "S", "M", "L", "XL"),
                            size("BUST", "33", "35", "37", "40", "43"),
                            size("WAIST", "25.5", "27.5", "29.5", "32.5", "35.5"),
                            size("HIP", "35.5", "37.5", "39.5", "42.5", "45.5"),
                    ],
                  ),
                )
              ],
            ),
          )

      ],
    );
  }

  Widget size(String title, String inf1, String inf2, String inf3, String inf4, String inf5) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(inf1, style: TextStyle(fontSize: 18)),
                Text(inf2, style: TextStyle(fontSize: 18)),
                Text(inf3, style: TextStyle(fontSize: 18)),
                Text(inf4, style: TextStyle(fontSize: 18)),
                Text(inf5, style: TextStyle(fontSize: 18)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
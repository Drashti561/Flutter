import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  bool ssc = false;
  bool hsc = false;
  bool graduate = false;

  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  String gender = "Male";
  String city = "Rajkot";
  double height = 160;
  DateTime? dob;

  // Date Picker
  Future<void> selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2005),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        dob = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registration")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            // Username
            TextField(
              controller: name,
              decoration: const InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // Email
            TextField(
              controller: email,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // Password
            TextField(
              controller: password,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // Confirm Password
            TextField(
              controller: confirmPassword,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Confirm Password",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // Qualification
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Qualification",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            CheckboxListTile(
              title: const Text("SSC"),
              value: ssc,
              onChanged: (value) {
                setState(() {
                  ssc = value!;
                });
              },
            ),

            CheckboxListTile(
              title: const Text("HSC"),
              value: hsc,
              onChanged: (value) {
                setState(() {
                  hsc = value!;
                });
              },
            ),

            CheckboxListTile(
              title: const Text("Graduate"),
              value: graduate,
              onChanged: (value) {
                setState(() {
                  graduate = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            // Gender
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Gender",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            RadioListTile(
              title: const Text("Male"),
              value: "Male",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),

            RadioListTile(
              title: const Text("Female"),
              value: "Female",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),

            // Height
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Height: ${height.toInt()} cm",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Slider(
              value: height,
              min: 100,
              max: 220,
              divisions: 120,
              label: "${height.toInt()} cm",
              onChanged: (value) {
                setState(() {
                  height = value;
                });
              },
            ),

            // City
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "City",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            DropdownButtonFormField<String>(
              value: city,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              items: const [
                DropdownMenuItem(value: "Rajkot", child: Text("Rajkot")),
                DropdownMenuItem(value: "Ahmedabad", child: Text("Ahmedabad")),
                DropdownMenuItem(value: "Vadodara", child: Text("Vadodara")),
                DropdownMenuItem(value: "Surat", child: Text("Surat")),
              ],
              onChanged: (value) {
                setState(() {
                  city = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            // Height
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Height: ${height.toInt()} cm",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Slider(
              value: height,
              min: 100,
              max: 220,
              divisions: 120,
              label: "${height.toInt()} cm",
              onChanged: (value) {
                setState(() {
                  height = value;
                });
              },
            ),

            const SizedBox(height: 20),

            // Date of Birth
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Date of Birth",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: Text(
                    dob == null
                        ? "Select Date"
                        : "${dob!.day}/${dob!.month}/${dob!.year}",
                    style: const TextStyle(fontSize: 16),
                  ),
                ),

                ElevatedButton(
                  onPressed: selectDate,
                  child: const Text("SELECT DATE"),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  print("Username: ${name.text}");
                  print("Email: ${email.text}");
                  print("Password: ${password.text}");
                  print("Confirm Password: ${confirmPassword.text}");

                  print("SSC: $ssc");
                  print("HSC: $hsc");
                  print("Graduate: $graduate");

                  print("Gender: $gender");
                  print("City: $city");
                  print("Height: ${height.toInt()} cm");

                  if (dob != null) {
                    print(
                      "Date of Birth: "
                      "${dob!.day}/${dob!.month}/${dob!.year}",
                    );
                  }
                },
                child: const Text("SUBMIT"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

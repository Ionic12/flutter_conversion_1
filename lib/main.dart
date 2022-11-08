import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var items = ['Kelvin', 'Reamur'];

  double _celcius = 0;
  double _kelvin = 0;
  double _reamur = 0;
  TextEditingController inputCelsius = TextEditingController();

  konversi() {
    setState(() {
      _celcius = double.parse(inputCelsius.text);
      _kelvin = 273.15 + _celcius;
      _reamur = 4 / 5 * _celcius;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konversi Suhu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Konversi Suhu'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Container(child: input()),
                    Container(
                      margin: const EdgeInsets.only(top: 15.0),
                      child: output(),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: submit(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  input() {
    // bagian ini adalah bagian input text dengan satuan celcius yang nantinya akan dikonversi menjadi reamur dan kelvin sesuai dengan rumus konversi suhu
    // bagian keyboardtype menggunakan type number dan inputformatters menggunakan digitonly agar inputan user hanya berupa angka
    return TextFormField(
      controller: inputCelsius,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        hintText: 'Masukan Suhu Dalam Celcius',
      ),
    );
  }

  output() {
    // output disini nilainya akan berubah karena text yang ditampilkan merupakan sebuah variabel
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              const Text('Suhu dalam Kelvin',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.center),
              const SizedBox(height: 20),
              Text(
                "$_kelvin",
                style: const TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              const Text(
                'Suhu dalam Reamur',
                style: TextStyle(fontSize: 17),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                "$_reamur",
                style: const TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ],
    );
  }

  submit() {
    // button submit disini akan menjalankan method konversi yang nantinya akan mengambil nilai input dari textform
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          child: const Text('Conversion'),
          onPressed: () => konversi(),
        ));
  }
}

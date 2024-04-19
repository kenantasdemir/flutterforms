import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int _aktifStep = 0;
  String isim = '', kartNo = '', tarih = '',cvv = "";
  List<Step> tumStepler = [];
  bool hata = false;

  var key0 = GlobalKey<FormFieldState>();
  var key1 = GlobalKey<FormFieldState>();
  var key2 = GlobalKey<FormFieldState>();
  var key3 = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    tumStepler = _tumStepler();

    return Scaffold(
      appBar: AppBar(
        title: Text('Stepper Örnek'),
      ),
      body: SingleChildScrollView(
        child: Stepper(
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Row(
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                  onPressed: details.onStepContinue,
                  child: const Text('Devamm!'),
                ),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.pink),
                  onPressed: details.onStepCancel,
                  child: const Text('Geri Gel'),
                ),
              ],
            );
          },
          currentStep: _aktifStep,
          steps: tumStepler,

          onStepContinue: () {
            setState(() {
              _ileriButonuKontrolu();
            });
          },
          onStepCancel: () {
            setState(() {
              if (_aktifStep > 0) {
                _aktifStep--;
              } else {
                _aktifStep = 0;
              }
            });
          },
        ),
      ),
    );
  }

  List<Step> _tumStepler() {
    List<Step> stepler = [
      Step(
        title: Text("İsim Soyisim"),
        subtitle: Text("Ad-Soyad"),
        state: _stateleriAyarla(0),
        isActive: true,
        content: TextFormField(
          key: key0,
          decoration: InputDecoration(
              labelText: "İsim Soyisim",
              hintText: "İsim Soyisim",
              border: OutlineInputBorder()),
          validator: (girilenDeger) {
            if (girilenDeger!.length < 6) {
              return "En az 6 karakter giriniz";
            }
          },
          onSaved: (girilenDeger) {
            isim = girilenDeger!;
          },
        ),
      ),
      Step(
        title: Text("Kart No"),
        subtitle: Text("Kart No"),
        state: _stateleriAyarla(1),
        isActive: true,
        content: TextFormField(
          key: key1,
          decoration: InputDecoration(
              labelText: "Kart No",
              hintText: "Kart No",
              border: OutlineInputBorder()),
          validator: (girilenDeger) {
           if(girilenDeger!.length != 16){
             return "Geçerli bir kart numarası giriniz";
           }
          },
          onSaved: (girilenDeger) {
            kartNo = girilenDeger!;
          },
        ),
      ),

      Step(
        title: Text("Tarih"),
        subtitle: Text("Tarih"),
        state: _stateleriAyarla(2),
        isActive: true,
        content: Row(
          children: [
            Expanded(
              child: TextFormField(
                obscureText: false,
                key: key2,
                decoration: InputDecoration(
                  labelText: "Tarih",
                  hintText: "mm/YY",
                  border: OutlineInputBorder(),
                ),
                validator: (girilenDeger) {
                  if (girilenDeger!.length != 5) {
                    return "geçersiz format";
                  }
                },
                onSaved: (girilenDeger) {
                  tarih = girilenDeger ?? '';
                },
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                obscureText: false,

                key: key3,
                decoration: InputDecoration(
                  labelText: "CVV",
                  hintText: "CVV",
                  border: OutlineInputBorder(),
                ),
                validator: (girilenDeger) {
                  if (girilenDeger!.length != 3) {
                    return "geçersiz CVV";
                  }
                },
                onSaved: (girilenDeger) {
                  cvv = girilenDeger ?? '';
                },
              ),
            ),
          ],
        ),
      ),


    ];

    return stepler;
  }

  StepState _stateleriAyarla(int oankiStep) {
    if (_aktifStep == oankiStep) {
      if (hata) {
        return StepState.error;
      } else {
        return StepState.editing;
      }
    } else
      return StepState.complete;
  }

  void _ileriButonuKontrolu() {
    switch (_aktifStep) {
      case 0:
        if (key0.currentState!.validate()) {
          key0.currentState!.save();
          hata = false;
          _aktifStep = 1;
        } else {
          hata = true;
        }
        break;

      case 1:
        if (key1.currentState!.validate()) {
          key1.currentState!.save();
          hata = false;
          _aktifStep = 2;
        } else {
          hata = true;
        }
        break;

      case 2:
        if (key2.currentState!.validate() && key3.currentState!.validate()) {
          key2.currentState!.save();
          key3.currentState!.save();
          hata = false;
          _aktifStep = 2;
          formTamamlandi();
        } else {
          hata = true;
        }
        break;
    }
  }

  void formTamamlandi() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Form Tamamlandı"),
          content: Text("Girilen değerler: \Ad: $isim\Kart No: $kartNo\nTarih: $tarih \nCVV: $cvv"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Tamam"),
            ),
          ],
        );
      },
    );
  }
}

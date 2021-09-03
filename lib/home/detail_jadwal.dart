import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jadwal_sholat/models/constant.dart';
import 'package:jadwal_sholat/models/prayer_times.dart';

class DetailJadwal extends StatefulWidget {

  @override
  _DetailJadwalState createState() => _DetailJadwalState();
}

class _DetailJadwalState extends State<DetailJadwal> {

  List<String> dummy = [
    "Fajr",
    "Terbit",
    "Dzuhur",
    "Ashar",
    "Terbenam",
    "Maghrib",
    "Isya",
  ];

  List<String> _prayerTimes = [];
  List<String> _prayerNames = [];

  @override
  void initState() {
    super.initState();
    getPrayerTimes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 100),
                alignment: Alignment.center,
                child: Image.asset('assets/images/icon.png'),
              ),
              SizedBox(height: 30,),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: ListView.builder(
                  itemCount: _prayerNames.length,
                  itemBuilder: (context, position){
                    return Container(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 120,
                            child: Text(_prayerNames[position],
                            style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              color: Colors.white
                            ),
                            child: Text(_prayerTimes[position],
                              style: TextStyle(
                                color: Colors.amber,
                                  fontSize: 20,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10,),
              FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.location_on, color: Colors.white,),
                  label: Text('Mencari Lokasi',
                  style: TextStyle(color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontSize: 14),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getPrayerTimes() {
    PrayerTime prayers = new PrayerTime();
    prayers.setTimeFormat(prayers.getTime12());
    prayers.setCalcMethod(prayers.getMWL());
    prayers.setAsrJuristic(prayers.getShafii());
    prayers.setAdjustHighLats(prayers.getAdjustHighLats());

    List<int> offsets = [-6, 0, 3, 2, 0, 3, 6];

    var currentTime = DateTime.now();
    prayers.tune(offsets);

    setState(() {
      _prayerTimes = prayers.getPrayerTimes(
          currentTime, Constant.lat, Constant.long, Constant.timeZone);
      _prayerNames = prayers.getTimeNames();
    });
  }
}

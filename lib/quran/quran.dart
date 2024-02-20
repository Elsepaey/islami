import 'package:flutter/material.dart';
import 'package:projects/quran/Sura_Details.dart';
import 'package:projects/themes.dart';
import 'package:quran_sharif/quran_sharif.dart';
import 'package:quran/quran.dart' as quran;

class QuranPage extends StatelessWidget {
  // final List<String> Ar_names = [
  //   "الفاتحه",
  //   "البقرة",
  //   "آل عمران",
  //   "النساء",
  //   "المائدة",
  //   "الأنعام",
  //   "الأعراف",
  //   "الأنفال",
  //   "التوبة",
  //   "يونس",
  //   "هود",
  //   "يوسف",
  //   "الرعد",
  //   "إبراهيم",
  //   "الحجر",
  //   "النحل",
  //   "الإسراء",
  //   "الكهف",
  //   "مريم",
  //   "طه",
  //   "الأنبياء",
  //   "الحج",
  //   "المؤمنون",
  //   "النّور",
  //   "الفرقان",
  //   "الشعراء",
  //   "النّمل",
  //   "القصص",
  //   "العنكبوت",
  //   "الرّوم",
  //   "لقمان",
  //   "السجدة",
  //   "الأحزاب",
  //   "سبأ",
  //   "فاطر",
  //   "يس",
  //   "الصافات",
  //   "ص",
  //   "الزمر",
  //   "غافر",
  //   "فصّلت",
  //   "الشورى",
  //   "الزخرف",
  //   "الدّخان",
  //   "الجاثية",
  //   "الأحقاف",
  //   "محمد",
  //   "الفتح",
  //   "الحجرات",
  //   "ق",
  //   "الذاريات",
  //   "الطور",
  //   "النجم",
  //   "القمر",
  //   "الرحمن",
  //   "الواقعة",
  //   "الحديد",
  //   "المجادلة",
  //   "الحشر",
  //   "الممتحنة",
  //   "الصف",
  //   "الجمعة",
  //   "المنافقون",
  //   "التغابن",
  //   "الطلاق",
  //   "التحريم",
  //   "الملك",
  //   "القلم",
  //   "الحاقة",
  //   "المعارج",
  //   "نوح",
  //   "الجن",
  //   "المزّمّل",
  //   "المدّثر",
  //   "القيامة",
  //   "الإنسان",
  //   "المرسلات",
  //   "النبأ",
  //   "النازعات",
  //   "عبس",
  //   "التكوير",
  //   "الإنفطار",
  //   "المطفّفين",
  //   "الإنشقاق",
  //   "البروج",
  //   "الطارق",
  //   "الأعلى",
  //   "الغاشية",
  //   "الفجر",
  //   "البلد",
  //   "الشمس",
  //   "الليل",
  //   "الضحى",
  //   "الشرح",
  //   "التين",
  //   "العلق",
  //   "القدر",
  //   "البينة",
  //   "الزلزلة",
  //   "العاديات",
  //   "القارعة",
  //   "التكاثر",
  //   "العصر",
  //   "الهمزة",
  //   "الفيل",
  //   "قريش",
  //   "الماعون",
  //   "الكوثر",
  //   "الكافرون",
  //   "النصر",
  //   "المسد",
  //   "الإخلاص",
  //   "الفلق",
  //   "الناس"
  // ];
  final List<String> Ar_names = Quran.getSurahName();

  QuranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Image(image: AssetImage("assets/images/qur2an_screen_logo.png")),
      Divider(
        color: MyTheme.primary_color,
      ),
      Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(Details.Route_Name,
                    arguments: Sura_data(
                        index: index + 1,
                        title: quran.getSurahName(index + 1)));
              },
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  child: ListTile(
                    leading: Text(
                      Localizations.localeOf(context).toString() == "en"
                          ? quran.getSurahName(index + 1)
                          : Ar_names[index],
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    trailing: Text(
                      quran.getVerseCount(index + 1).toString(),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  )),
            );
          },
          itemCount: Ar_names.length,
        ),
      ),
    ]);
  }
}

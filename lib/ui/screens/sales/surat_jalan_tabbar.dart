import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:steven_sales_app/common/app_style.dart';
import 'package:steven_sales_app/ui/screens/sales/surat_jalan/surat_jalan_tab.dart';
import 'package:steven_sales_app/ui/screens/sales/surat_jalan_history/surat_jalan_history_tab.dart';
import 'package:steven_sales_app/ui/screens/sales/surat_jalan_progress/surat_jalan_progress_tab.dart';
import 'package:steven_sales_app/ui/screens/search/search_sceen.dart';
import 'package:steven_sales_app/ui/widgets/custom_date_picker.dart';

class SuratJalanTabbar extends StatefulWidget {
  const SuratJalanTabbar({Key? key}) : super(key: key);

  @override
  State<SuratJalanTabbar> createState() => _SuratJalanTabbarState();
}

class _SuratJalanTabbarState extends State<SuratJalanTabbar> with SingleTickerProviderStateMixin {
  late TabController controller;

  late final DateTime _minDate;
  late final DateTime _maxDate;
  late DateTime _selecteDate;

  @override
  void initState() {
    final currentDate = DateTime.now();
    _minDate = DateTime(
      2000,
      currentDate.month,
      currentDate.day,
    );
    _maxDate = DateTime(
      currentDate.year + 10,
      currentDate.month,
      currentDate.day,
    );
    _selecteDate = DateTime.now();

    controller = TabController(vsync: this, length: 3); // Ubah length menjadi 3 karena ada 3 tab
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _showDatePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.close,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Pilih tanggal mulai cuti",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: 150,
                  child: CustomDatePicker(
                    itemExtent: 50,
                    minDate: _minDate,
                    maxDate: _maxDate,
                    selectedDate: _selecteDate,
                    diameterRatio: 1,
                    selectionOverlay: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppStyle.redColor.withOpacity(0.1),
                      ),
                    ),
                    selectedStyle: const TextStyle(
                      color: AppStyle.blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    unselectedStyle: TextStyle(
                      color: AppStyle.blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    disabledStyle: TextStyle(
                      color: AppStyle.blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    onSelectedItemChanged: (date) => _selecteDate = date,
                  ),
                ),
                Divider(
                  thickness: 1,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Save",
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Surat Jalan"),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                )),
            icon: const Icon(
              Icons.search,
            ),
          )
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            color: AppStyle.redColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Pilih Tanggal Surat Jalan",
                      style: TextStyle(
                        color: AppStyle.whiteColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Text(
                      "Kemudian Klik Ok",
                      style: TextStyle(
                        color: AppStyle.whiteColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    InkWell(
                      onTap: () => _showDatePicker(context),
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            color: AppStyle.whiteColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/icons/ic_calendar2.png",
                                height: 16,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              const Text(
                                "Tanggal 27-03-2023",
                                style: TextStyle(color: AppStyle.redColor, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              const Icon(
                                Icons.keyboard_arrow_down_sharp,
                                color: AppStyle.redColor,
                              ),
                            ],
                          )),
                    )
                  ],
                ),
                Image.asset("assets/icons/ic_document.png"),
              ],
            ),
          ),
          // Gunakan Expanded untuk memberikan ruang yang cukup bagi TabBarView
          DecoratedBox(
            decoration: BoxDecoration(
              //This is for background color

              color: Colors.white.withOpacity(0.0),
              //This is for bottom border that is needed
              border: const Border(
                  bottom: BorderSide(
                color: AppStyle.lightGreyColor,
                width: 1.5,
              )),
            ),
            child: TabBar(
              controller: controller,
              labelColor: AppStyle.yellowColor,
              indicatorColor: AppStyle.yellowColor,
              unselectedLabelColor: AppStyle.blackColor,
              tabs: const <Widget>[
                Tab(
                  child: Text(
                    "SJ Berjalan",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                Tab(
                  child: Text(
                    "Surat Jalan",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                Tab(
                  child: Text(
                    "Riwayat\nSurat Jalan",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: const <Widget>[
                SuratJalanProgressTab(),
                SuratJalanTab(),
                SuratJalanHistoryTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

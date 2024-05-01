import 'package:flutter/material.dart';
import 'package:steven_sales_app/common/app_style.dart';
import 'package:steven_sales_app/ui/widgets/dropdown_label.dart';
import 'package:steven_sales_app/ui/widgets/multi_select_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class Animal {
  final int id;
  final String name;
  bool isActive;

  Animal({
    required this.id,
    required this.name,
    required this.isActive,
  });
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Search",
            style: TextStyle(
              color: AppStyle.blackColor,
            ),
          ),
          foregroundColor: AppStyle.blackColor,
          backgroundColor: AppStyle.whiteColor,
          actions: const [],
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          children: [
            SizedBox(
              height: 40,
              child: TextField(
                style: const TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  isDense: true,
                  enabledBorder: OutlineInputBorder(
                    //<-- SEE HERE
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(color: AppStyle.greyColor, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    //<-- SEE HERE
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(color: AppStyle.greyColor, width: 1),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  hintText: "Pencarian",
                  suffixIcon: const Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Filter",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Reset all",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppStyle.blueColor,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 24.0,
            ),
            const Text(
              "Status",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const MultiSelectWidget(
              items: [
                'Draft',
                'Reject',
                'Open',
                'Transfer',
                'TransferF',
                'Loading',
                'TransferD',
                'Unloading',
                'Delivered',
                'Done',
                'Pending',
                'Closed',
                'Posted',
                'Void',
                'Void Pangkalan',
              ],
            ),
            const SizedBox(
              height: 12.0,
            ),
            DropdownLabel(
              label: "Bisnis Unit",
              items: const ["Dump Truck", "Cargo", "Mixer"],
              onChanged: (val) {},
            ),
            DropdownLabel(
              label: "Formasi(DUMMY)",
              items: const ["Dump Truck", "Cargo", "Mixer"],
              onChanged: (val) {},
            ),
            DropdownLabel(
              label: "Pelanggan",
              items: const [
                "Armada Berjalan Trans Tbk, PT",
                "Abadi Gunung ReadyMix, PT",
                "Abadi Makmur Anugrah, PT",
                "Asang Surya Makmur, PT",
                "Bangkit Jaya Abadi, PT"
              ],
              onChanged: (val) {},
            ),
            DropdownLabel(
              label: "Asal",
              items: const [
                "Andalan Furnido",
                "Aneka Mitra Gemilang",
                "Aneka Mitra Gemilang,PT. - Marunda",
                "Bumi Alam Segar,PT.",
                "Plant Pbi Balaraja",
                "Cibitung",
                "Cidahu - Sukabumi",
                "CIOMAS",
                "Depo Cianjur",
                "Cikande",
                "Gunung Tua Mandiri,PT.",
                "Jatiasih - Amg",
                "Kemuning",
                "Semarang",
              ],
              onChanged: (val) {},
            ),
            DropdownLabel(
              label: "Tujuan",
              items: const [
                "Andalan Furnido",
                "Aneka Mitra Gemilang",
                "Aneka Mitra Gemilang,PT. - Marunda",
                "Bumi Alam Segar,PT.",
                "Plant Pbi Balaraja",
                "Cibitung",
                "Cidahu - Sukabumi",
                "CIOMAS",
                "Depo Cianjur",
                "Cikande",
                "Gunung Tua Mandiri,PT.",
                "Jatiasih - Amg",
                "Kemuning",
                "Semarang",
              ],
              onChanged: (val) {},
            ),
            DropdownLabel(
              label: "Produk",
              items: const [
                "Bata Merah",
                "Pasir",
                "Split 1/2",
                "Basecoarse 030",
                "Semen",
              ],
              onChanged: (val) {},
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text("Cari"))
          ],
        ));
  }
}

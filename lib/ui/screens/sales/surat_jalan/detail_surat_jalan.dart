import 'package:flutter/material.dart';

import 'package:steven_sales_app/ui/screens/sales/surat_jalan/history_driver.dart';
import 'package:steven_sales_app/ui/screens/sales/surat_jalan/tracking_order.dart';
import 'package:steven_sales_app/ui/screens/sales/surat_jalan/widget/foto_bukti.dart';
import 'package:steven_sales_app/ui/screens/sales/surat_jalan/widget/quantity_item.dart';
import 'package:steven_sales_app/ui/screens/sales/surat_jalan/widget/sj_kembali.dart';
import 'package:steven_sales_app/ui/widgets/form_label.dart';
import 'package:steven_sales_app/ui/widgets/primary_button.dart';
import 'package:steven_sales_app/ui/widgets/row_label_value.dart';
import 'package:steven_sales_app/utils/enum.dart';

import '../../../../common/app_style.dart';

class DetailSuratJalan extends StatefulWidget {
  final StatusSJ statusSJ;
  final String idSJ;
  final Color colorSJ;
  const DetailSuratJalan({
    Key? key,
    required this.statusSJ,
    required this.idSJ,
    required this.colorSJ,
  }) : super(key: key);

  @override
  State<DetailSuratJalan> createState() => _FormSuratJalanState();
}

class _FormSuratJalanState extends State<DetailSuratJalan> {
  final List<Map<String, dynamic>> nomorKendaraan = [
    {
      "id": 1,
      "plat": 'B 9789 NYJ',
    },
    {
      "id": 2,
      "plat": 'B 9651 JXR',
    },
    {
      "id": 3,
      "plat": 'B 9544 NYK',
    },
    {
      "id": 4,
      "plat": 'B 9321 NYQ',
    },
    {
      "id": 5,
      "plat": 'B 9778 NYA',
    },
  ];

  final List<Map<String, dynamic>> supir = [
    {
      "id": 1,
      "supirUtama": {
        "nama": "Sumanto Sutrisno",
        "perusahaan": "ASM",
        "noHp": "0812735475123",
        "noRek": "6237813",
        "sim": "B1 & B2",
        "noSim": "1236716312313123",
        "exp": "02/2024",
      },
      "supirCadangan": {
        "nama": "Samuel Johan",
        "perusahaan": "SMS",
        "noHp": "081264836738",
        "noRek": "546723",
        "sim": "B1",
        "noSim": "1123243543634324",
        "exp": "03/2024",
      }
    },
    {
      "id": 2,
      "supirUtama": {
        "nama": "Stefanus Sutrisno",
        "perusahaan": "NCA",
        "noHp": "08645272351",
        "noRek": "532126",
        "sim": "B1",
        "noSim": "93771237123123",
        "exp": "02/2028",
      },
      "supirCadangan": {
        "nama": "Suparman Johan",
        "perusahaan": "SMS",
        "noHp": "0813263616123",
        "noRek": "645322",
        "sim": "B2",
        "noSim": "82361632131231213",
        "exp": "01/2025",
      }
    },
    {
      "id": 3,
      "supirUtama": {
        "nama": "Suterman Sutrisno",
        "perusahaan": "ASM",
        "noHp": "0816237123721",
        "noRek": "432541",
        "sim": "B1 & B2",
        "noSim": "237472742423423",
        "exp": "10/2026",
      },
      "supirCadangan": {
        "nama": "Rahmad Alviansyah",
        "perusahaan": "NCA",
        "noHp": "08792312313113",
        "noRek": "542632",
        "sim": "B1",
        "noSim": "152351361311231",
        "exp": "12/2026",
      }
    },
    {
      "id": 4,
      "supirUtama": {
        "nama": "Siti Moses",
        "perusahaan": "SMS",
        "noHp": "089761236126",
        "noRek": "1234123",
        "sim": "B2",
        "noSim": "181276312763616",
        "exp": "09/2024",
      },
      "supirCadangan": {
        "nama": "Tresno Yudi",
        "perusahaan": "NCA",
        "noHp": "08971231313",
        "noRek": "645233",
        "sim": "B1 & B2",
        "noSim": "73412617312312",
        "exp": "01/2030",
      }
    },
    {
      "id": 5,
      "supirUtama": {
        "nama": "Toto Siti",
        "perusahaan": "SMS",
        "noHp": "0876123131",
        "noRek": "4532312",
        "sim": "B2",
        "noSim": "6127317312131",
        "exp": "03/2024",
      },
      "supirCadangan": {
        "nama": "Imam Yudis",
        "perusahaan": "ASM",
        "noHp": "089615235131",
        "noRek": "5234221",
        "sim": "B1",
        "noSim": "71263173181312",
        "exp": "12/2025",
      }
    },
  ];

  Map<String, dynamic>? selectedPlat;
  int selectedSupir = 0;

  void showModalTransaction() async {
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0).copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Image.asset("assets/icons/ic_receipt.png"),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Text(
                    "Rincian Transaksi",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Row(
                children: [
                  Expanded(
                      child: FormLabel(
                    label: "Biaya Lift Of",
                    hintText: "0000",
                  )),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                      child: FormLabel(
                    label: "Biaya Tambahan",
                    hintText: "0000",
                  )),
                ],
              ),
              const Row(
                children: [
                  Expanded(
                      child: FormLabel(
                    label: "Biaya Loading",
                    hintText: "0000",
                  )),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                      child: FormLabel(
                    label: "Biaya Kawal",
                    hintText: "0000",
                  )),
                ],
              ),
              const FormLabel(
                label: "Memo Tambahan",
                keyboardType: TextInputType.multiline,
                hintText: "Memo",
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text("Submit UJT")))
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.idSJ),
        actions: [
          (widget.statusSJ != StatusSJ.Draft)
              ? IconButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TrackingOrder(
                        idSJ: widget.idSJ,
                        colorSJ: widget.colorSJ,
                        statusSJ: widget.statusSJ,
                      ),
                    ),
                  ),
                  icon: Image.asset("assets/icons/ic_location_2.png"),
                )
              : IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Image.asset("assets/icons/ic_disk.png"),
                ),
        ],
      ),
      body: ListView(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 25,
                width: 5,
                decoration: BoxDecoration(
                    color: widget.colorSJ,
                    borderRadius: const BorderRadius.horizontal(
                      right: Radius.circular(
                        3,
                      ),
                    )),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Text(
                widget.statusSJ.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 5,
            color: AppStyle.lightGreyColor,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 15,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset("assets/icons/ic_building.png"),
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Text(
                      "Detail Perusahaan",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppStyle.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 7,
                        offset: const Offset(
                          0,
                          1,
                        ),
                        color: AppStyle.blackColor.withOpacity(
                          0.1,
                        ),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/onboarding1.png",
                        height: 40,
                        width: 40,
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "PT. Alam Sampurna Makmur",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "-",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const Divider(
            thickness: 5,
            color: AppStyle.lightGreyColor,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 15,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset("assets/icons/ic_truck.png"),
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Text(
                      "Detail Produk",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const RowLabelValue(label: "Produk", value: "Pasir"),
                const RowLabelValue(label: "Jenis Armada", value: "Tronton / Dump Truck"),
              ],
            ),
          ),
          const Divider(
            thickness: 5,
            color: AppStyle.lightGreyColor,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 15,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset("assets/icons/ic_shipping.png"),
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Text(
                      "Info Pengiriman",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const RowLabelValue(label: "No Jadwal", value: "CA2305694"),
                const RowLabelValue(label: "Tanggal SJ", value: "2023-05-20"),
                const RowLabelValue(label: "Asal", value: "Reshuffle"),
                const RowLabelValue(label: "Pelanggan", value: "PT. CIPTA  MAJU SUKSES"),
                const RowLabelValue(label: "Tujuan", value: "CMS - PIK2"),
              ],
            ),
          ),
          const Divider(
            thickness: 5,
            color: AppStyle.lightGreyColor,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset("assets/icons/ic_wheel.png"),
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Text(
                      "Info Driver",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "No Kendaraan",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                DropdownButtonFormField<Map<String, dynamic>>(
                  isExpanded: true,
                  items: nomorKendaraan.map((Map<String, dynamic> value) {
                    return DropdownMenuItem<Map<String, dynamic>>(
                      value: value,
                      child: Text(value['plat']),
                    );
                  }).toList(),
                  onChanged: (Map<String, dynamic>? newValue) {
                    setState(() {});
                    if (newValue != null) {
                      selectedPlat = supir.firstWhere((element) => element["id"] == newValue["id"]);
                    }
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: AppStyle.greyColor, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: AppStyle.greyColor, width: 1),
                    ),
                  ),
                  hint: const Text('Pilih Nomor Kendaraan'), // Teks default sebelum dipilih
                  value: null, // Nilai awal dropdown, di sini null karena belum dipilih
                ),
                const SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSupir = 1;
                    });
                  },
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(10)),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: selectedSupir == 1 ? AppStyle.yellowColor : Colors.transparent,
                            width: 10,
                          ),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: AppStyle.whiteColor,
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 7,
                              offset: const Offset(
                                0,
                                1,
                              ),
                              color: AppStyle.blackColor.withOpacity(
                                0.1,
                              ),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Supir Utama",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/images/img_default_sj.png",
                                  height: 60,
                                  width: 60,
                                  fit: BoxFit.fill,
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      selectedPlat?["supirUtama"]["nama"] ?? "Nama",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      selectedPlat?["supirUtama"]["perusahaan"] ?? "Perusahaan",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      selectedPlat?["supirUtama"]["noHp"] ?? "No Hp",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      selectedPlat?["supirUtama"]["noRek"] != null
                                          ? "No Rek. ${selectedPlat?["supirUtama"]["noRek"]}"
                                          : "No Rek",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      "SIM ${selectedPlat?["supirUtama"]["sim"] ?? ""}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      selectedPlat?["supirUtama"]["noSim"] ?? "No SIM",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      "Exp. ${selectedPlat?["supirUtama"]["exp"] ?? ""}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const Divider(
                  thickness: 1,
                  height: 0,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSupir = 2;
                    });
                  },
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10)),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: selectedSupir == 2 ? AppStyle.yellowColor : Colors.transparent,
                            width: 10,
                          ),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: AppStyle.whiteColor,
                          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 7,
                              offset: const Offset(
                                0,
                                1,
                              ),
                              color: AppStyle.blackColor.withOpacity(
                                0.1,
                              ),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Supir Cadangan",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/images/img_default_sj.png",
                                  height: 60,
                                  width: 60,
                                  fit: BoxFit.fill,
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      selectedPlat?["supirCadangan"]["nama"] ?? "Nama",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      selectedPlat?["supirCadangan"]["perusahaan"] ?? "Perusahaan",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      selectedPlat?["supirCadangan"]["noHp"] ?? "No Hp",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      selectedPlat?["supirCadangan"]["noRek"] != null
                                          ? "No Rek. ${selectedPlat?["supirCadangan"]["noRek"]}"
                                          : "No Rek",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      "SIM ${selectedPlat?["supirCadangan"]["sim"] ?? ""}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      selectedPlat?["supirCadangan"]["noSim"] ?? "No SIM",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      "Exp. ${selectedPlat?["supirCadangan"]["exp"] ?? ""}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const Divider(
            thickness: 5,
            color: AppStyle.lightGreyColor,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 15,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset("assets/icons/ic_receipt.png"),
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Text(
                      "Rincian Transaksi",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                      ),
                    ),
                    const Spacer(),
                    if (widget.statusSJ == StatusSJ.Draft)
                      InkWell(
                        onTap: showModalTransaction,
                        child: const Text(
                          "Edit",
                          style: TextStyle(
                            color: AppStyle.blueColor,
                          ),
                        ),
                      )
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const RowLabelValue(label: "Jenis Transaksi", value: "Ongkos Angkut, NCA"),
                const RowLabelValue(label: "UJT", value: "100.000"),
                Row(
                  children: [
                    const Expanded(flex: 2, child: SizedBox()),
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.only(bottom: 16, top: 5),
                        decoration: BoxDecoration(
                          color: AppStyle.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 7,
                              offset: const Offset(
                                0,
                                1,
                              ),
                              color: AppStyle.blackColor.withOpacity(
                                0.25,
                              ),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const RowLabelValue(label: "Biaya Lift Off", value: "400.000"),
                            const RowLabelValue(label: "Biaya Loading", value: "300.000"),
                            InkWell(
                                onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const HistoryDriver(),
                                      ),
                                    ),
                                child: const Text(
                                  "Lihat semua",
                                  style: TextStyle(
                                    color: AppStyle.blueColor,
                                    fontSize: 12,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const RowLabelValue(label: "Biaya Lift Off", value: "400.000"),
                const RowLabelValue(label: "Biaya Loading", value: "300.000"),
                const RowLabelValue(label: "Biaya Kawal", value: "500.000"),
                const RowLabelValue(label: "Biaya Tambahan", value: "100.000"),
                const RowLabelValue(label: "Memo Tambahan", value: "Hati2 dalam berkendara membawa ba"),
                const RowLabelValue(label: "Total UJT", value: "2.000.000"),
              ],
            ),
          ),
          const Divider(
            thickness: 5,
            color: AppStyle.lightGreyColor,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 15,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset("assets/icons/ic_shipping.png"),
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Text(
                      "Info Pengiriman",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const RowLabelValue(label: "No Jadwal", value: "CA2305694"),
                const RowLabelValue(label: "Tanggal SJ", value: "2023-05-20"),
                const RowLabelValue(label: "Asal", value: "Reshuffle"),
                const RowLabelValue(label: "Pelanggan", value: "PT. CIPTA  MAJU SUKSES"),
                const RowLabelValue(label: "Tujuan", value: "CMS - PIK2"),
              ],
            ),
          ),
          const Divider(
            thickness: 5,
            color: AppStyle.lightGreyColor,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 15,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset("assets/icons/ic_document_text.png"),
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Text(
                      "Informasi Dokumen",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const FormLabel(
                  label: "No DO",
                  hintText: "Isi no DO",
                ),
                const FormLabel(
                  label: "No SPA",
                  hintText: "Isi no SPA",
                ),
                const FormLabel(
                  label: "No Container",
                  hintText: "Isi no Container",
                ),
                const FormLabel(
                  label: "No PTO",
                  hintText: "Isi no PTO",
                ),
                const FormLabel(
                  label: "No DI",
                  hintText: "Isi no DI",
                ),
                const FormLabel(
                  label: "SJ Customer",
                  hintText: "Isi SJ Customer",
                ),
                const FormLabel(
                  label: "SJ Supplier",
                  hintText: "Isi SJ Supplier",
                ),
                const FormLabel(
                  label: "Note",
                  hintText: "Isi Note",
                ),
              ],
            ),
          ),
          if (widget.statusSJ != StatusSJ.Draft) const FotoBukti(),
          if (widget.statusSJ != StatusSJ.Draft && widget.statusSJ == StatusSJ.Transfer) const SJKembali(),
          if (widget.statusSJ != StatusSJ.Draft && widget.statusSJ == StatusSJ.Transfer) const QuantityItem(),
          if (widget.statusSJ == StatusSJ.Draft)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      onPressed: () => Navigator.pop(context),
                      label: "Tolak",
                      bgColor: AppStyle.lightGreyColor,
                      textColor: AppStyle.blackColor,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: PrimaryButton(
                      onPressed: () => Navigator.pop(context),
                      label: "Terima",
                    ),
                  )
                ],
              ),
            ),
          if (widget.statusSJ == StatusSJ.Open || widget.statusSJ == StatusSJ.Transfer)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      onPressed: () => Navigator.pop(context),
                      label: "Simpan",
                    ),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}

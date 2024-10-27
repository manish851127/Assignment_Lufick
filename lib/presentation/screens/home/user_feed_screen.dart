import 'package:assignment_lufick/core/ui.dart';
import 'package:assignment_lufick/data/chart_data/pie_data.dart';
import 'package:assignment_lufick/presentation/screens/other/expense_details_page.dart';
import 'package:assignment_lufick/presentation/screens/other/pie_chart_page.dart';
import 'package:assignment_lufick/presentation/widgets/space_widget.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

class UserFeedScreen extends StatefulWidget {
  const UserFeedScreen({super.key});

  @override
  State<UserFeedScreen> createState() => _UserFeedScreenState();
  static const routeName = "userFeed";
}

class _UserFeedScreenState extends State<UserFeedScreen> {
  GlobalKey chartKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Expenses',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: _exportToPDF,
            child: const Text(
              "Export to PDF",
            ),
          ),
        ],
      ),
      body: RepaintBoundary(
        key: chartKey,
        child: ListView(
          children: [
            PieChartPage(),
            Container(
              height: 20,
              color: Color.fromARGB(255, 246, 246, 248),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Text(
                'Top spending by categories',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const Space(),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: PieData.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, ExpenseDetailsPage.routeName,
                          arguments: {
                            'title': '${PieData.data[index].category}',
                            'expense': PieData.data[index].money
                          });
                    },
                    title: Text(
                      '${PieData.data[index].category}',
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    leading: const Icon(Icons.food_bank),
                    subtitle: Text('Rs. ${PieData.data[index].money}'),
                  );
                })
          ],
        ),
      ),
    );
  }

  Future<void> _exportToPDF() async {
    final pdf = pw.Document();

    // Capture chart as image
    final chartImage = await _captureChart();

    // Create PDF page with chart
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              if (chartImage != null)
                pw.Image(pw.MemoryImage(chartImage), height: 300, width: 200),
            ],
          );
        },
      ),
    );

    // Save and share PDF
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/chart_example.pdf");
    await file.writeAsBytes(await pdf.save());
    await Printing.sharePdf(
        bytes: await pdf.save(), filename: 'chart_example.pdf');
  }

  Future<Uint8List?> _captureChart() async {
    try {
      final boundary =
          chartKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      final ui.Image image = await boundary.toImage();
      final ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      return byteData?.buffer.asUint8List();
    } catch (e) {
      print(e);
      return null;
    }
  }
}

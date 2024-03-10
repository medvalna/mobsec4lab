import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gsheets/gsheets.dart';
import 'package:mobsec4lab/models/feedback.dart';

class FeedBackSheetApi {
  static final _credentials = '${dotenv.env['CREDENTIALS']}';
  static final _spreadsheetId = '${dotenv.env['SPREADSHEET_ID']}';
  static final _gsheets = GSheets(
    _credentials,
  );
  static Worksheet? _feedbackSheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _feedbackSheet = await _getWorkSheet(spreadsheet, title: 'Feedback');

      final firstRow = FeedbackFields().getFields();
      _feedbackSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print('Init error: $e');
    }
  }

  static Future<Worksheet> _getWorkSheet(Spreadsheet spreadsheet,
      {required String title}) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_feedbackSheet == null) return;
    _feedbackSheet!.values.map.appendRows(rowList);
  }
}

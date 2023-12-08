import 'dart:convert';
import 'dart:io';

void main() {
  // Your input data
  String inputData = '''
1	What is the place value of the digit 4 in the number 8,475,123?	Thousands	Hundreds	Tens	Millions	Ten thousands			E
2	In which position is the digit 6 in the number 6,512,940?	Millions	Tens	Hundreds	Thousands	Ten thousands			A
3	What is the place value of the digit 2 in the number 4,238,765?	Tens	Hundreds	Thousands	Millions	Ten thousands			C
4	In which position is the digit 7 in the number 9,785,612?	Millions	Tens	Hundreds	Ten thousands	Thousands			D
5	What is the place value of the digit 5 in the number 5,643,210?	Millions	Tens	Hundreds	Thousands	Ten thousands			A
6	In which position is the digit 3 in the number 9,342,785?	Millions	Tens	Thousands	Hundreds	Ten thousands			D
7	What is the place value of the digit 8 in the number 7,856,214?	Tens	Hundreds	Thousands	Millions	Ten thousands			E
8	In which position is the digit 1 in the number 9,785,614?	Millions	Tens	Hundreds	Thousands	Ten thousands			C
9	What is the place value of the digit 9 in the number 9,432,785?	Millions	Tens	Hundreds	Thousands	Ten thousands			A
10	In which position is the digit 2 in the number 3,218,745?	Millions	Tens	Hundreds	Ten thousands	Thousands			C
''';

  // Split input into lines
  List<String> lines = inputData.split('\n');

  // Create a list to store JSON objects
  List<Map<String, dynamic>> jsonDataList = [];

  // Process each line and convert to JSON
  for (String line in lines) {
    List<String> elements = line.split('\t');
    if (elements.length == 8) {
      Map<String, dynamic> jsonMap = {
        'questionNumber': int.parse(elements[0]),
        'questionText': elements[1],
        'placeValue': elements[2],
        'position1': elements[3],
        'position2': elements[4],
        'position3': elements[5],
        'position4': elements[6],
        'correctAnswer': elements[7],
      };
      jsonDataList.add(jsonMap);
    }
  }

  // Convert to JSON string
  String jsonString = jsonEncode(jsonDataList);

  // Write to a JSON file
  File('output.json').writeAsStringSync(jsonString);

  print('Conversion complete. JSON file created: output.json');
}

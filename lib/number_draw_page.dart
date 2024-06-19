import 'package:flutter/material.dart';
import 'dart:math';

class NumberDrawPage extends StatefulWidget {
  @override
  _NumberDrawPageState createState() => _NumberDrawPageState();
}

class _NumberDrawPageState extends State<NumberDrawPage> {
  final TextEditingController _startController = TextEditingController();
  final TextEditingController _endController = TextEditingController();
  final TextEditingController _countController = TextEditingController();
  List<int> _drawnNumbers = [];
  bool _showResult = false;

  void _drawNumbers() {
    final int start = int.tryParse(_startController.text) ?? 0;
    final int end = int.tryParse(_endController.text) ?? 0;
    final int count = int.tryParse(_countController.text) ?? 0;
    if (start < end && count > 0) {
      final random = Random();
      final Set<int> numbers = {};
      while (numbers.length < count) {
        numbers.add(start + random.nextInt(end - start + 1));
      }
      setState(() {
        _drawnNumbers = numbers.toList();
        _showResult = true;
      });
    }
  }

  void _reset() {
    setState(() {
      _startController.clear();
      _endController.clear();
      _countController.clear();
      _drawnNumbers.clear();
      _showResult = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sortear Números'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _startController,
                      decoration: InputDecoration(
                        labelText: 'Número Inicial',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      controller: _endController,
                      decoration: InputDecoration(
                        labelText: 'Número Final',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _countController,
                      decoration: InputDecoration(
                        labelText: 'Quantidade de Números',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 16),
                  TextButton(
                    onPressed: _drawNumbers,
                    child: Text('Go'),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            if (_showResult)
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      'Números Sorteados:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: _drawnNumbers.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_drawnNumbers[index].toString()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            SizedBox(height: 20),
            TextButton(
              onPressed: _reset,
              child: Text('Limpar campos',),
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

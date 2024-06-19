import 'package:flutter/material.dart';
import 'dart:math';

class NameDrawPage extends StatefulWidget {
  @override
  _NameDrawPageState createState() => _NameDrawPageState();
}

class _NameDrawPageState extends State<NameDrawPage> {
  final TextEditingController _nameController = TextEditingController();
  final List<String> _names = [];
  String _drawnName = '';

  void _addName() {
    if (_nameController.text.isNotEmpty) {
      setState(() {
        _names.add(_nameController.text);
        _nameController.clear();
      });
    }
  }

  void _drawName() {
    if (_names.isNotEmpty) {
      final random = Random();
      setState(() {
        _drawnName = _names[random.nextInt(_names.length)];
      });
    }
  }

  void _reset() {
    setState(() {
      _names.clear();
      _drawnName = '';
      _nameController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sortear Nomes'),
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
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: 'Digite o Nome',
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      TextButton(
                        onPressed: _addName,
                        child: Text('Adicionar'),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Lista de Nomes',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 200,  
                    child: ListView.builder(
                      itemCount: _names.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_names[index]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            if (_drawnName.isNotEmpty)
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Nome Sorteado: $_drawnName',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _drawName,
              child: Text('Sortear Nome'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: _reset,
              child: Text('Resetar'),
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

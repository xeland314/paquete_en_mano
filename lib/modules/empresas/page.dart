import 'package:flutter/material.dart';
import 'package:paquete_en_mano/api/empresa_api.dart';
import 'package:paquete_en_mano/api/models/empresa.dart';
import 'package:paquete_en_mano/modules/empresas/list.dart';

class EmpresasPage extends StatefulWidget {
  final EmpresaApi _empresasApi =
      EmpresaApi("30f0e41d8195c518f1587e099a09d33fa4063f1c");

  EmpresasPage({Key? key}) : super(key: key);

  @override
  EmpresasPageState createState() => EmpresasPageState();
}

class EmpresasPageState extends State<EmpresasPage> {
  late Future<List<Empresa>> _empresasFuture;
  final TextEditingController _searchController = TextEditingController();
  List<Empresa> _empresas = [];
  List<Empresa> _filteredEmpresas = [];

  @override
  void initState() {
    super.initState();
    _empresasFuture = widget._empresasApi.getEmpresas();
    _empresasFuture.then((value) {
      setState(() {
        _empresas = value;
        _filteredEmpresas = value;
      });
    });
  }

  void _updateEmpresas() {
    setState(() {
      _empresasFuture = widget._empresasApi.getEmpresas();
      _empresasFuture.then((value) {
        setState(() {
          _empresas = value;
          _filteredEmpresas = value;
        });
      });
    });
  }

  void _searchEmpresas(String query) {
    setState(() {
      if (query.isEmpty) {
        // Mostrar todas las empresas si la consulta está vacía
        _filteredEmpresas = _empresas;
      } else {
        // Filtrar las empresas por nombre que contenga la consulta
        _filteredEmpresas = _empresas
            .where((empresa) => empresa.nombreComercial
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Empresas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _updateEmpresas,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Buscar empresa',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () =>
                            [_searchController.clear(), _updateEmpresas()],
                      ),
                    ),
                    onChanged: (text) =>
                        _searchEmpresas(_searchController.text),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: EmpresasList(empresas: _filteredEmpresas),
          ),
        ],
      ),
    );
  }
}

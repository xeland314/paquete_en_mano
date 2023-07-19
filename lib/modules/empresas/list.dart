import 'package:flutter/material.dart';
import 'package:paquete_en_mano/api/models/empresa.dart';
import 'package:paquete_en_mano/modules/empresas/card.dart';

class EmpresasList extends StatelessWidget {
  final List<Empresa> empresas;

  const EmpresasList({Key? key, required this.empresas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: empresas.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        final empresa = empresas[index];
        return EmpresaCard(empresa: empresa);
      },
    );
  }
}

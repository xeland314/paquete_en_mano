import 'package:flutter/material.dart';
import 'package:paquete_en_mano/api/models/empresa.dart';

class EmpresaCard extends StatelessWidget {
  final Empresa empresa;

  const EmpresaCard({Key? key, required this.empresa}) : super(key: key);

  void _showSuscripcion(BuildContext context) {
    // Mostrar información sobre la suscripción de la empresa en un modal o ventana emergente
  }

  void _editEmpresa(BuildContext context) {
    // Navegar a una página para editar los datos de la empresa
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 500) {
      // Diseño para pantallas pequeñas
      return SizedBox(
          height: 150,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    empresa.nombreComercial,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Correo: ${empresa.correo}',
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Teléfono: ${empresa.telefono}',
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => _showSuscripcion(context),
                        child: const Text('Ver suscripción'),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () => _editEmpresa(context),
                        child: const Text('Editar'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ));
    } else {
      // Diseño para pantallas grandes
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      empresa.nombreComercial,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'RUC: ${empresa.ruc}',
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Dirección: ${empresa.direccion}',
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Correo: ${empresa.correo}',
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Teléfono: ${empresa.telefono}',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () => _showSuscripcion(context),
                      child: const Text('Ver suscripción'),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () => _editEmpresa(context),
                      child: const Text('Editar'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: const CotizacionScreen(),
    );
  }
}

class CotizacionScreen extends StatelessWidget {
  const CotizacionScreen({super.key});

  static const Color fondo = Color(0xFF0A0613);
  static const Color tarjeta = Color(0xFF16122B);
  static const Color morado = Color(0xFF7C5CFF);
  static const Color textoSuave = Color(0xFF8E8BA8);
  static const Color borde = Color(0xFF2A2547);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fondo,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Orden TL-0244',
                style: TextStyle(color: textoSuave, fontSize: 12),
              ),
              const SizedBox(height: 2),
              const Text(
                'Cotización',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                'Laptop HP · No enciende',
                style: TextStyle(color: textoSuave, fontSize: 12),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: tarjeta,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Detalle del servicio',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 14),
                    const _FilaDetalle(concepto: 'Diagnóstico', monto: r'[$ 000]'),
                    const SizedBox(height: 12),
                    const _FilaDetalle(
                      concepto: 'Cambio de placa / repuesto',
                      monto: r'[$ 000]',
                    ),
                    const SizedBox(height: 12),
                    const _FilaDetalle(concepto: 'Mano de obra', monto: r'[$ 000]'),
                    const SizedBox(height: 14),
                    const Divider(color: borde, height: 1),
                    const SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Total',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          r'[$ 000]',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              _TarjetaInfo(
                texto: 'Tiempo estimado: [X] días · Garantía: [X] días',
              ),
              const SizedBox(height: 12),
              _TarjetaInfo(
                texto:
                    'Al aprobar, el taller inicia la reparación y recibirás avisos de cada etapa.',
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: morado,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Aprobar cotización',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: borde),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Rechazar',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FilaDetalle extends StatelessWidget {
  final String concepto;
  final String monto;

  const _FilaDetalle({required this.concepto, required this.monto});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          concepto,
          style: const TextStyle(color: Colors.white, fontSize: 13),
        ),
        Text(
          monto,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _TarjetaInfo extends StatelessWidget {
  final String texto;

  const _TarjetaInfo({required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: CotizacionScreen.tarjeta,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        texto,
        style: const TextStyle(
          color: CotizacionScreen.textoSuave,
          fontSize: 12,
        ),
      ),
    );
  }
}
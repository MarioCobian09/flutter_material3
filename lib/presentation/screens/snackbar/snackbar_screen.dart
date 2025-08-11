import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar( BuildContext context ) {

    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola mundo!'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog( BuildContext context ) {

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('¿Estás seguro?'),
        content: const Text('Reprehenderit magna qui minim qui quis velit minim ex culpa. Deserunt eu esse minim fugiat sunt commodo Lorem in commodo do. Labore ea sunt occaecat tempor officia et nostrud. Voluptate cupidatat quis aute ipsum. Ex consequat qui aliquip consequat aute in. Officia aute dolor nulla aute aliqua exercitation velit ipsum consequat reprehenderit elit.'),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(
            onPressed: () {
              context.pop();

              showCustomSnackbar(context);
            }, 
            child: const Text('Aceptar')
          )
        ],
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Diálogos'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Sit do anim est do laboris anim ipsum sit mollit ullamco ad ex dolor. Deserunt ullamco enim minim culpa. Ea cupidatat elit consectetur labore anim nisi officia eu qui deserunt veniam. Reprehenderit do laborum non do nisi. Cillum occaecat aliqua incididunt tempor. Dolor ad aute aute minim occaecat laboris cupidatat.')
                  ]
                );
              }, 
              child: const Text('Licencias usadas')
            ),

            FilledButton.tonal(
              onPressed: () => openDialog(context), 
              child: const Text('Mostrar diálogo')
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
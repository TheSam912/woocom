import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../authentication/provider/auth_provider.dart';

class AdminWeb extends ConsumerWidget {
  const AdminWeb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Panel"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
            onPressed: () {
              ref.read(authRepositoryProvider).signOut();
              ref.invalidate(authStateProvider);
            },
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/preferences/app_preferences_providers.dart';

class AppPreferences extends ConsumerWidget {
  const AppPreferences({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(appLanguageProvider);
    final isFrench = language == 'fr';
    final isDarkMode = ref.watch(appDarkModeProvider);

    // Liste de nos préférences
    final preferences = [
      {
        'type': 'language',
        'title': 'App Language',
        'icon': Icons.language,
      },
      {
        'type': 'theme',
        'title': 'Theme Mode',
        'icon': isDarkMode ? Icons.dark_mode : Icons.light_mode,
      },
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: preferences.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final item = preferences[index];

        if (item['type'] == 'language') {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey.shade100,
              child: Icon(item['icon'] as IconData, color: Colors.black87),
            ),
            title: Text(
              item['title'] as String,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            trailing: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () => ref
                        .read(appLanguageProvider.notifier)
                        .setLanguage('en'),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: !isFrench
                            ? const Color(0xFF0F172A)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        'EN',
                        style: TextStyle(
                          color: !isFrench ? Colors.white : Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => ref
                        .read(appLanguageProvider.notifier)
                        .setLanguage('fr'),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: isFrench
                            ? const Color(0xFF0F172A)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        'FR',
                        style: TextStyle(
                          color: isFrench ? Colors.white : Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          // Type: Theme
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey.shade100,
              child: Icon(item['icon'] as IconData, color: Colors.black87),
            ),
            title: Text(
              item['title'] as String,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(isDarkMode ? 'Dark' : 'Light'),
            trailing: Switch(
              value: isDarkMode,
              onChanged: (value) {
                ref.read(appDarkModeProvider.notifier).setDarkMode(value);
              },
            ),
          );
        }
      },
    );
  }
}

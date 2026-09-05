import 'package:flutter/material.dart';

class ChildProfileData {
  final String name;
  final String language;
  final Color avatarBgColor;

  ChildProfileData({
    required this.name,
    required this.language,
    required this.avatarBgColor,
  });
}

class FamilyManagementList extends StatelessWidget {
  final List<ChildProfileData> children = [
    ChildProfileData(
      name: 'Samuel',
      language: 'Default (English)',
      avatarBgColor: const Color(0xFFE6C387),
    ),
    ChildProfileData(
      name: 'Abigail',
      language: 'French Override',
      avatarBgColor: const Color(0xFFB4CBE2),
    ),
  ];

  FamilyManagementList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: children.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final child = children[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: child.avatarBgColor,
            child: Text(
              child.name[0],
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          title: Text(
            child.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: [
              const Icon(Icons.translate, size: 14, color: Colors.black54),
              const SizedBox(width: 4),
              Text(child.language),
            ],
          ),
          trailing: IconButton(
            icon: const Icon(Icons.edit_outlined, color: Colors.black54),
            onPressed: () {
              // Action d'édition
            },
          ),
        );
      },
    );
  }
}
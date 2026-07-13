import 'package:flutter/material.dart';

class AccountMenuItemData {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const AccountMenuItemData({
    required this.icon,
    required this.label,
    this.onTap,
  });
}

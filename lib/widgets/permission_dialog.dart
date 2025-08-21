import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
class _PermissionDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: theme.brightness == Brightness.dark ? Colors.grey[900] : Colors.white,
      title: Row(
        children: [
          Icon(Icons.directions_walk, color: Colors.blue),
          const SizedBox(width: 8),
          Text("Permission Required", style: theme.textTheme.titleMedium),
        ],
      ),
      content: Text(
        "To track your steps and activity, please allow Physical Activity permission.",
        style: theme.textTheme.bodyMedium,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text("Not Now", style: TextStyle(color: Colors.grey)),
        ),
        ElevatedButton(
          onPressed: () async {
            Navigator.of(context).pop();
            final result = await Permission.activityRecognition.request();
            if (!result.isGranted) {
            }
          },
          child: Text("Allow"),
        ),
      ],
    );
  }
}
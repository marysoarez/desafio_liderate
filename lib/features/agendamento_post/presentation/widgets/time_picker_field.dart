import 'package:flutter/material.dart';

class TimePickerField extends StatelessWidget {
  final String label;
  final TimeOfDay? selectedTime;
  final Function(TimeOfDay) onTimeSelected;

  const TimePickerField({
    super.key,
    required this.label,
    required this.selectedTime,
    required this.onTimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        selectedTime == null
            ? label
            : 'Hora: ${selectedTime!.format(context)}',
      ),
      trailing: const Icon(Icons.access_time),
      onTap: () async {
        final time = await showTimePicker(
          context: context,
          initialTime: selectedTime ?? TimeOfDay.now(),
        );
        if (time != null) onTimeSelected(time);
      },
    );
  }
}

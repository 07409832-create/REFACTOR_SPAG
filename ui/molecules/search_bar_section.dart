import 'package:flutter/material.dart';
import '../atoms/section_header_text.dart';
import '../atoms/search_input_field.dart';

/// Molecule: combines the "Search Products" heading with the search
/// input into one reusable unit. It forwards keystrokes upward and
/// holds no business logic — just composition of two atoms.
class SearchBarSection extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const SearchBarSection({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeaderText('Search Products'),
        const SizedBox(height: 8),
        SearchInputField(onChanged: onChanged),
      ],
    );
  }
}

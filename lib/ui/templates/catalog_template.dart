import 'package:flutter/material.dart';
import '../atoms/app_bar_title_text.dart';

/// Template: the page-level layout skeleton (AppBar + scrollable body
/// + spacing/divider arrangement). It accepts pre-built widgets as
/// slots — it never imports the Product model or knows anything about
/// catalog data, per the "templates never import a data model" rule.
class CatalogTemplate extends StatelessWidget {
  final String appBarTitle;
  final Widget searchSlot;
  final Widget catalogSlot;
  final Widget formSlot;

  const CatalogTemplate({
    super.key,
    required this.appBarTitle,
    required this.searchSlot,
    required this.catalogSlot,
    required this.formSlot,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitleText(appBarTitle),
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchSlot,
            const SizedBox(height: 16),
            catalogSlot,
            const Divider(height: 32, thickness: 1),
            formSlot,
          ],
        ),
      ),
    );
  }
}

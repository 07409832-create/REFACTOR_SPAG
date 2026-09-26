import 'package:flutter/material.dart';
import '../atoms/section_header_text.dart';
import '../atoms/app_text_form_field.dart';
import '../atoms/category_dropdown_field.dart';
import '../atoms/primary_button.dart';

/// Organism: the full "Add New Product" form. It owns form-local state
/// (the Form key, the text controllers, the selected category) and
/// the field validation rules, because none of that is the app's core
/// data — it's UI state that belongs to this input surface and would
/// be meaningless outside it.
///
/// On a valid submit it hands the raw field values up to [onSubmit]
/// and resets its own fields. It never creates a Product, assigns an
/// id, or touches the master product list — that stays with the Page.
class AddProductForm extends StatefulWidget {
  final void Function(
    String name,
    double price,
    String category,
    String description,
  ) onSubmit;

  const AddProductForm({super.key, required this.onSubmit});

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  static const _categories = ['Electronics', 'Home', 'Office', 'Accessories'];
  static const _defaultCategory = 'Electronics';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController =
      TextEditingController();
  String _selectedCategory = _defaultCategory;

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Product name is required';
    }
    return null;
  }

  String? _validatePrice(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Price is required';
    }
    final parsed = double.tryParse(value);
    if (parsed == null) {
      return 'Price must be a number';
    }
    if (parsed <= 0) {
      return 'Price must be greater than zero';
    }
    return null;
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      widget.onSubmit(
        _nameController.text,
        double.parse(_priceController.text),
        _selectedCategory,
        _descriptionController.text,
      );

      setState(() {
        _nameController.clear();
        _priceController.clear();
        _descriptionController.clear();
        _selectedCategory = _defaultCategory;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeaderText('Add New Product'),
        const SizedBox(height: 12),
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextFormField(
                controller: _nameController,
                labelText: 'Product Name',
                validator: _validateName,
              ),
              const SizedBox(height: 12),
              AppTextFormField(
                controller: _priceController,
                labelText: 'Price',
                keyboardType: TextInputType.number,
                validator: _validatePrice,
              ),
              const SizedBox(height: 12),
              CategoryDropdownField(
                value: _selectedCategory,
                categories: _categories,
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value ?? _defaultCategory;
                  });
                },
              ),
              const SizedBox(height: 12),
              AppTextFormField(
                controller: _descriptionController,
                labelText: 'Description',
                maxLines: 3,
                alignLabelWithHint: true,
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                label: 'Submit Product',
                onPressed: _handleSubmit,
                fullWidth: true,
                boldLabel: true,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

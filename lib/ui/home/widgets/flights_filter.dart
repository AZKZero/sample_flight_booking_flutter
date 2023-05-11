import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FlightsFilter extends StatelessWidget {
  final List<String> locations = ['Dhaka', 'Essen', 'Chittagong'];
  late final GlobalKey<FormBuilderState> _formKey;

  FlightsFilter({super.key, required GlobalKey<FormBuilderState> formKey}) {
    _formKey = formKey;
  }
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Row(
        children: <Widget>[
          Expanded(
            child: FormBuilderDropdown(
              items: [
                const DropdownMenuItem(
                  alignment: AlignmentDirectional.center,
                  value: null,
                  child: Text('All'),
                ),
                ...locations
                    .map((location) => DropdownMenuItem(
                          alignment: AlignmentDirectional.center,
                          value: location,
                          child: Text(location),
                        ))
                    .toList()
              ],
              name: 'from',
            ),
          ),
          Expanded(
            child: FormBuilderDropdown(
              items: [
                const DropdownMenuItem(
                  alignment: AlignmentDirectional.center,
                  value: null,
                  child: Text('All'),
                ),
                ...locations
                    .map((location) => DropdownMenuItem(
                          alignment: AlignmentDirectional.center,
                          value: location,
                          child: Text(location),
                        ))
                    .toList()
              ],
              name: 'to',
            ),
          ),
        ],
      ),
    );
  }
}

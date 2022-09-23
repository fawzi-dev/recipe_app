import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:recipe_app/components/grocery_tile.dart';
import 'package:recipe_app/models/grocery_item.dart';
import 'package:uuid/uuid.dart';

import '../models/fooderlich_pages.dart';

class GroceryItemScreen extends StatefulWidget {
  final Function(GroceryItem) onCreate;

  final Function(GroceryItem) onUpdate;

  final GroceryItem? item;

  final bool isUpdating;

  final int index;

  static MaterialPage page(
      {GroceryItem? item,
      int index = -1,
      required Function(GroceryItem) onCreate,
      required Function(GroceryItem) onUpdate}) {
    return MaterialPage(
      name: FooderlichPages.splashPath,
      key: ValueKey(FooderlichPages.splashPath),
      child: GroceryItemScreen(
        item: item,
        index: index,
        onCreate: onCreate,
        onUpdate: onCreate,
      ),
    );
  }

  const GroceryItemScreen({
    Key? key,
    required this.onCreate,
    required this.onUpdate,
    this.index = -1,
    this.item,
  })  : isUpdating = (item != null),
        super(key: key);

  @override
  State<GroceryItemScreen> createState() => _GroceryItemScreenState();
}

class _GroceryItemScreenState extends State<GroceryItemScreen> {
  // TODO: Add Grocery Item screen state properties
  final _nameController = TextEditingController();
  String _name = '';
  Importance _importance = Importance.low;
  DateTime _dueTime = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();
  Color _currentColor = Colors.green;
  int _currentSliderValue = 0;

  // TODO: Add initState()
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    final originalItem = widget.item;
    if (originalItem != null) {
      _nameController.text = originalItem.name;
      _name = originalItem.name;
      _currentSliderValue = originalItem.quantity;
      _importance = originalItem.importance;
      final date = originalItem.dateTime;
      _dueTime = date;
      _currentColor = originalItem.color;
      _timeOfDay = TimeOfDay(hour: date.hour, minute: date.minute);

      _nameController.addListener(() {
        setState(() {
          _name = _nameController.text;
        });
      });
    }
  }

  // TODO: Add dispose()
  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    super.dispose();
  }

  // --------------- Other Controller

  @override
  Widget build(BuildContext context) {
    // TODO: Add GroceryItemScreen Scaffold
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              final groceryItem = GroceryItem(
                id: widget.item?.id ?? const Uuid().v1(),
                name: _nameController.text,
                importance: _importance,
                color: _currentColor,
                quantity: _currentSliderValue,
                dateTime: DateTime(_dueTime.year, _dueTime.month, _dueTime.day,
                    _timeOfDay.hour, _timeOfDay.minute),
              );

              if (widget.isUpdating) {
                widget.onUpdate(groceryItem);
              } else {
                widget.onCreate(groceryItem);
              }
            },
            icon: const Icon(Icons.check),
          ),
        ],
        elevation: 0.0,
        title: Text(
          'Grocery Item',
          style: GoogleFonts.lato(fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              buildNameField(),
              const SizedBox(
                height: 10.0,
              ),

              buildImportanceField(),
              const SizedBox(
                height: 10.0,
              ),

              buildDateField(),
              const SizedBox(
                height: 10.0,
              ),

              buildTimeField(),
              const SizedBox(
                height: 10.0,
              ),

              buildColorPicker(),
              const SizedBox(
                height: 10.0,
              ),
              buildQuanityField(),

              // TODO: 19: Add Grocery Tile
              GroceryTile(
                item: GroceryItem(
                  id: 'preview Moed',
                  name: _nameController.text,
                  importance: _importance,
                  color: _currentColor,
                  quantity: _currentSliderValue,
                  dateTime: DateTime(
                    _dueTime.year,
                    _dueTime.month,
                    _dueTime.day,
                    _timeOfDay.hour,
                    _timeOfDay.minute,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //TODO: buildNameField()
  Widget buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Item Name',
          style: GoogleFonts.roboto(fontSize: 28.0),
        ),
        TextField(
          controller: _nameController,
          cursorColor: _currentColor,
          decoration: InputDecoration(
              hintText: 'E.g. Appeles, Banana, 1 Bag of salt',
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: _currentColor),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: _currentColor),
              )),
        )
      ],
    );
  }

  //TODO: buildImportanceField()
  Widget buildImportanceField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Importance',
          style: GoogleFonts.roboto(fontSize: 28.0),
        ),
        Wrap(
          spacing: 10,
          children: [
            ChoiceChip(
              selectedColor: Colors.black,
              label: const Text(
                'low',
              ),
              labelStyle: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              selected: _importance == Importance.low,
              onSelected: (value) {
                setState(() => _importance = Importance.low);
              },
            ),
            ChoiceChip(
              selectedColor: Colors.black,
              label: const Text(
                'medium',
              ),
              labelStyle: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              selected: _importance == Importance.medium,
              onSelected: (value) {
                setState(() => _importance = Importance.medium);
              },
            ),
            ChoiceChip(
              selectedColor: Colors.black,
              label: const Text(
                'high',
              ),
              labelStyle: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              selected: _importance == Importance.high,
              onSelected: (value) {
                setState(() => _importance = Importance.high);
              },
            )
          ],
        )
      ],
    );
  }

  //TODO: buildDateField()
  Widget buildDateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Date',
              style: GoogleFonts.roboto(fontSize: 28.0),
            ),
            TextButton(
              onPressed: () async {
                final currentDate = DateTime.now();
                final dateTime = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: currentDate,
                  lastDate: DateTime(currentDate.year + 5),
                );

                setState(() {
                  if (dateTime != null) {
                    _dueTime = dateTime;
                  }
                });
              },
              child: const Text('Select'),
            ),
          ],
        ),
        Text(
          DateFormat('yyyy-MM-dd').format(_dueTime),
        )
      ],
    );
  }

  //TODO: buildTimeField
  Widget buildTimeField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Time Of Day',
              style: GoogleFonts.roboto(fontSize: 28.0),
            ),
            TextButton(
              onPressed: () async {
                final currentTimeOfTheDay = TimeOfDay.now();
                final timeOfTheDay = await showTimePicker(
                    context: context, initialTime: currentTimeOfTheDay);

                setState(() {
                  if (timeOfTheDay != null) {
                    _timeOfDay = timeOfTheDay;
                  }
                });
              },
              child: const Text('Select'),
            ),
          ],
        ),
        Text(
          _timeOfDay.format(context),
        )
      ],
    );
  }

  //TODO: buildColorPicker()
  Widget buildColorPicker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 50,
              width: 10,
              color: _currentColor,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              'Color',
              style: GoogleFonts.roboto(fontSize: 28.0),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: BlockPicker(
                        pickerColor: Colors.white,
                        onColorChanged: (color) {
                          setState(() {
                            _currentColor = color;
                          });
                        }),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Save'),
                      )
                    ],
                  );
                });
          },
          child: const Text('Select'),
        ),
      ],
    );
  }

  //TODO: buildQuanityField()
  Widget buildQuanityField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Row(
          children: [
            Text(
              'Qunatity',
              style: GoogleFonts.roboto(fontSize: 28.0),
            ),
            const SizedBox(
              width: 10,
            ),
            Text('$_currentSliderValue', style: GoogleFonts.lato(fontSize: 18))
          ],
        ),
        Slider(
            value: _currentSliderValue.toDouble(),
            min: 0,
            max: 100,
            activeColor: Colors.green,
            inactiveColor: Colors.green[100],
            divisions: 100,
            label: '$_currentSliderValue',
            onChanged: (value) {
              setState(() {
                _currentSliderValue = value.toInt();
                print(_currentSliderValue);
              });
            })
      ],
    );
  }
}

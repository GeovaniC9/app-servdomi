import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutterservidomisti/src/pages/admin/categories/create/admin_categories_create_controller.dart';
import 'package:flutterservidomisti/src/utils/my_colors.dart';

class AdminCategoriesCreatePage extends StatefulWidget {
  const AdminCategoriesCreatePage({Key key}) : super(key: key);

  @override
  _AdminCategoriesCreatePageState createState() =>
      _AdminCategoriesCreatePageState();
}

class _AdminCategoriesCreatePageState extends State<AdminCategoriesCreatePage> {
  AdminCategoriesCreateController _con = new AdminCategoriesCreateController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nueva categoria'),
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          _textFieldName(),
          _textFieldDescription()
        ],
      ),
      bottomNavigationBar: _buttonCreate(),
    );
  }

  Widget _textFieldName() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        controller: _con.nameController,
        decoration: InputDecoration(
            hintText: 'Nombre de la categoria',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(color: MyColors.primaryColorDark),
            suffixIcon: Icon(
              Icons.list_alt,
              color: MyColors.primaryColor,
            )),
      ),
    );
  }

  Widget _textFieldDescription() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        controller: _con.descriptionController,
        maxLines: 3,
        maxLength: 255,
        decoration: InputDecoration(
          hintText: 'Descripcion de la categoria',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          hintStyle: TextStyle(color: MyColors.primaryColorDark),
          suffixIcon: Icon(
            Icons.description,
            color: MyColors.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _buttonCreate() {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: ElevatedButton(
        onPressed: _con.createCategory,
        child: Text('CREAR CATEGORIA'),
        style: ElevatedButton.styleFrom(
            primary: MyColors.primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: EdgeInsets.symmetric(vertical: 15)),
      ),
    );
  }

  void refresh() {
    setState(() {}); 
  }
}

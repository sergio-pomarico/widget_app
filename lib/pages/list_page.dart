import 'package:flutter/material.dart';

import 'dart:async';

class ListPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _numberList = [];
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _addTenImages();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List pages'),
        ),
        body: Stack(
          children: <Widget>[_createList(), _createLoading()],
        ));
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: getPageOne,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _numberList.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _numberList[index];

          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
    );
  }

  Future<Null> getPageOne() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _numberList.clear();
      _lastItem++;
      _addTenImages();
    });

    return Future.delayed(duration);
  }

  void _addTenImages() {
    for (var i = 1; i < 10; i++) {
      _lastItem++;
      _numberList.add(_lastItem);
    }

    setState(() {});
  }

  Future<void> fetchData() async {
    _isLoading = true;
    setState(() {});
    respuestaHTTP();
  }

  void respuestaHTTP() {
    _isLoading = false;

    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 250));
    _addTenImages();
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
          SizedBox(height: 15.0)
        ],
      );
    } else {
      return SizedBox();
    }
  }
}

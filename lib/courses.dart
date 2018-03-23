import 'package:flutter/material.dart';

class CoursePage extends StatefulWidget{
  @override
  State createState() => new CoursePageState();
}

class CoursePageState extends State<CoursePage>{
  final _suggestions = <Entry>[];

  final saved = new Set<Entry>();

  final _biggerFont = const TextStyle(fontSize: 18.0);
  
  void addToSaved(Entry value){
    saved.add(value);
  }
  
  bool alreadySaved(Entry value){
    return saved.contains(value);
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = saved.map(
                (EntryItem) {
              return new ListTile(
                  title: new Text(
                    EntryItem./*entry.*/title,
                    style: _biggerFont,
                  ),
              );
            },
          );
          final divided = ListTile
              .divideTiles(
            context: context,
            tiles: tiles,
          )
              .toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text('Courses'),
            actions: <Widget>[
             new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
            ],),
        body: new ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
          _buildTiles(data[index]),
          itemCount: data.length,
        )
    );
  }
  Widget _buildTiles(Entry root) {

  final alreadySaved = saved.contains(root);

  if (root.children.isEmpty)
  return new ListTile(
  title: new Text(root.title),
  trailing: new Icon(
  alreadySaved ? Icons.favorite : Icons.favorite_border,
  color: alreadySaved ? Colors.red : null,
  ),
          onTap: () {
            setState( () {
                if (alreadySaved){
                  saved.remove(root);
                } else {
                  saved.add(root);
                }
              },
            );
          },
  );
  return new ExpansionTile(
  key: new PageStorageKey<Entry>(root),
  title: new Text(root.title),
  children: root.children.map(_buildTiles).toList(),
  );
  }

}

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);
  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  new Entry('FK 1',
    <Entry>[
      new Entry('Section A0',
        <Entry>[
          new Entry('Item A0.1'),
          new Entry('Item A0.2'),
          new Entry('Item A0.3'),
        ],
      ),
      new Entry('Section A1'),
      new Entry('Section A2'),
    ],
  ),
  new Entry('FK 2',
    <Entry>[
      new Entry('Section B0'),
      new Entry('Section B1'),
    ],
  ),
  new Entry('FK 3',
    <Entry>[
      new Entry('Section C0'),
      new Entry('Section C1'),
      new Entry('Section C2',
      ),
    ],
  ),
  new Entry('FK 4',
    <Entry>[
      new Entry('Section B0'),
      new Entry('Section B1'),
    ],
  ),
  new Entry('FK 5',
    <Entry>[
      new Entry('Section B0'),
      new Entry('Section B1'),
    ],
  ),
  new Entry('FK 6',
    <Entry>[
      new Entry('Section B0'),
      new Entry('Section B1'),
    ],
  ),
  new Entry('FK 7',
    <Entry>[
      new Entry('Section B0'),
      new Entry('Section B1'),
    ],
  ),
  new Entry('FK 8',
    <Entry>[
      new Entry('Section B0'),
      new Entry('Section B1'),
    ],
  ),
  new Entry('FK 9',
    <Entry>[
      new Entry('Section B0'),
      new Entry('Section B1'),
    ],
  ),
  new Entry('FK 10',
    <Entry>[
      new Entry('Section B0'),
      new Entry('Section B1'),
    ],
  ),
  new Entry('FK 11',
    <Entry>[
      new Entry('Section B0'),
      new Entry('Section B1'),
    ],
  ),
  new Entry('FK 12',
    <Entry>[
      new Entry('Section B0'),
      new Entry('Section B1'),
    ],
  ),
  new Entry('FK 13',
    <Entry>[
      new Entry('Section B0'),
      new Entry('Section B1'),
    ],
  ),

];
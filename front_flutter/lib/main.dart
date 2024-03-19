import 'package:flutter/material.dart';
import 'package:front_flutter/api/api.dart';
import 'package:front_flutter/todo_form.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final todoP = Provider.of<TodoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 2, 24, 43),
        title: Text(
          "RECUP PRODUIT DEPUIS DJANGO",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: todoP.todos.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    width: 300,
                    height: 250,
                    color: const Color.fromARGB(255, 207, 206, 206),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 150,
                          color: Colors.black12,
                          width: double.infinity,
                          child: Image.network(todoP.todos[index].image),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(todoP.todos[index].title),
                      ),
                      Text(todoP.todos[index].title),
                    ]),
                  )
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createTodo,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void createTodo() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TodoForm()));
  }
}

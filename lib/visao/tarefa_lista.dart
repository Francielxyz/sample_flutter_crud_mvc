import 'package:flutter/material.dart';
import 'package:flutter_crud_mvc/controle/tarefa_conotrole.dart';
import 'package:flutter_crud_mvc/modelo/tarefa.dart';



class TarefaLista extends StatelessWidget{
  final controle = TarefaControle();
  TarefaLista({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(   
      appBar: AppBar(
        // Liskov substitution principle
        //  Aqui, passamos no parametro title um objeto da classe Text. Neste caso a classe AppBar espera receber um widget neste parametro, 
        //  como a classe Text extende de Widget, esta é aceita como tal,.
        title: const Text('Lista Tarefas'),
        actions: [ 
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.pushNamed(context, '/tarefaForm').then((value) => controle.listar()) )
        ],
      ),
      body: FutureBuilder(
        future: controle.listar(),
        builder: (context,  AsyncSnapshot<List<Tarefa>> snapshot){
          if(!snapshot.hasData) return const CircularProgressIndicator();
          var lista = snapshot.data!;
          return ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, contador){
                var tarefa = lista[contador];
                return ListTile( 
                  title: Text(tarefa.nome),
                  subtitle: Text(tarefa.descricao),
                  trailing: SizedBox( 
                    width: 100,
                    child: Row(  
                      children: [ 
                        IconButton(
                          icon: const Icon(Icons.edit),
                          color: Colors.orange,
                          onPressed: (){},
                        ),
                        
                        IconButton(
                          icon: const Icon(Icons.delete),
                          color: Colors.red,
                          onPressed: (){},
                        )
                      ],
                    ),
                  ),
                );
              }
          );
        }
      )
    );
  }
}
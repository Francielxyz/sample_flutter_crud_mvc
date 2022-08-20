import 'package:flutter_crud_mvc/modelo/sqlite/tarefa_dao_sqlite.dart';
import 'package:flutter_crud_mvc/modelo/tarefa_dao.dart';
import 'package:get_it/get_it.dart';

setupInjection() async{
  GetIt getIt = GetIt.I;
  
  // Dependency Inversion Principle
  //  Aqui, registramos a injeção de dependencia. Onde garantimos que o projeto dependa da interface, 
  //  ou seja da declaração de metodos, e não da implementação em si. Caso seja necessario alterar a 
  //  tecnologia, apenas alteramos a classe injetada, que deve implementar a interface.
  getIt.registerSingleton<TarefaDAO>(TarefaDAOSQLite());
}
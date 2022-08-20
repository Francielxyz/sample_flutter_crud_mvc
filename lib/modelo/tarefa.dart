import 'package:flutter_crud_mvc/modelo/base/modelo.dart';

// Single responsability principle
// • Uma classe, componente, função dever ter
// uma única responsabilidade
// • Ter uma classe que sabe fazer somente aquilo que é especializado
//  Esta classe foi utilizada para REPRESENTAR uma tarefa, e nesta, podemos identificar 
//  que temos apenas as propriedades que definem uma tarefa
class Tarefa extends Modelo {
  final String nome;
  final String descricao;
  final DateTime dataEntrega;

  Tarefa({required id,required this.nome,required this.descricao,required this.dataEntrega}) : super(id);
}
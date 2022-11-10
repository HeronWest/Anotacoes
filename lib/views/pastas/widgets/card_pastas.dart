// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:provider/provider.dart';
// import '../../../stores/anotacao_store.dart';
// import '../../../stores/pasta_store.dart';
// import 'dialog_anotacao.dart';
// import 'dialog_excluir.dart';
//
// class CardAnotacoes extends StatefulWidget {
//   const CardAnotacoes({Key? key}) : super(key: key);
//
//   @override
//   State<CardAnotacoes> createState() => _CardAnotacoesState();
// }
//
// class _CardAnotacoesState extends State<CardAnotacoes> {
//   late PastaStore _pastaStore;
//   void didChangeDependencies() async {
//     super.didChangeDependencies();
//     _pastaStore = Provider.of<PastaStore>(context);
//     // await _pastaStore.pegarAnotacoes();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Observer(builder: (context) {
//       return ListView.builder(
//           // itemCount: _pastaStore.anotacoes.length,
//           itemBuilder: (BuildContext context, int index) {
//             return InkWell(
//               onTap: () {
//                 // _pastaStore.setTitulo(_pastaStore.anotacoes[index].titulo);
//                 // _pastaStore.setDescricao(_pastaStore.anotacoes[index].descricao);
//                 // showDialog(
//                 //     context: context,
//                 //     builder: (BuildContext context) {
//                 //       return DialogAnotacao();
//                 //     });
//               },
//               child: Card(
//                 color: Color.fromARGB(255, 243, 243, 243),
//                 child: ListTile(
//                   leading: PopupMenuButton(
//                       icon: const Icon(
//                         Icons.edit_note,
//                         size: 30,
//                         color: Colors.brown,
//                       ),
//                       itemBuilder: (context) => [
//                             PopupMenuItem(
//                                 child: TextButton(
//                               onPressed: () async {
//                                 Navigator.of(context).pop();
//                                 // _pastaStore.id = _pastaStore.anotacoes[index].id!;
//                                 // _pastaStore.titulo = _pastaStore.anotacoes[index].titulo!;
//                                 // _pastaStore.descricao = _pastaStore.anotacoes[index].descricao!;
//                                 Navigator.of(context).pushNamed('/editar_anotacao');
//
//                               },
//                               child: const Text('EDITAR'),
//                             )),
//                             PopupMenuItem(
//                               child: TextButton(
//                                   onPressed: () {
//                                     Navigator.of(context).pop();
//                                     // _pastaStore.id = _pastaStore.anotacoes[index].id!;
//                                     // _pastaStore.titulo = _pastaStore.anotacoes[index].titulo!;
//                                     // showDialog(
//                                     //     context: context,
//                                     //     builder: (BuildContext context) {
//                                     //       return DialogExcluir();
//                                     //     });
//                                   },
//                                   child: Text('EXCLUIR')),
//                             )
//                           ]),
//                   title: Text(_pastaStore.anotacoes[index].titulo!,
//                       style: TextStyle(color: Colors.brown)),
//                   subtitle: Text(
//                     _pastaStore.anotacoes[index].descricao!,
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   isThreeLine: true,
//                 ),
//               ),
//             );
//           });
//     });
//   }
// }

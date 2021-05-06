import 'package:flutter/material.dart';

// *************************************************************************      MAIN   ************************************************************
void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CASTRO.Lab',
      home: TelaPrincipal(),
      routes: {
        '/comentariosEQP01': (context) => Teste(),
        '/menu': (context) => TerceiraTela(),
      },
      theme: ThemeData(
          primaryColor: Colors.purple[900],
          backgroundColor: Colors.grey[200],
          fontFamily: 'Palatino',
          textTheme: TextTheme(
              headline1: TextStyle(fontSize: 20, color: Colors.white),
              headline2: TextStyle(fontSize: 18, color: Colors.purple[900])))));
}

//  ***************************************************************************   TELA DE LOGIN *****************************************************
class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  //Armazena os valores digitados pelo usuário
  var txtLogin = TextEditingController();
  var txtSenha = TextEditingController();
  //Chave que identifica unicamente o formulário
  //var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Text('CASTRO.Lab', style: Theme.of(context).textTheme.headline1),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Container(
          padding: EdgeInsets.all(30),
          child: Form(
            child: Column(children: [
              Icon(Icons.people,
                  size: 90, color: Theme.of(context).primaryColor),
              campoTexto('Login: ', txtLogin),
              campoTexto('Senha: ', txtSenha),
              botao('Entrar'),
            ]),
          ),
        ));
  }

  //   WIDGET CAMPO DE TEXTO
  Widget campoTexto(rotulo, variavel) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: variavel, // quem vai armazenar os dados do login e senha
        style: TextStyle(fontSize: 20),

        decoration: InputDecoration(
          labelText: rotulo,
          labelStyle: Theme.of(context).textTheme.headline2,
          hintText: 'Insira seus dados',
          hintStyle: TextStyle(fontSize: 20),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

//  WIDGET DE BOTAO
  Widget botao(rotulo) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 26),
      width: 200,
      height: 100,
      child: ElevatedButton(
        child: Text(
          rotulo,
          style: TextStyle(fontSize: 18),
        ),
        style:
            ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
        onPressed: () {
          print('login efetuado');

        setState(() {
                    var msg = Mensagem(txtLogin.text);

                    Navigator.pushNamed(context, '/menu',
                        arguments: msg);
                  });


          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TerceiraTela()));
        },
      ),
    );
  }
}

//  ***************************************************************************   SEGUNDA TELA  - INFO DO DESENVOLVEDOR ************************************

class SegundaTela extends StatefulWidget {
  @override
  _SegundaTelaState createState() => _SegundaTelaState();
}

class _SegundaTelaState extends State<SegundaTela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Text('CASTRO.Lab', style: Theme.of(context).textTheme.headline1),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Container(
            padding: EdgeInsets.all(50),
            child: Column(
              children: [
                Text('Aplicativo devesevolvido por Jade Castro \n \n'),
                FotoWidget('lib/imagens/fotodesenvolvedor.jpeg'),
                SizedBox(height: 25),
                Text(
                    'Doutoranda em Química e estudante de Análise Desenvolvimento de Sistemas, '),
                Text(
                    'desenvolveu este software visando a otimização da gestão laboratorial'),
                SizedBox(height: 50),
                ElevatedButton(
                  child: Text('Menu principal'),
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor),
                  onPressed: () {
                    print('Botao seguir para menu  principal pressionado');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TerceiraTela()));
                  },
                )
              ],
            )));
  }
}

//  ***************************************************************************   TERCEIRA TELA / MENU PRINCIPAL ****************************************

class TerceiraTela extends StatefulWidget {
  @override
  _TerceiraTelaState createState() => _TerceiraTelaState();
}

class _TerceiraTelaState extends State<TerceiraTela> {
  @override
  Widget build(BuildContext context) {


    
    return Scaffold(
        appBar: AppBar(
          title:
              Text('CASTRO.Lab', style: Theme.of(context).textTheme.headline1),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Container(
            padding: EdgeInsets.all(30),
            child: Column(children: [
              FotoWidget('lib/imagens/quimica.png'),
              SizedBox(height: 50),
              ElevatedButton(
                child: Text('Equipamento 06715'),
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                onPressed: () {
                  print('Botao Equipamento 06715pressionado');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EQP06715()));
                },
              ),
              SizedBox(height: 50),
              ElevatedButton(
                child: Text('Equipamento B3PW'),
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                onPressed: () {
                  print('Botao Equipamento B3PW pressionado');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TerceiraTela()));
                },
              ),
              SizedBox(height: 50),
              ElevatedButton(
                child: Text('Informações'),
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                onPressed: () {
                  print('Botao de informações pressionado');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SegundaTela()));
                },
              ),
              SizedBox(height: 100),
              ElevatedButton(
                child: Text('SAIR'),
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                onPressed: () {
                  print('Botao sair pressionado');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TelaPrincipal()));
                },
              ),
            ])));
  }
}

//  ***************************************************************************   TELA Equipamento 06715  **********************************************

class Mensagem {
  final String comentario;
  Mensagem(this.comentario);
}

class EQP06715 extends StatefulWidget {
  @override
  _EQP06715State createState() => _EQP06715State();
}

class _EQP06715State extends State<EQP06715> {
// VARIAVEL DE CONTROLE
  var txtComentario = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Equipamento 06715',
            style: Theme.of(context).textTheme.headline1),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              SizedBox(height: 50),
              ElevatedButton(
                child: Text('Controle de usuários'),
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                onPressed: () {
                  print('Botao Controle de usuários pressionado');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ControleDeUsuario()));
                },
              ),
              SizedBox(height: 50),
              ElevatedButton(
                child: Text('Agendamento'),
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                onPressed: () {
                  print('Botao de agendamento pressionado');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Agendamento()));
                },
              ),
              SizedBox(height: 50),
              Text('Observação: \n \n'),
              TextField(
                controller: txtComentario,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                decoration: InputDecoration(
                    labelText: 'Insira seu Comentário: ',
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Enviar'),
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                onPressed: () {
                  print('Botao Enviar comentario Pressionado');

                  setState(() {
                    var msg = Mensagem(txtComentario.text);

                    Navigator.pushNamed(context, '/comentariosEQP01',
                        arguments: msg);
                  });
                },
              ),
              SizedBox(height: 50),
              ElevatedButton(
                child: Text('Histórico de comentários'),
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                onPressed: () {
                  print('Botao Histórico de comentários pressionado');

                  setState(() {
                    var msg = Mensagem(txtComentario.text);

                    Navigator.pushNamed(context, '/comentariosEQP01',
                        arguments: msg);
                  });
                },
              ),
              SizedBox(height: 100),
              ElevatedButton(
                child: Text('Menu principal'),
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                onPressed: () {
                  print('Botao seguir para menu  principal pressionado');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TerceiraTela()));
                },
              )
            ],
          )),
    );
  }
}

// ****************************************************************************    CONTROLE DE USUARIO *******************************************************
class ControleDeUsuario extends StatefulWidget {
  @override
  _ControleDeUsuarioState createState() => _ControleDeUsuarioState();
}

class _ControleDeUsuarioState extends State<ControleDeUsuario> {
  var lista = [];

  var txtUsuario = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Controle de Usuário',
              style: Theme.of(context).textTheme.headline1),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Container(
            padding: EdgeInsets.all(40),
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: txtUsuario,
                        style: TextStyle(fontSize: 24),
                        decoration: InputDecoration(
                          labelText: 'Adicionar Usuário',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add_box, color: Colors.purple[900]),
                      onPressed: () {
                        setState(() {
                          if (txtUsuario.text.isNotEmpty) {
                            lista.add(txtUsuario.text);
                            txtUsuario.clear();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Usuário adicionada com sucesso!'),
                              duration: Duration(seconds: 2),
                            ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Você precisa inserir os dados.'),
                              duration: Duration(seconds: 2),
                            ));
                          }
                        });
                      },
                    )
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.separated(
                    reverse: true,
                    //Aparência do item da lista
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          lista[index],
                          style: TextStyle(fontSize: 18),
                        ),

                        // REMOVE O USUARIO
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              lista.removeAt(index);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('Usuario removido com sucesso.'),
                                duration: Duration(seconds: 2),
                              ));
                            });
                          },
                        ),
                      );
                    },

                    //Aparência do divisor
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Colors.purple[900],
                        thickness: 1,
                      );
                    },

                    //total de itens da lista
                    itemCount: lista.length,
                  ),
                ),
              ],
            )));
  }
}

//  ***************************************************************************    TELA QUE RECEBE O COMENTARIO  ***************************************************

class Teste extends StatefulWidget {
  @override
  _TesteState createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  @override
  Widget build(BuildContext context) {
    // puxando os dados do comentarios
    final Mensagem msg = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text('Comentarios Equipamento 06715',
              style: Theme.of(context).textTheme.headline1),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Container(
            padding: EdgeInsets.all(40),
            width: double.infinity,
            child: Column(
              children: [
                Text('Histórico de comentarios:',
                    style: TextStyle(fontSize: 18)),
                SizedBox(height: 25),
                if (msg.comentario != null) Text(msg.comentario),
              ],
            )));
  }
}

// ******************************************************************************** FOTO ********************************
class FotoWidget extends StatelessWidget {
  //atributos
  final String foto;

  //construtor
  FotoWidget(this.foto);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        children: [
          Image.asset(foto),
        ],
      )),
    );
  }
}

// ***************************************************************************      AGENDAMENTO ****************************
class Agendamento extends StatefulWidget {
  @override
  _AgendamentoState createState() => _AgendamentoState();
}


class _AgendamentoState extends State<Agendamento> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Agendamento  E06715',
            style: Theme.of(context).textTheme.headline1),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,


        body:  Container(
          padding: EdgeInsets.all(30),
          child: Form(
            child: Column(children: [
              Icon(Icons.calendar_today, size: 300, color: Theme.of(context).primaryColor),
             
            ]),
          ),
        ));

      }
}

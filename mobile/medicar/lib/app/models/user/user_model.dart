class UserModel {
  User user;
  String cpf;
  String telefone;
  String dataDeNascimento;
  double altura;
  double peso;
  String genero;
  String objetivo;
  AvaliacaoFisica avaliacaoFisica;

  UserModel({
    this.user,
    this.cpf,
    this.telefone,
    this.dataDeNascimento,
    this.altura,
    this.peso,
    this.genero,
    this.objetivo,
    this.avaliacaoFisica,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    cpf = json['cpf'];
    telefone = json['telefone'];
    dataDeNascimento = json['data_de_nascimento'];
    altura = json['altura'];
    peso = json['peso'];
    genero = json['genero'];
    objetivo = json['objetivo'];
    avaliacaoFisica = json['avaliacao_fisica'] != null
        ? new AvaliacaoFisica.fromJson(json['avaliacao_fisica'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['cpf'] = this.cpf;
    data['telefone'] = this.telefone;
    data['data_de_nascimento'] = this.dataDeNascimento;
    data['altura'] = this.altura;
    data['peso'] = this.peso;
    data['genero'] = this.genero;
    data['objetivo'] = this.objetivo;
    if (this.avaliacaoFisica != null) {
      data['avaliacao_fisica'] = this.avaliacaoFisica.toJson();
    }
    return data;
  }
}

class User {
  int id;
  String firstName;
  String username;
  String email;

  User({
    this.id,
    this.firstName,
    this.username,
    this.email,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    username = json['username'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['username'] = this.username;
    data['email'] = this.email;
    return data;
  }
}

class AvaliacaoFisica {
  double ombro;
  double peitoral;
  double bracoDireito;
  double bracoEsquerdo;
  double cintura;
  double quadril;
  double coxaDireita;
  double coxaEsquerda;
  double panturrilhaDireita;
  double panturrilhaEsquerda;

  AvaliacaoFisica({
    this.ombro,
    this.peitoral,
    this.bracoDireito,
    this.bracoEsquerdo,
    this.cintura,
    this.quadril,
    this.coxaDireita,
    this.coxaEsquerda,
    this.panturrilhaDireita,
    this.panturrilhaEsquerda,
  });

  AvaliacaoFisica.fromJson(Map<String, dynamic> json) {
    ombro = json['ombro'];
    peitoral = json['peitoral'];
    bracoDireito = json['braco_direito'];
    bracoEsquerdo = json['braco_esquerdo'];
    cintura = json['cintura'];
    quadril = json['quadril'];
    coxaDireita = json['coxa_direita'];
    coxaEsquerda = json['coxa_esquerda'];
    panturrilhaDireita = json['panturrilha_direita'];
    panturrilhaEsquerda = json['panturrilha_esquerda'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ombro'] = this.ombro;
    data['peitoral'] = this.peitoral;
    data['braco_direito'] = this.bracoDireito;
    data['braco_esquerdo'] = this.bracoEsquerdo;
    data['cintura'] = this.cintura;
    data['quadril'] = this.quadril;
    data['coxa_direita'] = this.coxaDireita;
    data['coxa_esquerda'] = this.coxaEsquerda;
    data['panturrilha_direita'] = this.panturrilhaDireita;
    data['panturrilha_esquerda'] = this.panturrilhaEsquerda;
    return data;
  }
}

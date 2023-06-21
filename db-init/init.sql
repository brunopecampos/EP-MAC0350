/*CREATE TABLE pessoa (
    id serial,
    nusp character varying(10) NOT NULL,
    nome character varying(255) NOT NULL,
    PRIMARY KEY(id),
    UNIQUE(nusp)
);

INSERT INTO pessoa(nusp, nome) VALUES ('123456', 'Pessoa teste');

CREATE TABLE perfil (
    id serial,
    codigo character varying(10) NOT NULL,
    descricao character varying(10) NOT NULL,
    PRIMARY KEY(id),
    UNIQUE(codigo)
);

INSERT INTO perfil(codigo, descricao) VALUES ('EST', 'Estudante');

CREATE TABLE pessoaperfil (
    id serial,
    pessoa_id integer NOT NULL,
    perfil_id integer NOT NULL,
    data_inicio timestamp with time zone NOT NULL,
    data_fim timestamp with time zone NOT NULL,
    PRIMARY KEY(id),
    UNIQUE(pessoa_id, perfil_id, data_inicio, data_fim),
    FOREIGN KEY(pessoa_id) REFERENCES pessoa(id),
    FOREIGN KEY(perfil_id) REFERENCES perfil(id)
);

INSERT INTO pessoaperfil(pessoa_id, perfil_id, data_inicio, data_fim) VALUES
(1, 1, '2023-05-01 14:00:00 +03:00', '2023-05-30 10:00:00 +03:00');

CREATE FUNCTION lista_pessoaperfil()
RETURNS SETOF pessoaperfil AS $$
    SELECT * FROM pessoaperfil
    ORDER BY data_inicio;
$$ LANGUAGE SQL;*/

CREATE TABLE pessoa (
  id SERIAL PRIMARY KEY,
  cpf VARCHAR(11) UNIQUE,
  name TEXT,
  endereco TEXT,
  instituicao TEXT,
  login TEXT,
  senha TEXT,
  data_nasc TIMESTAMP
);

CREATE TABLE aluno (
  id SERIAL PRIMARY KEY,
  id_pessoa SERIAL,
  nota_ingresso REAL,
  curso TEXT,
  FOREIGN KEY (id_pessoa) REFERENCES pessoa (id)
);

CREATE TABLE funcionario (
  id SERIAL PRIMARY KEY,
  id_pessoa SERIAL,
  funcao TEXT,
  FOREIGN KEY (id_pessoa) REFERENCES pessoa (id)
);

CREATE TABLE docente (
  id SERIAL PRIMARY KEY,
  id_pessoa SERIAL,
  especialidade TEXT,
  FOREIGN KEY (id_pessoa) REFERENCES pessoa (id)
);

CREATE TABLE perfil (
  id SERIAL PRIMARY KEY,
  codigo TEXT UNIQUE,
  tipo TEXT
);

CREATE TABLE servico (
    id SERIAL PRIMARY KEY,
    id_perfil SERIAL,
    codigo TEXT UNIQUE,
    tipo TEXT,
    descricao TEXT,
    FOREIGN KEY (id_perfil) REFERENCES perfil (id)
);

CREATE TABLE perfil_pessoa (
    id SERIAL PRIMARY KEY,
    id_pessoa SERIAL,
    id_perfil SERIAL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa (id),
    FOREIGN KEY (id_perfil) REFERENCES perfil (id)
);

CREATE TABLE disciplina (
    id SERIAL PRIMARY KEY,
    codigo TEXT UNIQUE,
    ementa TEXT,
    data_criacao TIMESTAMP
);

CREATE TABLE matricula (
    id SERIAL PRIMARY KEY,
    id_aluno SERIAL,
    id_docente SERIAL,
    id_disciplina SERIAL,
    data_ini TIMESTAMP,
    data_fim TIMESTAMP,
    nota REAL,
    FOREIGN KEY (id_aluno) REFERENCES aluno (id),
    FOREIGN KEY (id_docente) REFERENCES docente (id),
    FOREIGN KEY (id_disciplina) REFERENCES disciplina (id)
);
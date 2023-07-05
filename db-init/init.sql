-- CREATE TABLE pessoa (
--     id serial,
--     nusp character varying(10) NOT NULL,
--     nome character varying(255) NOT NULL,
--     PRIMARY KEY(id),
--     UNIQUE(nusp)
-- );

-- INSERT INTO pessoa(nusp, nome) VALUES ('123456', 'Pessoa teste');

-- CREATE TABLE perfil (
--     id serial,
--     codigo character varying(10) NOT NULL,
--     descricao character varying(10) NOT NULL,
--     PRIMARY KEY(id),
--     UNIQUE(codigo)
-- );

-- INSERT INTO perfil(codigo, descricao) VALUES ('EST', 'Estudante');

-- CREATE TABLE pessoaperfil (
--     id serial,
--     pessoa_id integer NOT NULL,
--     perfil_id integer NOT NULL,
--     data_inicio timestamp with time zone NOT NULL,
--     data_fim timestamp with time zone NOT NULL,
--     PRIMARY KEY(id),
--     UNIQUE(pessoa_id, perfil_id, data_inicio, data_fim),
--     FOREIGN KEY(pessoa_id) REFERENCES pessoa(id),
--     FOREIGN KEY(perfil_id) REFERENCES perfil(id)
-- );

-- INSERT INTO pessoaperfil(pessoa_id, perfil_id, data_inicio, data_fim) VALUES
-- (1, 1, '2023-05-01 14:00:00 +03:00', '2023-05-30 10:00:00 +03:00');

-- CREATE FUNCTION lista_pessoaperfil()
-- RETURNS SETOF pessoaperfil AS $$
--     SELECT * FROM pessoaperfil
--     ORDER BY data_inicio;
-- $$ LANGUAGE SQL;

CREATE TABLE pessoa (
  id SERIAL PRIMARY KEY,
  cpf VARCHAR(11) UNIQUE,
  nome TEXT,
  endereco TEXT,
  instituicao TEXT,
  login TEXT,
  senha TEXT,
  dataNasc TEXT
);

INSERT INTO pessoa (cpf, nome, endereco, instituicao, login, senha, dataNasc)
VALUES ('12345678901', 'João Silva', 'Rua Principal, 123', 'Universidade XYZ', 'joaosilva', 'senhasecreta', '2000-01-01 00:00:00');
INSERT INTO pessoa (cpf, nome, endereco, instituicao, login, senha, dataNasc)
VALUES ('2134564901', 'Bruno Ferber', 'Rua Secundaria, 321', 'Universidade ABC', 'bruno', 'senhasecreta', '2003-11-01 04:04:40');
INSERT INTO pessoa (cpf, nome, endereco, instituicao, login, senha, dataNasc)
VALUES ('12399978901', 'Paulo', 'Rua Principal, 321', 'Universidade ABC', 'paulo', 'senhasecreta', '2002-02-02 00:02:02');
INSERT INTO pessoa (cpf, nome, endereco, instituicao, login, senha, dataNasc)
VALUES ('98765432101', 'Maria', 'Avenida Central, 123', 'Universidade XYZ', 'maria', 'senha123', '1990-10-15 08:30:00');
INSERT INTO pessoa (cpf, nome, endereco, instituicao, login, senha, dataNasc)
VALUES ('11122233344', 'Ana', 'Praça Principal, 789', 'Faculdade XYZ', 'ana', 'abcd123', '1998-12-01 18:45:00');
INSERT INTO pessoa (cpf, nome, endereco, instituicao, login, senha, dataNasc)
VALUES ('11111111111', 'Carlos', 'Av. Central, 456', 'Universidade XYZ', 'carlos', 'senha123', '1995-05-15 09:30:00');
INSERT INTO pessoa (cpf, nome, endereco, instituicao, login, senha, dataNasc)
VALUES ('22222222222', 'Juliana', 'Rua Secundária, 789', 'Faculdade ABC', 'juliana', 'abcd123', '1997-08-20 14:45:00');
INSERT INTO pessoa (cpf, nome, endereco, instituicao, login, senha, dataNasc)
VALUES ('33333333333', 'Mariana', 'Rua Principal, 654', 'Universidade XYZ', 'mariana', 'senha456', '1993-12-10 11:00:00');

CREATE TABLE aluno (
  id SERIAL PRIMARY KEY,
  id_pessoa SERIAL,
  nota_ingresso REAL,
  curso TEXT,
  FOREIGN KEY (id_pessoa) REFERENCES pessoa (id)
  ON DELETE CASCADE
);
INSERT INTO aluno (id_pessoa, nota_ingresso, curso)
VALUES (1, 7.8, 'Administração');
INSERT INTO aluno (id_pessoa, nota_ingresso, curso)
VALUES (2, 8.9, 'Medicina');
INSERT INTO aluno (id_pessoa, nota_ingresso, curso)
VALUES (3, 6.5, 'Engenharia Civil');

CREATE TABLE funcionario (
  id SERIAL PRIMARY KEY,
  id_pessoa SERIAL,
  funcao TEXT,
  FOREIGN KEY (id_pessoa) REFERENCES pessoa (id)
  ON DELETE CASCADE
);
INSERT INTO funcionario (id_pessoa, funcao)
VALUES (4, 'Analista de Marketing');
INSERT INTO funcionario (id_pessoa, funcao)
VALUES (5, 'Gerente de Projetos');

CREATE TABLE docente (
  id SERIAL PRIMARY KEY,
  id_pessoa SERIAL,
  especialidade TEXT,
  FOREIGN KEY (id_pessoa) REFERENCES pessoa (id)
  ON DELETE CASCADE
);
INSERT INTO docente (id_pessoa, especialidade)
VALUES (6, 'Matemática');
INSERT INTO docente (id_pessoa, especialidade)
VALUES (7, 'História');
INSERT INTO docente (id_pessoa, especialidade)
VALUES (8, 'Química');

CREATE TABLE perfil (
  id SERIAL PRIMARY KEY,
  codigo TEXT UNIQUE,
  tipo TEXT
);
INSERT INTO perfil (codigo, tipo)
VALUES ('USR', 'Usuário');
INSERT INTO perfil (codigo, tipo)
VALUES ('ALN', 'Aluno');
INSERT INTO perfil (codigo, tipo)
VALUES ('PROF', 'Professor');
INSERT INTO perfil (codigo, tipo)
VALUES ('ADM', 'Administrador');

CREATE TABLE servico (
    id SERIAL PRIMARY KEY,
    id_perfil SERIAL,
    codigo TEXT UNIQUE,
    tipo TEXT,
    descricao TEXT,
    FOREIGN KEY (id_perfil) REFERENCES perfil (id) 
    ON DELETE CASCADE
);
INSERT INTO servico (id_perfil, codigo, tipo, descricao)
VALUES (3, 'SRV001', 'Verificação', 'Possibilita ver notas');
INSERT INTO servico (id_perfil, codigo, tipo, descricao)
VALUES (4, 'SRV003', 'Consultoria', 'Serviço de consultoria empresarial');
INSERT INTO servico (id_perfil, codigo, tipo, descricao)
VALUES (3, 'SRV004', 'Aula', 'lecionamento');
INSERT INTO servico (id_perfil, codigo, tipo, descricao)
VALUES (2, 'SRV005', 'Verificação individual', 'Possibilita ver notas individuais');

CREATE TABLE perfil_pessoa (
    id SERIAL PRIMARY KEY,
    id_pessoa SERIAL,
    id_perfil SERIAL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa (id)
    ON DELETE CASCADE,
    FOREIGN KEY (id_perfil) REFERENCES perfil (id) 
    ON DELETE CASCADE
);
INSERT INTO perfil_pessoa (id_pessoa, id_perfil)
VALUES (5, 2);
INSERT INTO perfil_pessoa (id_pessoa, id_perfil)
VALUES (5, 4);
INSERT INTO perfil_pessoa (id_pessoa, id_perfil)
VALUES (6, 3);
INSERT INTO perfil_pessoa (id_pessoa, id_perfil)
VALUES (7, 1);
INSERT INTO perfil_pessoa (id_pessoa, id_perfil)
VALUES (8, 2);

CREATE TABLE disciplina (
    id SERIAL PRIMARY KEY,
    codigo TEXT UNIQUE,
    ementa TEXT,
    data_criacao TIMESTAMP
);
INSERT INTO disciplina (codigo, ementa, data_criacao)
VALUES ('MAT001', 'Matemática Básica', '2022-01-01 09:00:00');
INSERT INTO disciplina (codigo, ementa, data_criacao)
VALUES ('FIS001', 'Física I', '2022-02-15 14:30:00');
INSERT INTO disciplina (codigo, ementa, data_criacao)
VALUES ('HIS001', 'História do Brasil', '2022-03-20 10:15:00');
INSERT INTO disciplina (codigo, ementa, data_criacao)
VALUES ('ENG001', 'Introdução à Engenharia', '2022-04-10 16:45:00');

CREATE TABLE oferecimento (
    id SERIAL PRIMARY KEY,
    id_aluno SERIAL,
    id_docente SERIAL,
    id_disciplina SERIAL,
    data_ini TIMESTAMP,
    data_fim TIMESTAMP,
    nota REAL,
    FOREIGN KEY (id_aluno) REFERENCES aluno (id) ON DELETE CASCADE,
    FOREIGN KEY (id_docente) REFERENCES docente (id) ON DELETE CASCADE,
    FOREIGN KEY (id_disciplina) REFERENCES disciplina (id) ON DELETE CASCADE
);
INSERT INTO oferecimento (id_aluno, id_docente, id_disciplina, data_ini, data_fim, nota)
VALUES (1, 1, 1, '2022-08-01 08:00:00', '2022-12-15 12:00:00', 7.5);
INSERT INTO oferecimento (id_aluno, id_docente, id_disciplina, data_ini, data_fim, nota)
VALUES (2, 1, 1, '2022-08-01 08:00:00', '2022-12-15 12:00:00', 5.5);
INSERT INTO oferecimento (id_aluno, id_docente, id_disciplina, data_ini, data_fim, nota)
VALUES (3, 1, 1, '2022-08-01 08:00:00', '2022-12-15 12:00:00', 5.5);
INSERT INTO oferecimento (id_aluno, id_docente, id_disciplina, data_ini, data_fim, nota)
VALUES (2, 1, 1, '2022-08-01 07:00:00', '2022-12-15 11:00:00', 7.0);
INSERT INTO oferecimento (id_aluno, id_docente, id_disciplina, data_ini, data_fim, nota)
VALUES (2, 2, 2, '2022-08-01 10:30:00', '2022-12-15 15:30:00', 8.0);
INSERT INTO oferecimento (id_aluno, id_docente, id_disciplina, data_ini, data_fim, nota)
VALUES (3, 3, 3, '2022-08-01 13:45:00', '2022-12-15 17:00:00', 6.8);

CREATE TABLE historico_servico (
    id SERIAL PRIMARY KEY,
    id_pessoa SERIAL,
    id_servico SERIAL,
    data TIMESTAMP,
    UNIQUE (id_pessoa, id_servico, data),
    FOREIGN KEY (id_pessoa) REFERENCES pessoa (id),
    FOREIGN KEY (id_servico) REFERENCES servico(id)
);
INSERT INTO historico_servico (id_pessoa, id_servico, data)
VALUES (1, 2, '2023-05-17 10:30:00'),
       (2, 3, '2023-05-18 14:15:00'),
       (2, 1, '2023-01-18 14:15:00'),
       (3, 1, '2023-05-19 09:00:00');


/*-----------------CONSULTAS---------------------*/

CREATE FUNCTION lista_pessoaperfil()
RETURNS SETOF perfil_pessoa AS $$
  SELECT * FROM perfil_pessoa
  ORDER BY id_perfil
$$ LANGUAGE SQL;

-- CREATE TYPE linha1 AS (
--     pnome TEXT,
--     snome TEXT
-- );
CREATE FUNCTION consulta1()
RETURNS TABLE (nome_pessoa TEXT, nome_servico TEXT) AS $$
  SELECT p.tipo as nome_pessoa, s.tipo as nome_servico
  FROM servico s, perfil p
  WHERE  p.id = s.id_perfil
  ORDER BY p.tipo;
$$ LANGUAGE SQL;

-- CREATE TYPE linha2 AS (
--     pcodigo TEXT,
--     total_servicos INTEGER
-- );
CREATE FUNCTION consulta2()
RETURNS TABLE (codigo_perfil TEXT, total_servicos INTEGER) AS $$
    SELECT p.codigo AS codigo_perfil, COUNT(*) AS total_servicos
    FROM perfil p, servico s, historico_servico h, perfil_pessoa pp
    WHERE h.id_servico = s.id AND p.id = pp.id_perfil AND
          h.id_pessoa = pp.id_pessoa  
    GROUP BY p.codigo
    ORDER BY total_servicos ASC;
$$ LANGUAGE SQL;
-- Muito esquito pq como vc sabe qual perfil fez tal açao se mais de um perfil
-- pode realizar o mesmo servico e uma pessoa pode ter mais de um perfil

/*CREATE TYPE linha3 AS (
    dcodigo TEXT,
    dementa TEXT,
    count INTEGER
);

CREATE FUNCTION consulta3()
RETURNS SETOF linha3 AS $$
    SELECT d.codigo, d.ementa, COUNT(o.id) AS quantidade_oferecimentos
    FROM disciplina d, oferecimento o
    WHERE d.id = o.id_disciplina
    GROUP BY d.codigo, d.ementa
    ORDER BY COUNT(o.id) DESC
    LIMIT 5;
$$ LANGUAGE SQL;

CREATE TYPE linha4 AS (
    id_docente TEXT,
    count INTEGER
);
CREATE FUNCTION consulta4()
RETURNS SETOF linha4 AS $$
    SELECT id_docente, COUNT(*) AS total_tuplas
    FROM (
      SELECT id_docente, COUNT(*) AS count
      FROM oferecimento
      WHERE data_ini >= '2020-05-01' AND data_fim <= '2023-05-31'
      GROUP BY id_docente, id_disciplina, data_ini
    ) AS subconsulta
    GROUP BY id_docente
    ORDER BY total_tuplas DESC
    LIMIT 5;
$$ LANGUAGE SQL;*/



/*#########################################################################
   tabelas associadas ao erro de fazer a modelagem utilizando agragaçao*/

-- CREATE TABLE oferecimento (
--   id SERIAL PRIMARY KEY,
--   id_docente SERIAL,
--   id_disciplina SERIAL,
--   data_inicio TIMESTAMP,
--   data_fim TIMESTAMP,
--   codigo TEXT UNIQUE,
--   FOREIGN KEY (id_docente) REFERENCES docente(id),
--   FOREIGN KEY (id_disciplina) REFERENCES disciplina(id)
-- );
-- INSERT INTO oferecimento (id_docente, id_disciplina, data_inicio, data_fim, codigo)
-- VALUES (1, 1, '2022-01-01', '2022-06-30', 'OFER001');
-- INSERT INTO oferecimento (id_docente, id_disciplina, data_inicio, data_fim, codigo)
-- VALUES (2, 3, '2022-02-15', '2022-07-31', 'OFER002');
-- INSERT INTO oferecimento (id_docente, id_disciplina, data_inicio, data_fim, codigo)
-- VALUES (2, 1, '2022-02-15', '2022-07-31', 'OFER004');
-- INSERT INTO oferecimento (id_docente, id_disciplina, data_inicio, data_fim, codigo)
-- VALUES (3, 2, '2022-03-10', '2022-08-15', 'OFER003');

-- CREATE TABLE matricula (
--   id SERIAL PRIMARY KEY,
--   id_oferecimento SERIAL,
--   id_aluno SERIAL,
--   nota REAL,
--   FOREIGN KEY (id_oferecimento) REFERENCES oferecimento(id),
--   FOREIGN KEY (id_aluno) REFERENCES aluno(id)
-- );
-- INSERT INTO matricula (id_oferecimento, id_aluno, nota)
-- VALUES (1, 1, 8.5);
-- INSERT INTO matricula (id_oferecimento, id_aluno, nota)
-- VALUES (2, 3, 7.2);
-- INSERT INTO matricula (id_oferecimento, id_aluno, nota)
-- VALUES (2, 1, 7.1);
-- INSERT INTO matricula (id_oferecimento, id_aluno, nota)
-- VALUES (3, 2, 6.8);

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
  data_nasc TIMESTAMP
);

INSERT INTO pessoa (cpf, nome, endereco, instituicao, login, senha, data_nasc)
VALUES ('12345678901', 'João Silva', 'Rua Principal, 123', 'Universidade XYZ', 'joaosilva', 'senhasecreta', '2000-01-01 00:00:00');
INSERT INTO pessoa (cpf, nome, endereco, instituicao, login, senha, data_nasc)
VALUES ('2134564901', 'Bruno Ferber', 'Rua Secundaria, 321', 'Universidade ABC', 'bruno', 'senhasecreta', '2003-11-01 04:04:40');
INSERT INTO pessoa (cpf, nome, endereco, instituicao, login, senha, data_nasc)
VALUES ('12399978901', 'Paulo', 'Rua Principal, 321', 'Universidade ABC', 'paulo', 'senhasecreta', '2002-02-02 00:02:02');
INSERT INTO pessoa (cpf, nome, endereco, instituicao, login, senha, data_nasc)
VALUES ('98765432101', 'Maria', 'Avenida Central, 123', 'Universidade XYZ', 'maria', 'senha123', '1990-10-15 08:30:00');
INSERT INTO pessoa (cpf, nome, endereco, instituicao, login, senha, data_nasc)
VALUES ('11122233344', 'Ana', 'Praça Principal, 789', 'Faculdade XYZ', 'ana', 'abcd123', '1998-12-01 18:45:00');
INSERT INTO pessoa (cpf, nome, endereco, instituicao, login, senha, data_nasc)
VALUES ('11111111111', 'Carlos', 'Av. Central, 456', 'Universidade XYZ', 'carlos', 'senha123', '1995-05-15 09:30:00');
INSERT INTO pessoa (cpf, nome, endereco, instituicao, login, senha, data_nasc)
VALUES ('22222222222', 'Juliana', 'Rua Secundária, 789', 'Faculdade ABC', 'juliana', 'abcd123', '1997-08-20 14:45:00');
INSERT INTO pessoa (cpf, nome, endereco, instituicao, login, senha, data_nasc)
VALUES ('33333333333', 'Mariana', 'Rua Principal, 654', 'Universidade XYZ', 'mariana', 'senha456', '1993-12-10 11:00:00');

CREATE TABLE aluno (
  id SERIAL PRIMARY KEY,
  id_pessoa SERIAL,
  nota_ingresso REAL,
  curso TEXT,
  FOREIGN KEY (id_pessoa) REFERENCES pessoa (id)
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
VALUES ('MOD', 'Moderador');
INSERT INTO perfil (codigo, tipo)
VALUES ('ADM', 'Administrador');

CREATE TABLE servico (
    id SERIAL PRIMARY KEY,
    id_perfil SERIAL,
    codigo TEXT UNIQUE,
    tipo TEXT,
    descricao TEXT,
    FOREIGN KEY (id_perfil) REFERENCES perfil (id)
);
INSERT INTO servico (id_perfil, codigo, tipo, descricao)
VALUES (2, 'SRV002', 'Atendimento', 'Serviço de atendimento ao cliente');
INSERT INTO servico (id_perfil, codigo, tipo, descricao)
VALUES (3, 'SRV003', 'Consultoria', 'Serviço de consultoria empresarial');
INSERT INTO servico (id_perfil, codigo, tipo, descricao)
VALUES (3, 'SRV004', 'Aula', 'lecionamento');

CREATE TABLE perfil_pessoa (
    id SERIAL PRIMARY KEY,
    id_pessoa SERIAL,
    id_perfil SERIAL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa (id),
    FOREIGN KEY (id_perfil) REFERENCES perfil (id)
);
INSERT INTO perfil_pessoa (id_pessoa, id_perfil)
VALUES (5, 2);
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
INSERT INTO matricula (id_aluno, id_docente, id_disciplina, data_ini, data_fim, nota)
VALUES (1, 1, 1, '2022-08-01 08:00:00', '2022-12-15 12:00:00', 7.5);
INSERT INTO matricula (id_aluno, id_docente, id_disciplina, data_ini, data_fim, nota)
VALUES (2, 1, 3, '2022-08-01 07:00:00', '2022-12-15 11:00:00', 7.0);
INSERT INTO matricula (id_aluno, id_docente, id_disciplina, data_ini, data_fim, nota)
VALUES (2, 2, 2, '2022-08-01 10:30:00', '2022-12-15 15:30:00', 8.0);
INSERT INTO matricula (id_aluno, id_docente, id_disciplina, data_ini, data_fim, nota)
VALUES (3, 3, 3, '2022-08-01 13:45:00', '2022-12-15 17:00:00', 6.8);


CREATE FUNCTION lista_pessoaperfil()
RETURNS SETOF perfil_pessoa AS $$
    SELECT * FROM perfil_pessoa
    ORDER BY id_perfil
$$ LANGUAGE SQL;

-- CREATE TYPE minha_linha AS (
--     coluna1 INTEGER,
--     coluna2 TEXT,
--     coluna3 DATE
-- );

CREATE TYPE linha1 AS (
    ptipo TEXT,
    stipo TEXT
);
CREATE FUNCTION consulta1()
RETURNS SETOF linha1 AS $$
    SELECT p.tipo as perfil, s.tipo as servico
    FROM servico s, perfil p
    WHERE  p.id = s.id;
$$ LANGUAGE SQL;


-- SELECT p.tipo as perfil, s.tipo as servico
-- FROM servico s, perfil p
-- WHERE  p.id = s.id;

-- SELECT p.codigo AS perfil, COUNT(*) AS total_servicos
-- FROM perfil_pessoa pp, perfil p, servico s
-- WHERE pp.id_perfil = p.id  AND p.id = s.id_perfil
-- GROUP BY p.codigo
-- ORDER BY total_servicos ASC;

-- SELECT d.codigo AS disciplina, d.ementa, d.data_criacao, 
--     doc.id_pessoa AS cpf_professor, a.id_pessoa AS aluno, COUNT(*) AS count
-- FROM disciplina d, matricula m, docente doc, aluno a
-- WHERE d.id = m.id_disciplina AND doc.id = m.id_docente AND a.id = m.id_aluno
-- GROUP BY d.codigo, d.ementa, d.data_criacao, doc.id_pessoa, a.id_pessoa
-- ORDER BY COUNT(*) DESC
-- LIMIT 5;

-- SELECT d.id_pessoa AS docente, COUNT(*) AS total_disciplinas_ministradas
-- FROM docente d, matricula m
-- WHERE d.id = m.id_docente AND m.data_ini >= '2020-05-01' 
--       AND m.data_fim <= '2023-05-31'
-- GROUP BY d.id
-- ORDER BY COUNT(*) DESC
-- LIMIT 5;



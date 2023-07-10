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
VALUES 
    ('12345678901', 'João Silva', 'Rua Principal, 123', 'Universidade XYZ', 'joaosilva', 'senhasecreta', '2000-01-01 00:00:00'),
    ('2134564901', 'Bruno Ferber', 'Rua Secundaria, 321', 'Universidade ABC', 'bruno', 'senhasecreta', '2003-11-01 04:04:40'),
    ('12399978901', 'Paulo', 'Rua Principal, 321', 'Universidade ABC', 'paulo', 'senhasecreta', '2002-02-02 00:02:02'),
    ('98765432101', 'Maria', 'Avenida Central, 123', 'Universidade XYZ', 'maria', 'senha123', '1990-10-15 08:30:00'),
    ('11122233344', 'Ana', 'Praça Principal, 789', 'Faculdade XYZ', 'ana', 'abcd123', '1998-12-01 18:45:00'),
    ('11111111111', 'Carlos', 'Av. Central, 456', 'Universidade XYZ', 'carlos', 'senha123', '1995-05-15 09:30:00'),
    ('22222222222', 'Juliana', 'Rua Secundária, 789', 'Faculdade ABC', 'juliana', 'abcd123', '1997-08-20 14:45:00'),
    ('33333333333', 'Mariana', 'Rua Principal, 654', 'Universidade XYZ', 'mariana', 'senha456', '1993-12-10 11:00:00');

CREATE TABLE aluno (
  id SERIAL PRIMARY KEY,
  id_pessoa INTEGER,
  nota_ingresso REAL,
  curso TEXT,
  FOREIGN KEY (id_pessoa) REFERENCES pessoa (id)
  ON DELETE CASCADE
);
INSERT INTO aluno (id_pessoa, nota_ingresso, curso)
VALUES 
    (1, 7.8, 'Administração'),
    (2, 8.9, 'Medicina'),
    (3, 6.5, 'Engenharia Civil');

CREATE TABLE funcionario (
  id SERIAL PRIMARY KEY,
  id_pessoa INTEGER,
  funcao TEXT,
  FOREIGN KEY (id_pessoa) REFERENCES pessoa (id)
  ON DELETE CASCADE
);
INSERT INTO funcionario (id_pessoa, funcao)
VALUES 
    (4, 'Analista de Marketing'),
    (5, 'Gerente de Projetos');

CREATE TABLE docente (
  id SERIAL PRIMARY KEY,
  id_pessoa INTEGER,
  especialidade TEXT,
  FOREIGN KEY (id_pessoa) REFERENCES pessoa (id)
  ON DELETE CASCADE
);
INSERT INTO docente (id_pessoa, especialidade)
VALUES 
    (6, 'Matemática'),
    (7, 'História'),
    (8, 'Química');

CREATE TABLE perfil (
  id SERIAL PRIMARY KEY,
  codigo TEXT UNIQUE,
  tipo TEXT
);
INSERT INTO perfil (codigo, tipo)
VALUES 
    ('USR', 'Usuário'),
    ('ALN', 'Aluno'),
    ('PROF', 'Professor'),
    ('ADM', 'Administrador');


CREATE TABLE servico (
    id SERIAL PRIMARY KEY,
    id_perfil INTEGER,
    codigo TEXT UNIQUE,
    tipo TEXT,
    descricao TEXT,
    FOREIGN KEY (id_perfil) REFERENCES perfil (id) 
    ON DELETE CASCADE
);
INSERT INTO servico (id_perfil, codigo, tipo, descricao)
VALUES 
    (3, 'SRV001', 'Verificação', 'Possibilita ver notas'),
    (4, 'SRV003', 'Consultoria', 'Serviço de consultoria empresarial'),
    (3, 'SRV004', 'Aula', 'Lecionamento'),
    (2, 'SRV005', 'Verificação individual', 'Possibilita ver notas individuais');


CREATE TABLE perfil_pessoa (
    id SERIAL PRIMARY KEY,
    id_pessoa INTEGER,
    id_perfil INTEGER,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa (id)
    ON DELETE CASCADE,
    FOREIGN KEY (id_perfil) REFERENCES perfil (id) 
    ON DELETE CASCADE
);
INSERT INTO perfil_pessoa (id_pessoa, id_perfil)
VALUES 
    (5, 2),
    (5, 4),
    (6, 3),
    (7, 1),
    (8, 2);


CREATE TABLE disciplina (
    id SERIAL PRIMARY KEY,
    codigo TEXT UNIQUE,
    ementa TEXT,
    data_criacao TIMESTAMP
);
INSERT INTO disciplina (codigo, ementa, data_criacao)
VALUES 
    ('MAT001', 'Matemática Básica', '2022-01-01 09:00:00'),
    ('FIS001', 'Física I', '2022-02-15 14:30:00'),
    ('HIS001', 'História do Brasil', '2022-03-20 10:15:00'),
    ('ENG001', 'Introdução à Engenharia', '2022-04-10 16:45:00');


CREATE TABLE oferecimento (
    id SERIAL PRIMARY KEY,
    id_aluno INTEGER,
    id_docente INTEGER,
    id_disciplina INTEGER,
    data_ini TIMESTAMP,
    data_fim TIMESTAMP,
    nota REAL,
    FOREIGN KEY (id_aluno) REFERENCES aluno (id) ON DELETE CASCADE,
    FOREIGN KEY (id_docente) REFERENCES docente (id) ON DELETE CASCADE,
    FOREIGN KEY (id_disciplina) REFERENCES disciplina (id) ON DELETE CASCADE
);
INSERT INTO oferecimento (id_aluno, id_docente, id_disciplina, data_ini, data_fim, nota)
VALUES 
    (1, 1, 1, '2022-08-01 08:00:00', '2022-12-15 12:00:00', 7.5),
    (2, 1, 1, '2022-08-01 08:00:00', '2022-12-15 12:00:00', 5.5),
    (3, 1, 1, '2022-08-01 08:00:00', '2022-12-15 12:00:00', 5.5),
    (2, 1, 1, '2022-02-01 07:00:00', '2022-12-15 11:00:00', 7.0),
    (2, 2, 2, '2022-08-01 10:30:00', '2022-12-15 15:30:00', 8.0),
    (2, 3, 2, '2022-08-01 10:30:00', '2022-12-15 15:30:00', 8.0),
    (3, 3, 3, '2022-08-01 13:45:00', '2022-12-15 17:00:00', 6.8),
    (3, 3, 3, '2018-08-01 13:45:00', '2022-12-15 17:00:00', 4.8);


CREATE TABLE historico_servico (
    id SERIAL PRIMARY KEY,
    id_pessoa INTEGER,
    id_servico INTEGER,
    data TIMESTAMP,
    UNIQUE (id_pessoa, id_servico, data),
    FOREIGN KEY (id_pessoa) REFERENCES pessoa (id),
    FOREIGN KEY (id_servico) REFERENCES servico(id)
);
INSERT INTO historico_servico (id_pessoa, id_servico, data)
VALUES (1, 2, '2023-05-17 10:30:00'),
       (2, 3, '2023-05-18 14:15:00'),
       (2, 1, '2023-01-18 14:15:00'),
       (3, 1, '2023-05-19 09:00:00'),
       (8, 4, '2023-05-19 09:00:00');


/*-----------------CONSULTAS---------------------*/

CREATE FUNCTION lista_pessoaperfil()
RETURNS SETOF perfil_pessoa AS $$
  SELECT * FROM perfil_pessoa
  ORDER BY id_perfil
$$ LANGUAGE SQL;

CREATE FUNCTION consulta1()
RETURNS TABLE (perfil TEXT, nome_servico TEXT) AS $$
  SELECT p.tipo as perfil, s.tipo as nome_servico
  FROM servico s, perfil p
  WHERE  p.id = s.id_perfil
  ORDER BY p.tipo;
$$ LANGUAGE SQL;

CREATE FUNCTION consulta2()
RETURNS TABLE (tipo_perfil TEXT, total_servicos INTEGER) AS $$
    SELECT p.tipo AS tipo_perfil, COUNT(*) AS total_servicos
    FROM perfil p, servico s, historico_servico h
    WHERE h.id_servico = s.id AND s.id_perfil = p.id   
    GROUP BY p.tipo
    ORDER BY total_servicos ASC;
$$ LANGUAGE SQL;

CREATE FUNCTION consulta3()
RETURNS TABLE (disciplina TEXT, nome_docente TEXT, nome_aluno TEXT) AS $$
  SELECT DISTINCT d.codigo, p1.nome as nome_docente, p2.nome as nome_aluno
  FROM (
        SELECT id_disciplina, COUNT(*) as count2
        FROM  (
              SELECT id_disciplina, COUNT(*) AS count
              FROM oferecimento
              GROUP BY id_disciplina, data_ini) AS sub
        GROUP BY id_disciplina
        ORDER BY COUNT(*) DESC
        LIMIT 5) as sub2, oferecimento o, disciplina d, pessoa p1, pessoa p2,
        docente doc, aluno a
  WHERE sub2.id_disciplina = o.id_disciplina AND o.id_disciplina = d.id AND 
    o.id_docente = doc.id AND doc.id_pessoa = p1.id AND 
    o.id_aluno = a.id AND a.id_pessoa = p2.id
$$ LANGUAGE SQL;

CREATE FUNCTION consulta4()
RETURNS TABLE (nome_docente TEXT, disciplinas_ministradas INTEGER) AS $$
    SELECT p.nome, COUNT(*) AS disciplinas_ministradas
    FROM (
      SELECT id_docente, COUNT(*) AS count
      FROM oferecimento
      WHERE data_ini >= '2020-05-01' AND data_fim <= '2023-05-31'
      GROUP BY id_docente, id_disciplina, data_ini
    ) AS sub, pessoa p, docente doc
    WHERE sub.id_docente = doc.id AND doc.id_pessoa = p.id
    GROUP BY p.nome
    ORDER BY disciplinas_ministradas DESC
    LIMIT 5;       
$$ LANGUAGE SQL;



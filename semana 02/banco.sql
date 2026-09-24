CREATE TABLE plano (
    id_plano INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    valor_mensal DECIMAL(10,2) NOT NULL,
    duracao_meses INT NOT NULL
);

CREATE TABLE professor (
    id_professor INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cref VARCHAR(20) NOT NULL UNIQUE,
    especialidade VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE aluno (
    id_aluno INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    id_plano INT NOT NULL,
    FOREIGN KEY (id_plano) REFERENCES plano(id_plano)
);

CREATE TABLE aula (
    id_aula INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    modalidade VARCHAR(100) NOT NULL,
    horario TIME NOT NULL,
    capacidade INT NOT NULL,
    id_professor INT NOT NULL,
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor)
);

CREATE TABLE matricula_aula (
    id_aluno INT NOT NULL,
    id_aula INT NOT NULL,
    PRIMARY KEY (id_aluno, id_aula),
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_aula) REFERENCES aula(id_aula)
);
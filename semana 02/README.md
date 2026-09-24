# Modelagem de Banco de Dados – Academia

## 1. Cenário

O cenário escolhido foi uma Academia.

## 2. Entidades

### ALUNO
Entidade forte.

- id_aluno — PK
- nome
- cpf
- data_nascimento
- telefone
- email
- id_plano — FK

### PROFESSOR
Entidade forte.

- id_professor — PK
- nome
- cref
- especialidade
- telefone
- email

### PLANO
Entidade forte.

- id_plano — PK
- nome
- valor_mensal
- duracao_meses

### AULA
Entidade forte.

- id_aula — PK
- nome
- modalidade
- horario
- capacidade
- id_professor — FK

### MATRICULA_AULA
Entidade associativa.

- id_aluno — PK/FK
- id_aula — PK/FK

Não existem entidades fracas neste modelo.

## 3. Relacionamentos

- PLANO — ALUNO: 1:N
- PROFESSOR — AULA: 1:N
- ALUNO — AULA: N:N

O relacionamento N:N é implementado pela tabela `MATRICULA_AULA`.

## 4. Chaves

### Chaves Primárias

- ALUNO: id_aluno
- PROFESSOR: id_professor
- PLANO: id_plano
- AULA: id_aula
- MATRICULA_AULA: id_aluno + id_aula

### Chaves Estrangeiras

- ALUNO: id_plano
- AULA: id_professor
- MATRICULA_AULA: id_aluno
- MATRICULA_AULA: id_aula
Modelagem de Banco de Dados — Academia
1. Cenário

O cenário escolhido foi uma Academia.

O banco de dados será utilizado para armazenar informações sobre alunos, professores, planos e aulas.

2. Entidades e atributos
ALUNO
id_aluno — PK
nome
cpf
data_nascimento
telefone
email
PROFESSOR
id_professor — PK
nome
cref
especialidade
telefone
PLANO
id_plano — PK
nome
valor_mensal
duracao_meses
AULA
id_aula — PK
nome
modalidade
horario
capacidade
id_professor — FK
3. Relacionamentos e cardinalidades

PLANO — ALUNO

Um plano pode estar associado a vários alunos, e cada aluno possui um plano.

Cardinalidade: 1:N

PROFESSOR — AULA

Um professor pode ministrar várias aulas, e cada aula possui um professor responsável.

Cardinalidade: 1:N

ALUNO — AULA

Um aluno pode participar de várias aulas, e uma aula pode ter vários alunos.

Cardinalidade: N:N

4. Resumo
Relacionamento	Cardinalidade
PLANO — ALUNO	1:N
PROFESSOR — AULA	1:N
ALUNO — AULA	N:N

PK: Chave Primária
FK: Chave Estrangeira
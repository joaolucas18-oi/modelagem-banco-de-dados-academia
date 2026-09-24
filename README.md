Modelagem de Banco de Dados — Academia
1. Identificação do cenário

Cenário escolhido: Academia

O sistema de uma academia precisa armazenar e organizar informações sobre seus alunos, planos, professores e aulas. A modelagem tem como objetivo representar os principais dados envolvidos no funcionamento do negócio e os relacionamentos existentes entre eles.

Este projeto corresponde à etapa inicial de modelagem conceitual de um banco de dados, identificando as entidades, seus atributos, as chaves primárias, os relacionamentos e suas respectivas cardinalidades.

2. Levantamento de requisitos

A partir da análise do cenário, foram identificados os seguintes requisitos:

A academia deve manter o cadastro de seus alunos.
Cada aluno deve possuir um identificador único.
A academia deve disponibilizar diferentes planos de contratação.
Cada aluno deve estar vinculado a um plano.
A academia deve manter o cadastro de seus professores.
Os professores podem ser responsáveis por diferentes aulas.
Cada aula deve possuir um professor responsável.
Um aluno pode participar de várias aulas.
Uma aula pode possuir vários alunos.

A partir desses requisitos, foram identificadas as seguintes entidades principais:

ALUNO
PLANO
PROFESSOR
AULA
3. Entidades e atributos
3.1 Entidade ALUNO

A entidade ALUNO representa as pessoas matriculadas na academia.

Atributo	Descrição	Chave
id_aluno	Identificador único do aluno	PK
nome	Nome completo do aluno	—
cpf	CPF do aluno	—
data_nascimento	Data de nascimento	—
telefone	Telefone de contato	—
email	E-mail do aluno	—
data_matricula	Data em que o aluno realizou a matrícula	—

Chave primária: id_aluno

3.2 Entidade PLANO

A entidade PLANO representa os planos oferecidos pela academia.

Atributo	Descrição	Chave
id_plano	Identificador único do plano	PK
nome	Nome do plano	—
descricao	Descrição do plano	—
valor_mensal	Valor mensal do plano	—
duracao_meses	Duração do plano em meses	—

Chave primária: id_plano

3.3 Entidade PROFESSOR

A entidade PROFESSOR representa os profissionais responsáveis pelas aulas oferecidas pela academia.

Atributo	Descrição	Chave
id_professor	Identificador único do professor	PK
nome	Nome completo do professor	—
cref	Registro profissional do professor	—
especialidade	Área de especialização do professor	—
telefone	Telefone de contato	—
email	E-mail do professor	—

Chave primária: id_professor

3.4 Entidade AULA

A entidade AULA representa as atividades oferecidas pela academia.

Atributo	Descrição	Chave
id_aula	Identificador único da aula	PK
nome	Nome da aula	—
modalidade	Modalidade da atividade	—
horario	Horário em que a aula acontece	—
capacidade	Quantidade máxima de alunos	—
id_professor	Professor responsável pela aula	FK

Chave primária: id_aula

Chave estrangeira: id_professor, relacionada à entidade PROFESSOR.

4. Relacionamentos
4.1 PLANO — ALUNO

Um plano pode ser contratado por vários alunos.

Cada aluno está vinculado a um plano.

Cardinalidade: 1:N
PLANO (1) ─────────── (N) ALUNO

Descrição:

Um plano pode estar associado a vários alunos.
Cada aluno está associado a um plano.
4.2 PROFESSOR — AULA

Um professor pode ser responsável por várias aulas.

Cada aula possui um professor responsável.

Cardinalidade: 1:N
PROFESSOR (1) ─────────── (N) AULA

Descrição:

Um professor pode ministrar várias aulas.
Cada aula possui um professor responsável.
4.3 ALUNO — AULA

Um aluno pode participar de várias aulas.

Uma aula pode possuir vários alunos.

Cardinalidade: N:N
ALUNO (N) ─────────── (N) AULA

Esse relacionamento representa uma relação muitos-para-muitos (N:N).

Na etapa de modelagem lógica, esse relacionamento poderá ser transformado em uma entidade associativa, por exemplo MATRICULA_AULA, contendo as chaves das entidades relacionadas.

ALUNO (1) ─── (N) MATRICULA_AULA (N) ─── (1) AULA
5. Resumo dos relacionamentos
Entidades relacionadas	Relacionamento	Cardinalidade
PLANO → ALUNO	Possui/é contratado por	1:N
PROFESSOR → AULA	Ministra	1:N
ALUNO → AULA	Participa	N:N
6. Modelo conceitual

O modelo conceitual simplificado do cenário pode ser representado da seguinte forma:

┌─────────────────────┐
│        PLANO        │
├─────────────────────┤
│ PK id_plano         │
│ nome                │
│ descricao           │
│ valor_mensal        │
│ duracao_meses       │
└──────────┬──────────┘
           │
           │ 1:N
           │
┌──────────▼──────────┐
│        ALUNO        │
├─────────────────────┤
│ PK id_aluno         │
│ nome                │
│ cpf                 │
│ data_nascimento     │
│ telefone            │
│ email               │
│ data_matricula      │
└──────────┬──────────┘
           │
           │ N:N
           │
┌──────────▼──────────┐
│        AULA         │
├─────────────────────┤
│ PK id_aula          │
│ nome                │
│ modalidade          │
│ horario             │
│ capacidade          │
│ FK id_professor     │
└──────────┬──────────┘
           │
           │ N:1
           │
┌──────────▼──────────┐
│     PROFESSOR       │
├─────────────────────┤
│ PK id_professor     │
│ nome                │
│ cref                │
│ especialidade       │
│ telefone            │
│ email                │
└─────────────────────┘

Observação: o relacionamento N:N entre ALUNO e AULA será detalhado posteriormente na modelagem lógica por meio de uma entidade associativa.

7. Identificação das chaves
Chaves Primárias (PK)

As chaves primárias identificam de forma única cada registro das entidades:

ALUNO.id_aluno
PLANO.id_plano
PROFESSOR.id_professor
AULA.id_aula
Chave Estrangeira (FK)

Na entidade AULA, o atributo:

id_professor

funciona como chave estrangeira (FK) e estabelece a relação entre AULA e PROFESSOR.

8. Regras de negócio identificadas

A partir do levantamento de requisitos, foram definidas as seguintes regras de negócio:

Cada aluno deve possuir um identificador único.
Cada professor deve possuir um identificador único.
Cada plano deve possuir um identificador único.
Cada aula deve possuir um identificador único.
Um plano pode estar associado a vários alunos.
Cada aluno deve estar associado a um plano.
Um professor pode ministrar várias aulas.
Cada aula deve possuir um professor responsável.
Um aluno pode participar de várias aulas.
Uma aula pode possuir vários alunos.
9. Conclusão

A modelagem conceitual inicial do sistema de uma academia permitiu identificar as principais informações necessárias para representar o funcionamento do negócio em um banco de dados.

Foram identificadas quatro entidades principais:

ALUNO
PLANO
PROFESSOR
AULA

Também foram definidos os principais atributos de cada entidade, suas respectivas chaves primárias (PK) e os relacionamentos existentes entre elas.

As cardinalidades identificadas foram:

PLANO — ALUNO: 1:N
PROFESSOR — AULA: 1:N
ALUNO — AULA: N:N

Essa etapa constitui a base para a continuidade do projeto, permitindo posteriormente realizar a modelagem lógica, definir as chaves estrangeiras e, por fim, implementar o banco de dados fisicamente.

10. Tecnologias e ferramentas

Para a elaboração deste projeto podem ser utilizadas:

GitHub — armazenamento e versionamento do projeto.
Markdown — documentação do projeto.
Ferramenta de modelagem ER — elaboração do Diagrama Entidade-Relacionamento.
11. Estrutura do projeto
academia-banco-de-dados/
│
├── README.md
│
└── docs/
    └── diagrama-er.png
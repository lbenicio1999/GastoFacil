**GastoFácil - Scripts SQLite**



Este repositório contém os scripts para criar, inserir dados e manipular o banco de dados do projeto GastoFácil um Sistema de Controle de Gastos.



**Arquivos Disponíveis**



* 01 - createtables.sql -> Criação das tabelas do banco de dados.
* 02 - insert.sql -> Inserção de dados de exemplo
* 03 - Select.sql -> Consultas utilizando SELECT
* 04 - Update\_Delete.sql -> Exemplos de UPDATE e DELETE



Todos os scripts foram escritos para uso no SQLite, utilizando SQLiteStudio.



Instruções para executar:



* 01 Criar Banco de dados

  Abra o Software e crie um novo banco de dados (ex. GastoFácil).

  Arquivo -> Novo Banco de Dados

  

* 02 Ativar Chaves Estrangeiras
  No editor execute:

  sql

  PRAGMA foreign\_keys = ON;

  

* 03 Executar Scripts

  Abra os arquivos .sql na ordem e execute F9:

  

   	01 - createtables.sql

   	02 - insert.sql

   	03 - Select.sql

   	04 - Update\_Delete.sql

  

* 04 Visualizar resultados

  Abra a aba Tabelas para conferir a estrutura
  Abra a aba Data para visualizar os dados
  Execute os SELECTs para consultar as informações

  

  

  

  **Observações importantes:**

  

* Execute sempre o PRAGMA foreign\_keys = ON; antes dos inserts.

  

* Não altere a ordem de execução dos scripts.

  

* Os scripts funcionam exclusivamente no SQLite (mas podem ser convertidos para PostgreSQL ou MySQL se necessário).

  

* Caso queira ampliar o banco, edite o arquivo 02 - insert.sql.

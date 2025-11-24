--
-- Arquivo gerado com SQLiteStudio v3.4.17 em dom nov 23 20:09:18 2025
--
-- Codificação de texto usada: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Tabela: Categoria
DROP TABLE IF EXISTS Categoria;

CREATE TABLE IF NOT EXISTS Categoria (
    ID_Categoria     SERIAL        PRIMARY KEY,
    ID_usuario       INTEGER       NOT NULL
                                   REFERENCES usuario (ID_usuario) ON DELETE CASCADE,
    Nome             VARCHAR (200) NOT NULL,
    Tipo             VARCHAR (50)  NOT NULL,-- Entrada ou Saída
    Categoria_pai_id INTEGER       REFERENCES Categoria (ID_categoria) 
);


-- Tabela: Conta
DROP TABLE IF EXISTS Conta;

CREATE TABLE IF NOT EXISTS Conta (
    ID_conta      SERIAL          PRIMARY KEY,
    ID_usuario    INTEGER         NOT NULL
                                  REFERENCES Usuario (ID_usuario) ON DELETE CASCADE,
    Nome          VARCHAR (200)   NOT NULL,
    Tipo          VARCHAR (50)    NOT NULL,-- exemplo: Banco Itau Nubank, Bradesco, etc...
    Saldo_inicial NUMERIC (12, 2) DEFAULT 0.0
);


-- Tabela: Orcamento
DROP TABLE IF EXISTS Orcamento;

CREATE TABLE IF NOT EXISTS Orcamento (
    ID_orcamento SERIAL      PRIMARY KEY,
    ID_usuario   INTEGER     NOT NULL
                             REFERENCES Usuario (ID_usuario) ON DELETE CASCADE,
    ID_categoria INTEGER     NOT NULL
                             REFERENCES Categoria (ID_Categoria) ON DELETE CASCADE,
    Mes_ano      VARCHAR (7) NOT NULL-- YYYY-MM
);


-- Tabela: Transacao
DROP TABLE IF EXISTS Transacao;

CREATE TABLE IF NOT EXISTS Transacao (
    ID_transacao SERIAL          PRIMARY KEY,
    ID_usuario   INTEGER         NOT NULL
                                 REFERENCES Usuario (ID_usuario) ON DELETE CASCADE,
    ID_conta     INTEGER         NOT NULL
                                 REFERENCES Conta (ID_conta) ON DELETE CASCADE,
    ID_categoria INTEGER         NOT NULL
                                 REFERENCES Categoria (ID_categoria) ON DELETE CASCADE,
    Tipo         VARCHAR (50)    NOT NULL,-- Entrada ou Saída
    Valor        NUMERIC (12, 2) NOT NULL,
    Data         TIMESTAMP       NOT NULL,
    Descricao    TEXT            NOT NULL
);


-- Tabela: Usuario
DROP TABLE IF EXISTS Usuario;

CREATE TABLE IF NOT EXISTS Usuario (
    ID_usuario   SERIAL        PRIMARY KEY
                               NOT NULL,
    Nome         VARCHAR (200) NOT NULL,
    Email        VARCHAR (200) UNIQUE
                               NOT NULL,
    Senha        VARCHAR (200) NOT NULL,
    Data_criacao TIMESTAMP     DEFAULT CURRENT_TIMESTAMP
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;

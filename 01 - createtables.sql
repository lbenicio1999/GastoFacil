-- 01-Create
-- Criando as tableas que iremos utilzar.


Create Table Usuario
(
    ID_usuario INTEGER PRIMARY KEY AUTOINCREMENT,
    Nome VARCHAR (200) NOT NULL,
    Email VARCHAR (200) UNIQUE NOT NULL,
    Senha VARCHAR (200) NOT NULL,
    Data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

Create Table Conta
(
    ID_conta INTEGER PRIMARY KEY AUTOINCREMENT,
    ID_usuario INTEGER NOT NULL REFERENCES Usuario(ID_usuario) ON DELETE CASCADE,
    Nome Varchar (200) NOT NULL,
    Tipo Varchar (50) NOT NULL, -- exemplo: Banco Itau Nubank, Bradesco, etc...
    Saldo_inicial NUMERIC(12,2) DEFAULT 0.00
);

Create Table Categoria
(
    ID_Categoria INTEGER PRIMARY KEY AUTOINCREMENT,
    ID_usuario INTEGER NOT NULL REFERENCES usuario(ID_usuario) ON DELETE CASCADE,
    Nome Varchar (200) NOT NULL,
    Tipo Varchar (50) Not NULL --Entrada ou Saída
);
 
Create Table Transacao
(
    ID_transacao INTEGER PRIMARY KEY AUTOINCREMENT,
    ID_usuario INTEGER NOT NULL REFERENCES Usuario(ID_usuario) ON DELETE CASCADE,
    ID_conta INTEGER NOT NULL REFERENCES Conta(ID_conta) ON DELETE CASCADE,
    ID_categoria INTEGER NOT NULL REFERENCES Categoria(ID_categoria) ON DELETE CASCADE,
    Tipo Varchar (50) NOT NULL, -- Entrada ou Saída
    Valor NUMERIC (12,2) NOT NULL,
    Data Timestamp NOT NULL,
    Descricao TEXT NOT NULL
);

Create Table Orcamento
(
    ID_orcamento INTEGER PRIMARY KEY AUTOINCREMENT,
    ID_usuario INTEGER NOT NULL REFERENCES Usuario(ID_usuario) ON DELETE CASCADE,
    ID_categoria INTEGER NOT NULL REFERENCES Categoria(ID_Categoria) ON DELETE CASCADE,
    Mes_ano Varchar (7) NOT NULL, -- YYYY-MM
    limite NUMERIC(12,2) NOT NULL
);


-- 02-Insert
-- Inserindo dados nas tabelas criadas

--Usuario
INSERT INTO Usuario (Nome, Email, Senha) Values
('Lucas Benício', 'lbenicio@gastofacil.com.br', '1234'),
('Roselina dos santos', 'rsantos@gastofacil.com.br', '12345'),
('Vagner Alexandre Benício', 'vbenicio@gastofacil.com.br', '4321'),
('Daniele Perroni', 'dperroni@gastofacil.com.br', '54321');

--Conta
INSERT INTO Conta (ID_usuario, Nome, Tipo, Saldo_Inicial) Values
(1,'Itau','Cartão de crédito Itau', '0.00'),
(4,'Itau','Cartão de crédito Itau', '345.50'),
(1,'Bradesco','Cartão de crédito Bradesco','50.00'),
(1,'Nubank','Cartão de crédito Nubank','500.00');

--Categorias
INSERT INTO Categoria (ID_usuario, nome, Tipo) Values
(1, 'Alimentação', 'Saida'),
(1, 'Transporte', 'Saída'),
(1, 'Hora Extra', 'Entrada'),
(4, 'Salario', 'Entrada'),
(4, 'Alimentação', 'Saída');

--Orçamentos
INSERT INTO Orcamento (ID_usuario, ID_Categoria, Mes_ano, limite) Values
(1,1,'2025-07',500.00),
(1,2,'2025-07',1000.00),
(1,3,'2025-07',3000.00),
(4,4,'2025-07',5500.00),
(4,5,'2025-07',1500.00);

--Transações
INSERT INTO Transacao (ID_usuario, ID_conta, ID_Categoria, tipo, valor, data, descricao) Values
(1,3,2,'Saída', 50.00, '2025-07-02', 'Gasolina'),
(1,3,1,'Saída', 100.00, '2025-07-15', 'Restaurante Comilão'),
(4,2,4,'Entrada', 150.00, '2025-07-01', 'Venda de Livros Usados'),
(4,2,5,'Saída', 20.00, '2025-07-15', 'Restaurante Comilão');
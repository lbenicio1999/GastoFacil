-- 04-update-delete
-- Exemplos de UPDATE e DELETE

PRAGMA foreign_keys = ON;

-- UPDATE

-- 1) Atualizar limite do orçamento 
UPDATE Orcamento
SET limite = 550.00
WHERE ID_usuario = 1 AND ID_Categoria = 1 AND Mes_ano = '2025-07';

-- 2) Ajustar saldo inicial de uma conta
UPDATE Conta
SET Saldo_inicial = 0.00
WHERE Saldo_inicial IS NULL OR Saldo_inicial < 0;

-- 3) Corrigir descrição de uma transação específica
UPDATE Transacao
SET Descricao = 'Supermercado - Compra mensal'
WHERE ID_transacao = 2;

-- DELETE

-- 1) Remover transações de teste com valor zero
DELETE FROM Transacao
WHERE Valor = 0;

-- 2) Remover orçamentos muito antigos
DELETE FROM Orcamento
WHERE Mes_ano LIKE '2020%';

-- 3) Remover conta de teste
DELETE FROM Conta
WHERE ID_conta = 9999;

-- 03 - Select
-- Utilizando exemplo com scrip Select

PRAGMA foreign_keys = ON;

-- 1) Total de despesas por categoria no mês (usando tratamento para "Saida"/"Saída")
SELECT c.Nome AS categoria,
       SUM(t.Valor) AS total_gasto
FROM Transacao t
JOIN Categoria c ON t.ID_Categoria = c.ID_Categoria
WHERE lower(replace(t.Tipo, 'á', 'a')) = 'saida'
  AND strftime('%Y-%m', t.Data) = '2025-07'
GROUP BY c.Nome
ORDER BY total_gasto DESC;

-- 2) Extrato de uma conta ordenado por data (conta id = 1)
SELECT t.ID_transacao, t.Data, t.Descricao, t.Valor, t.Tipo
FROM Transacao t
WHERE t.ID_conta = 1
ORDER BY t.Data DESC
LIMIT 10;

-- 3) Usuários com maior gasto total (somente Saida)
SELECT u.Nome,
       COALESCE(SUM(CASE WHEN lower(replace(t.Tipo,'á','a'))='saida' THEN t.Valor ELSE 0 END), 0) AS total_despesas
FROM Usuario u
LEFT JOIN Transacao t ON u.ID_usuario = t.ID_usuario
GROUP BY u.ID_usuario, u.Nome
ORDER BY total_despesas DESC
LIMIT 5;

-- 4) Transações de um período (ex.: 2025-07-01 a 2025-07-31)
SELECT t.ID_transacao, u.Nome AS usuario, co.Nome AS conta, ca.Nome AS categoria, t.Data, t.Descricao, t.Valor, t.Tipo
FROM Transacao t
JOIN Usuario u ON t.ID_usuario = u.ID_usuario
JOIN Conta co ON t.ID_conta = co.ID_conta
JOIN Categoria ca ON t.ID_Categoria = ca.ID_Categoria
WHERE date(t.Data) BETWEEN '2025-07-01' AND '2025-07-31'
ORDER BY t.Data;

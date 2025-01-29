use restaurante; -- 1

-- Calcule a quantidade de pedidos
SELECT COUNT(id_pedidos) FROM pedido; -- 2

-- Calcule a quantidade de clientes únicos que realizaram pedidos
SELECT COUNT(DISTINCT id_cliente) FROM pedido; -- 3

-- Calcule a média de preço dos produtos
SELECT ROUND(AVG(preco),2) FROM produto; -- 4

-- Calcule o mínimo e máximo do preço dos produtos
SELECT MAX(preco)AS Preco_maximo FROM produto; -- 5
SELECT MIN(preco)AS Preco_minimo FROM produto; -- 5

-- Selecione o nome e o preço do produto e faça um rank dos 5 produtos mais caros
SELECT nome, preco, ROW_NUMBER() OVER(ORDER BY preco DESC) AS Maiores_precos FROM produto LIMIT 5; -- 6

-- Selecione a média dos preços dos produtos agrupados por categoria
SELECT categoria, ROUND(AVG(preco), 2) FROM produto GROUP BY categoria; -- 7

-- Selecionar o fornecedor e a quantidade de produtos que vieram daquele fornecedor da informações de produtos
SELECT fornecedor, COUNT(id_info) AS TotalPorFornecedor FROM info_produto GROUP BY fornecedor ; -- 8

-- Selecionar os fornecedores que possuem mais de um produto cadastrado
SELECT fornecedor, COUNT(id_info) AS TotalPorFornecedor FROM info_produto GROUP BY fornecedor HAVING COUNT(id_info) > 1;  -- 9

-- Selecionar os clientes que realizaram apenas 1 pedido
SELECT id_cliente, COUNT(nome) AS TotalPorCliente FROM cliente GROUP BY id_cliente HAVING COUNT(nome) = 1; -- 10



 
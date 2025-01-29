use restaurante; -- 1

SELECT * FROM pedido;
SELECT *FROM info_produto;

 -- Selecione todos os pedidos que do id funcionário igual a 4 e status é igual a ‘Pendente’
SELECT id_pedidos FROM pedido WHERE id_funcionario = 4 AND stats = 'Pendente'; -- 2

-- Selecione todos os pedidos que o status não é igual a ‘Concluído’
SELECT id_pedidos FROM pedido WHERE NOT stats = 'Concluído'; -- 3

-- Selecione os pedidos que contenham os id produtos: 1, 3, 5, 7 ou 8
SELECT id_pedidos FROM pedido WHERE id_produto IN(1, 3, 5, 7, 8); -- 4

-- Selecione os clientes que começam com a letra c
SELECT nome FROM cliente WHERE nome LIKE 'c%'; -- 5

-- Selecione as informações de produtos que contenham nos ingredientes ‘carne’ ou ‘frango’
SELECT id_info FROM info_produto WHERE ingredientes LIKE '%carne%'  OR ingredientes LIKE '%frango%'; -- 6

-- Selecione os produtos com o preço entre 20 a 30
SELECT id_produto FROM produto 	WHERE preco BETWEEN 20.00 AND 30.00; -- 7

SELECT * FROM produto; 

-- Atualizar id pedido 6 da tabela pedidos para status = NULL
UPDATE pedido  -- 8
SET stats = NULL  -- 8
WHERE id_pedidos = 6; -- 8

SELECT * FROM pedido;

-- Selecione os pedidos com status nulos
SELECT * FROM pedido WHERE stats IS NULL; -- 9

-- Selecionar o id pedido e o status da tabela pedidos, porém para todos os status nulos, mostrar 'Cancelado'
SELECT id_pedidos, stats, COALESCE(stats = NULL, 'Cancelado')AS stats_tratado FROM pedido; -- 10

-- Selecione o nome, cargo, salário dos funcionários e adicione um campo chamado media_salario, que irá mostrar ‘Acima da média’, para o salário > 3000, senão 'Abaixo da média'
SELECT nome, cargo, salario, IF(salario > 3000 , 'Acima da Média', 'Abaixo da Média')AS media_salario FROM funcionario; -- 11








USE restaurante; -- 1

SELECT pr.id_produto, pr.nome, pr.descricao, info_produto.ingredientes -- 2
FROM produto pr
INNER JOIN info_produto-- Aciona outra tabela
ON pr.id_produto = info_produto.id_produto;


SELECT pedido.id_pedidos, pedido.quantidade, pedido.data_pedido, c.nome, c.email -- 3
FROM pedido
INNER JOIN cliente c
ON pedido.id_cliente = c.id_cliente;

SELECT pe.id_pedidos, pe.quantidade, pe.data_pedido, c.nome, c.email, f.nome as Funcionario -- 4
FROM pedido pe
INNER JOIN cliente c ON pe.id_cliente = c.id_cliente
INNER JOIN funcionario f ON f.id_funcionario = pe.id_funcionario;

SELECT c.nome as cliente, pe.id_pedidos, pe.quantidade, pr.preco , pr.nome as produto ,  c.email, f.nome as funcionario, pe.data_pedido -- 5
FROM pedido pe
INNER JOIN cliente c ON c.id_cliente = pe.id_cliente
INNER JOIN funcionario f ON f.id_funcionario = pe.id_funcionario
INNER JOIN produto pr ON pr.id_produto = pe.id_produto;

SELECT pe.id_pedidos, c.nome, pe.stats -- 6
FROM cliente c
LEFT JOIN pedido pe ON c.id_cliente = pe.id_cliente 
WHERE stats = 'Pendente' ORDER BY pe.id_pedidos DESC;

SELECT c.* -- 7
FROM cliente c
LEFT JOIN pedido pe ON c.id_cliente = pe.id_cliente
WHERE pe.id_pedidos IS NULL;

SELECT cliente.nome, -- 8
	(SELECT COUNT(*) FROM pedido
    WHERE pedido.id_cliente = cliente.id_cliente) AS Total_de_Pedidos
    FROM cliente;
    
SELECT pedido.id_pedidos, SUM(produto.preco*pedido.quantidade) -- 9
FROM pedido
INNER JOIN produto ON pedido.id_produto = produto.id_produto
GROUP BY pedido.id_pedidos;


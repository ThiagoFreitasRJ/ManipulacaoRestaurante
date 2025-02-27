USE restaurante;

CREATE VIEW resumo_pedido AS
SELECT pedido.id_pedidos, pedido.quantidade, pedido.data_pedido, cliente.nome AS cliente, cliente.email,
funcionario.nome AS funcionario, produto.nome AS produto, produto.preco
FROM pedido
JOIN cliente ON cliente.id_cliente = pedido.id_cliente
JOIN funcionario ON funcionario.id_funcionario = pedido.id_funcionario
JOIN produto ON produto.id_produto = pedido.id_produto;



SELECT c.nome, pe.id_pedidos, SUM(p.preco * pe.quantidade) AS total_gasto
FROM cliente c
JOIN pedido pe ON c.id_cliente = pe.id_cliente
JOIN produto p ON pe.id_produto = p.id_produto
GROUP BY c.nome, pe.id_pedidos;

ALTER TABLE pedido
ADD COLUMN total INT;

CREATE OR REPLACE VIEW resumo_pedido AS
SELECT  pedido.id_pedidos, pedido.quantidade, pedido.data_pedido, cliente.nome AS cliente, cliente.email,
funcionario.nome AS funcionario, produto.nome AS produto, produto.preco, pedido.total 
FROM pedido
JOIN cliente ON cliente.id_cliente = pedido.id_cliente
JOIN funcionario ON funcionario.id_funcionario = pedido.id_funcionario
JOIN produto ON produto.id_produto = pedido.id_produto;

SELECT * FROM resumo_pedido;


SELECT c.nome, pe.id_pedidos, SUM(p.preco * pe.quantidade) AS total
FROM cliente c
JOIN pedido pe ON c.id_cliente = pe.id_cliente
JOIN produto p ON pe.id_produto = p.id_produto
GROUP BY c.nome, pe.id_pedidos;

EXPLAIN
SELECT c.nome, pe.id_pedidos, SUM(p.preco * pe.quantidade) AS total
FROM cliente c
JOIN pedido pe ON c.id_cliente = pe.id_cliente
JOIN produto p ON pe.id_produto = p.id_produto
GROUP BY c.nome, pe.id_pedidos;

DELIMITER // 
CREATE FUNCTION BuscarIngredientesProduto(IDprodutos INT)
RETURNS TEXT
READS SQL DATA
BEGIN
	DECLARE nomeIngrediente TEXT;
	SELECT ingredientes INTO nomeIngrediente FROM info_produto WHERE id_produto = IDprodutos;
    RETURN nomeIngrediente;
END //
DELIMITER ;

SELECT BuscarIngredientesProduto(20);

DELIMITER //
CREATE FUNCTION mediaPedido(IDpedido INT)
RETURNS VARCHAR(100)
READS SQL DATA 
BEGIN

	DECLARE desempenho VARCHAR(100);
    DECLARE mediatotal DECIMAL(10,2);
    DECLARE mediaun DECIMAL(10,2);
    
    -- Calcula a média da quantidade de todos os pedidos
    SELECT AVG(quantidade) INTO mediatotal FROM pedido;
    
    -- Obtem a quantidade do pedido com o id fornecido
    SELECT quantidade INTO mediaun FROM pedido WHERE id_pedidos = IDpedido;
    
    -- Compara o valor do pedido com a média e define a mensagem 
    IF mediaun > mediatotal THEN
		SET desempenho = 'Acima da Média';
    ELSEIF mediaun < mediatotal THEN
		SET desempenho = 'Abaixo da Média';    
	ELSE
		SET desempenho = 'Na média';
	
    END IF; 
    
    RETURN desempenho;
	  
   
    END //
    DELIMITER ;
  
SELECT mediaPedido(5);



    
	



use restaurante;

-- Selecione o nome e a categoria dos produtos que tem o preço superior a 30;
SELECT nome, categoria FROM produto WHERE preco > 30.00;

-- Selecione o nome, telefone e data de nascimento dos clientes que nasceram antes do ano de 1985;
SELECT nome, telefone, data_nascimento FROM cliente WHERE year(data_nascimento) < 1985; 

-- Selecione o id do produto e os ingredientes de informações de produto para os ingredientes que contenham a palavra “carne”;
SELECT id_produto, ingredientes FROM info_produto WHERE ingredientes LIKE '%carne%' ; # Não está aparecendo nenhum resultado 
 
 -- Selecione o nome e a categoria dos produtos ordenados em ordem alfabética por categoria, para cada categoria deve ser ordenada pelo nome do produto;
SELECT nome ,categoria FROM produto ORDER BY nome, categoria ASC; 
 
-- Selecione os 5 produtos mais caros do restaurante
SELECT nome, preco, categoria FROM produto ORDER BY preco DESC LIMIT 5;

--  A cada dia da semana 2 pratos principais estão na promoção, hoje você deve selecionar 2 produtos da categoria ‘Prato Principal’ e pular 6 registros (offset = 5);
SELECT nome FROM produto ORDER BY nome LIMIT 2 OFFSET 5;
 
 -- Faça backup dos dados da tabela pedidos com o nome de backup_pedidos.
CREATE TABLE backup_pedidos AS SELECT * FROM pedido ;
 
desc backup_pedidos;
 
INSERT INTO backup_pedidos SELECT * FROM pedidos;
 
 SELECT * FROM backup_pedidos;
 
 


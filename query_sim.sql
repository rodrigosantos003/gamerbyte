-- GAMERBYTE - CONSULTAS SIMPLES
-- AUTORES: João Fernandes & Rodrigo Santos
-- ÚLTIMA MODIFICAÇÃO: 2022-06-17

use gamerbyte;

-- OBTER TODOS OS DADOS
-- Obter Utilizadores
select nome as "Nome", email as "Email", nome_util as "Nome de Utilizador", password as "Password", avatar as "Avatar", data_cri as "Data de Criação"
from utilizador;

-- Obter Amizades
select (select utilizador.nome_util from utilizador, amizade where amizade.util_1 = utilizador.id_util) as "Utilizador",
	(select utilizador.nome_util from utilizador, amizade where amizade.util_2 = utilizador.id_util) as "Amigo"
from amizade;

-- Obter Grupos
select id_gru as "ID", nome as "Nome"
from grupo;

-- Obter Membros dos Grupos
select utilizador.nome_util as "Utilizador", grupo.nome as "Grupo"
from util_grupo left join utilizador
on util_grupo.util = utilizador.id_util
left join grupo
on grupo.id_gru = util_grupo.grupo
order by grupo.id_gru;

-- Obter Produtos
select id_prod as "ID", tipo as "Tipo"
from produto;

-- Obter Jogos
select produto as "Nº Produto", nome as "Nome", descricao as "Descrição", preco as "Preco"
from jogo;

-- Obter Inventários
select id_inv as "ID", utilizador.nome_util as "Utilizador"
from inventario left join utilizador
on utilizador.id_util = inventario.util;

-- Obter Produtos de Inventário
select prod_inv.inventario as "Inventário", produto.id_prod as "Produto"
from prod_inv left join inventario
on inventario = inventario.id_inv
left join produto
on produto.id_prod = produto
order by inventario.id_inv;

-- Obter Críticas
select utilizador.nome_util as "Utilizador", jogo.nome as "Jogo", critica.descricao as "Crítica", critica.data as "Data"
from critica left join utilizador
on critica.util = utilizador.id_util
left join jogo
on jogo.id_jog = critica.jogo
order by jogo.id_jog;

-- Obter Compras
select compra.id_compra as "ID", utilizador.nome_util as "Utilizador", prod_inv.id_prod_inv as "Produto", compra.data as "Data"
from compra left join utilizador
on compra.util = utilizador.id_util
left join prod_inv
on prod_inv.id_prod_inv = compra.produto
order by utilizador.id_util; 

-- Obter Vendas
select venda.id_venda as "ID", utilizador.nome_util as "Utilizador", prod_inv.id_prod_inv as "Produto", venda.data as "Data"
from venda left join utilizador
on venda.util = utilizador.id_util
left join prod_inv
on prod_inv.id_prod_inv = venda.produto
order by utilizador.id_util; 

-- Obter Items
select id_item as "ID", nome as "Nome", item.inv as "Inventario"
from item;

-- Obter Medalhas
select medalha.nome as "Medalha", medalha.nivel as "Nivel", utilizador.nome as "Utilizador", jogo.nome as "Jogo"
from medalha left join utilizador
on medalha.util = utilizador.id_util
left join jogo
on jogo.id_jog = medalha.jogo;

-- DADOS ESTATÍSTICOS
-- Total de Utilizadores
select count(*) as "Número de Utilizadores" 
from utilizador;

-- Total de Jogos
select count(*) as "Número de Jogos"
from jogo;

-- Maior Compra realizada
select id_compra as "ID", data as "Data", max(valor) as "Valor"
from compra
having Valor > 0.0;

-- Maior Venda realizada
select id_venda as "ID", data as "Data", max(valor) as "Valor"
from venda
having Valor > 0.0;
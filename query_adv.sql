-- GAMERBYTE - CONSULTAS AVANÇADAS
-- AUTORES: João Fernandes & Rodrigo Santos
-- ÚLTIMA MODIFICAÇÃO: 2022-06-17

use gamerbyte;

-- Quantos utilizadores tem cada jogo
select jogo.nome as "Jogo", count(prod_inv.inventario) as "Nº Utilizadores"
from prod_inv join produto on prod_inv.produto = produto.id_prod and produto.tipo like "Jogo"
join jogo on jogo.produto = produto.id_prod
group by jogo.nome;

-- Quantos utilizadores tem cada grupo
select grupo.nome as "Grupo", count(util_grupo.util) as "Nº de Utilizadores"
from util_grupo join grupo on grupo.id_gru = util_grupo.grupo
group by grupo.nome;

-- Utilizadores sem compras/vendas
select utilizador.nome_util as "Utilizadores sem transações"
from utilizador join compra on compra.util != utilizador.id_util
join venda on venda.util != utilizador.id_util;

-- Detalhes, quantas vezes foi atribuída e máximo e mínimo nivel de cada medalha
select vMedalha.ID, vMedalha.Nome, vMedalha.Jogo , vAtribuicoesMedalha.N as "Nº Vezes Atribuída", vNiveisMedalha.Max as "Nível Máximo", vNiveisMedalha.Min as "Nivel Minimo"
from vMedalha
join vAtribuicoesMedalha on vAtribuicoesMedalha.ID = vMedalha.ID
join vNiveisMedalha on vNiveisMedalha.ID = vMedalha.ID
group by vMedalha.ID;

-- VIEWS
create view vMedalha as
(select medalha.id_med as "ID", medalha.nome as "Nome", jogo.nome as "Jogo"
from medalha join jogo on medalha.jogo = jogo.id_jog);

create view vAtribuicoesMedalha as
(select id_med as "ID", count(*) as "N" 
from medalha
group by id_med);

create view vNiveisMedalha as
(select distinct id_med as "ID", max(nivel) as "Max" , min(nivel) as "Min"
from medalha
group by id_med);
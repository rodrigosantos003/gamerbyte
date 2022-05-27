-- GAMERBYTE - POPULATE
-- AUTORES: João Fernandes & Rodrigo Santos
-- ÚLTIMA MODIFICAÇÃO: 2022-05-19

-- UTILIZAÇÃO DA BASE DE DADOS
use gamerbyte;

-- Utilizador
insert into utilizador (nome_util, nome, email, password, avatar, data_cri)
values ("Santos", "Rodrigo Santos", "rodrigo.s.santos003@gmail.com", "abc1234.", "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Favatarfiles.alphacoders.com%2F167%2F167444.jpg&f=1&nofb=1", "2022-05-18");

insert into utilizador (nome_util, nome, email, password, data_cri)
values ("EnderSpy", "João Fernnades", "joaomlfernandes02@gmail.com", "password123", "2022-05-19");

-- Amizade
insert into amizade (util_1, util_2)
values (1, 2);

-- Grupo
insert into grupo (nome)
values ("QuarenDRENAS");

-- UserGrupo
insert into util_grupo (util, grupo)
values (1, 1);

insert into util_grupo (util, grupo)
values (2, 1);

-- Produto
insert into produto (tipo)
values ("Jogo");

insert into produto (tipo)
values ("Item");

-- Jogo
insert into jogo (nome, descricao, preco, produto)
values ("Pummel Party", "4-8 player online and local-multiplayer party game. Pummel
friends or AI using a wide array of absurd items in the board mode and compete to destroy
friendships in the unique collection of minigames", 12.50, 1);

-- Inventario
insert into inventario (util)
values (1);

-- ProdutoInv
insert into prod_inv (inventario, produto)
values (1, 1);

insert into prod_inv (inventario, produto)
values (1, 2);

-- Critica
insert into critica (data, descricao, jogo, util)
values ("2022-05-19", "Gostei do jogo. Ótimo para jogar com amigos", 1, 1);

-- Compra
insert into compra (produto, util, valor, data)
values (1, 1, 12.50, "2022-05-19");

-- Venda
insert into venda (produto, util, valor, data)
values (1, 1, 12.50, "2022-05-19");

-- Item
insert into item (nome, descricao, inv)
values ("Shotgun", "Shoot at another player in range to do 15 damage to them. It only hits 1 player", 1);                   

-- Medalha
insert into medalha (nome, nivel, jogo, util)
values ("Player with the most damage dealt at the end of 10 games", 1, 1, 1);
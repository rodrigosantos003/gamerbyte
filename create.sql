-- GAMERBYTE - CREATE
-- AUTORES: João Fernandes & Rodrigo Santos
-- ÚLTIMA MODIFICAÇÃO: 2022-05-16

-- CRIAÇÃO DA BASE DE DADOS
drop database if exists gamerbyte;
create database if not exists gamerbyte;
use gamerbyte;

-- CRIAÇÃO DE TABELAS
-- Utilizador
create table utilizador (id_util int not null auto_increment,
							nome_util varchar(50) not null unique,
                            nome varchar(60) not null,
                            email varchar(50) not null unique,
                            password varchar(30) not null,
                            avatar longblob,
                            data_cri date not null,
                            constraint pk_utilizador_id_ami primary key (id_util));

-- Amizade
create table amizade (id_ami int not null auto_increment,
						util_1 int not null,
                        util_2 int not null,
                        constraint pk_amizade_id_ami primary key (id_ami));

-- Grupo
create table grupo (id_gru int not null auto_increment,
						nome varchar(60) not null unique,
                        constraint pk_grupo_id_gru primary key (id_gru));

-- UserGrupo
create table util_grupo (id_util_gp int not null auto_increment,
							util int not null,
                            grupo int not null,
                            constraint pk_util_grupo_id_util_gp primary key (id_util_gp));

-- Produto
create table produto (id_prod int not null auto_increment,
						tipo varchar(30) not null,
                        constraint pk_produto_id_prod primary key (id_prod));

-- Jogo
create table jogo (id_jog int not null auto_increment,
					nome varchar(60) not null unique,
                    descricao varchar(100) not null,
                    preco double not null,
                    produto int not null,
                    constraint pk_jogo_id_jog primary key (id_jog));

-- Inventario
create table inventario (id_inv int not null auto_increment,
							util int not null,
                            constraint pk_inventario_id_inv primary key (id_inv));

-- ProdutoInv
create table prod_inv (id_prod_inv int not null auto_increment,
							inventario int not null,
                            produto int not null,
                            constraint pk_prod_inv_id_prod_inv primary key (id_prod_inv));

-- Critica
create table critica (id_crit int not null auto_increment,
						data date not null,
                        descricao varchar(100) not null,
                        jogo int not null,
                        util int not null,
                        constraint pk_critica_id_crit primary key (id_crit));

-- Compra
create table compra (id_compra int not null auto_increment,
						produto int not null,
                        util int not null,
                        valor double not null,
                        data date not null,
                        constraint pk_compra_id_compra primary key (id_compra));

-- Venda
create table venda (id_venda int not null auto_increment,
						produto int not null,
                        util int not null,
                        valor double not null,
                        data date not null,
                        constraint pk_compra_id_compra primary key (id_venda));


-- Item
create table item (id_item int not null auto_increment,
					nome varchar(60) not null,
                    descricao varchar(100) not null,
                    inv int not null,
                    constraint pk_item_id_item primary key (id_item));
                    

-- Medalha
create table medalha (id_med int not null auto_increment,
						nome varchar(60) not null unique,
                        nivel double not null,
                        jogo int not null,
                        util int not null,
                        constraint pk_medalha_id_med primary key (id_med),
                        constraint ck_medalha_nivel check (nivel between 0 and 100));

-- DEFINIÇÃO DE FOREIGN KEYS
alter table amizade add constraint fk_amizade_util_1 foreign key (util_1)
references utilizador (id_util);

alter table amizade add constraint fk_amizade_util_2 foreign key (util_2)
references utilizador (id_util);

alter table util_grupo add constraint fk_util_grupo_util foreign key (util)
references utilizador (id_util);

alter table util_grupo add constraint fk_util_grupo_grupo foreign key (grupo)
references grupo (id_gru);

alter table jogo add constraint fk_jogo_produto foreign key (produto)
references produto (id_prod);

alter table inventario add constraint fk_inventario_util foreign key (util)
references utilizador (id_util);

alter table prod_inv add constraint fk_prod_inv_inventario foreign key (inventario)
references inventario (id_inv);

alter table prod_inv add constraint fk_prod_inv_produto foreign key (produto)
references produto (id_prod);

alter table critica add constraint fk_critica_jogo foreign key (jogo)
references jogo (id_jog);

alter table critica add constraint fk_critica_util foreign key (util)
references utilizador (id_util);

alter table item add constraint fk_item_inv foreign key (inv)
references inventario (id_inv);

alter table compra add constraint fk_compra_produto foreign key (produto)
references prod_inv (id_prod_inv);

alter table compra add constraint fk_compra_util foreign key (util)
references utilizador (id_util);

alter table venda add constraint fk_venda_produto foreign key (produto)
references prod_inv (id_prod_inv);

alter table venda add constraint fk_venda_util foreign key (util)
references utilizador (id_util);

alter table medalha add constraint fk_medalha_jogo foreign key (jogo)
references jogo (id_jog);

alter table medalha add constraint fk_medalha_util foreign key (util)
references utilizador (id_util);
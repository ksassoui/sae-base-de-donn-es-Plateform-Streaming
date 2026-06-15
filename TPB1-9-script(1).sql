/*
Groupe TD: B
Groupe TP: B1

Sassoui Kelyan 
Aouchiche Adam
Aurensan Mathis
Fang Daniel
*/



-- supprime le schema streaming si il existe deja
drop schema if exists streaming cascade;
-- creation du schema streaming
create schema streaming;
-- sa nous permet de exécuter des requétesSQL sans préciser le nom du schéma
set search_path to streaming;


-- creation de la table videos
create table videos(
    video_id serial primary key,
    nom varchar(128) not null,
    genre varchar(32) not null,
    date_de_sortie date not null,
    critique varchar(256),
    duree integer not null check (duree > 0),
    vue integer default 0 check (vue >= 0)
);

-- creation de la table films
create table films(
    video_id integer primary key,
    foreign key (video_id) references videos(video_id)
);

-- creation de la table series
create table series(
    video_id integer primary key,
    nb_saison integer not null check (nb_saison > 0),
    foreign key (video_id) references videos(video_id)
);

-- creation de la table acteurs
create table acteurs(
    acteur_id serial primary key,
    nom varchar(64) not null,
    prenom varchar(64) not null,
    date_de_naissance date,
    unique (nom, prenom, date_de_naissance)
);

-- creation de la table realisateurs
create table realisateurs(
    realisateur_id serial primary key,
    nom varchar(64) not null,
    prenom varchar(64) not null,
    unique (nom, prenom)
);

-- creation de la table utilisateurs
create table utilisateurs(
    utilisateur_id serial primary key,
    nom varchar(64) not null,
    prenom varchar(64) not null,
    email varchar(128) not null,
    unique (email)
);

-- creation de la table role
create table roles(
    acteur_id integer,
    video_id integer,
    nom_role varchar(64) not null,
    primary key (acteur_id, video_id),
    foreign key (acteur_id) references acteurs(acteur_id),
    foreign key (video_id) references videos(video_id)
);

-- creation de la table realiser
create table realiser(
    realisateur_id integer,
    video_id integer,
    primary key (realisateur_id, video_id),
    foreign key (realisateur_id) references realisateurs(realisateur_id),
    foreign key (video_id) references videos(video_id)
);

-- creation de la table regarde
create table regarde(
    utilisateur_id integer,
    video_id integer,
    primary key (utilisateur_id, video_id),
    foreign key (utilisateur_id) references utilisateurs(utilisateur_id),
    foreign key (video_id) references videos(video_id)
);

-- ajout de donnés dans la table acteurs
insert into acteurs (nom, prenom, date_de_naissance) values
('Radcliffe','Daniel','1989-07-23'),
('Watson','Emma','1990-04-15'),
('Grint','Rupert','1988-08-24'),
('McConaughey','Matthew','1969-11-04'),
('Murphy','Cillian','1976-05-25'),
('Gosling','Ryan','1980-11-12'),
('Holland','Tom','1996-06-01'),
('Downey','Robert','1965-04-04'),
('Hanks','Tom','1956-07-09'),
('Pattinson','Robert','1986-05-13'),
('Chalamet','Timothee','1995-12-27'),
('Ortega','Jenna','2002-09-27'),
('DArcy','Emma','1992-06-27'),
('Pascal','Pedro','1975-04-02'),
('Ramsey','Bella','2003-09-30'),
('Goggins','Walton','1971-11-10'),
('Sy','Omar','1978-01-20'),
('Godoy','Inaki','2003-08-25'),
('Brown','Millie','2004-02-19'),
('Allen','Jeremy','1991-02-17'),
('Morte','Alvaro','1975-02-23'),
('Steinfeld','Hailee','1996-12-11'),
('Cranston','Bryan','1956-03-07'),
('Paul','Aaron','1979-08-27'),
('Harington','Kit','1986-12-26'),
('Scott','Adam','1973-04-03'),
('Cavill','Henry','1983-05-05'),
('DiCaprio','Leonardo','1974-11-11'),
('Phoenix','Joaquin','1974-10-28'),
('Crowe','Russell','1964-04-07'),
('Kang-ho','Song','1967-01-17'),
('Jung-jae','Lee','1973-03-15'),
('Vicari','Lisa','1997-01-15'),
('Hardy','Tom','1977-09-15'),
('Sudeikis','Jason','1975-09-18'),
('Russell','Wyatt','1986-07-10'),
('Mohammed','Nick','1981-09-18');

-- ajout de donnés dans la table realisateurs
insert into realisateurs (nom, prenom) values
('Columbus','Chris'),
('Nolan','Christopher'),
('Gerwig','Greta'),
('Watts','Jon'),
('Russo','Anthony'),
('Russo','Joe'),
('Darabont','Frank'),
('Reeves','Matt'),
('King','Paul'),
('Burton','Tim'),
('Sapochnik','Miguel'),
('Mazin','Craig'),
('Druckmann','Neil'),
('Nolan','Jonathan'),
('Leterrier','Louis'),
('Jobst','Marc'),
('Duffer','Matt'),
('Duffer','Ross'),
('Storer','Christopher'),
('Charrue','Pascal'),
('Pina','Alex'),
('Safdie','Josh'),
('Villeneuve','Denis'),
('Scott','Ridley'),
('Bong','Joon-ho'),
('Chazelle','Damien'),
('Miller','George'),
('Cameron','James'),
('Gilligan','Vince'),
('Favreau','Jon'),
('Phillips','Todd'),
('Hwang','Dong-hyuk'),
('Bo Odar','Baran'),
('Bathurst','Otto'),
('Stiller','Ben'),
('Marshall','Tom'),
('Filoni','Dave');


-- ajout de donnés dans la table videos
insert into videos (nom, genre, date_de_sortie, duree, critique, vue) values
('Harry Potter a l ecole des sorciers','fantastique','2001-11-16',152,'Superbe adaptation',9500),
('Interstellar','science-fiction','2014-11-07',169,'Chef d oeuvre visuel',13200),
('Oppenheimer','drame','2023-07-19',180,'Dense et intense',12500),
('Barbie','comedie','2023-07-19',114,'Rafraichissant',11800),
('Spider Man No Way Home','action','2021-12-15',148,'Fan service reussi',14000),
('Avengers Endgame','action','2019-04-24',181,'Conclusion epique',13500),
('Marty Supreme','drame','2025-12-25',150,'Interessant',3200),
('La Ligne Verte','drame','1999-12-10',189,'Tres emouvant',4600),
('The Batman','action','2022-03-04',176,'Ambiance incroyable',11100),
('Wonka','fantastique','2023-12-08',116,'Magique',8700),
('Wednesday','fantastique','2022-11-23',50,'Excellent spin-off',15000),
('House of the Dragon','fantastique','2022-08-21',60,'Digne de GoT',14800),
('The Last of Us','drame','2023-01-15',60,'Meilleure adaptation de jeu',14500),
('Fallout','science-fiction','2024-04-10',55,'Fidele a l univers',13900),
('Lupin','policier','2021-01-08',45,'Omar Sy est parfait',12100),
('One Piece','aventure','2023-08-31',55,'Surprenant',13400),
('Stranger Things','science-fiction','2022-05-27',60,'Culte',15200),
('The Bear','drame','2023-06-22',30,'Intensite pure',9800),
('Arcane','animation','2021-11-06',42,'Une claque visuelle',12600),
('La Casa de Papel','action','2021-12-03',50,'Palpitant',11900),
('Dune Premiere Partie','science-fiction','2021-10-22',155,'Epique et contemplatif',12800),
('Dune Deuxieme Partie','science-fiction','2024-03-01',167,'Plus sombre et plus grand',13600),
('The Dark Knight','action','2008-07-18',152,'Le meilleur film de super-heros',15500),
('Inception','science-fiction','2010-07-16',148,'Complexe et captivant',14700),
('Joker','drame','2019-10-04',122,'Phoenix transcende le role',13100),
('Titanic','romance','1997-12-19',195,'Classique immortel',11400),
('Gladiator','action','2000-05-12',155,'Spectaculaire et epique',10200),
('Parasite','thriller','2019-11-07',132,'Oeuvre maitresse de Bong',12300),
('La La Land','comedie','2016-12-09',128,'Enchanteur et melancolique',9700),
('Mad Max Fury Road','action','2015-05-15',120,'Adrenalisant et visuel',11600),
('Breaking Bad','crime','2008-01-20',47,'Serie culte absolue',16000),
('Game of Thrones','fantastique','2011-04-17',57,'Phenomene mondial',15800),
('Dark','science-fiction','2017-12-01',60,'Vertigineux et brillant',11200),
('Severance','science-fiction','2022-02-18',50,'Troublant et original',12000),
('The Witcher','fantastique','2019-12-20',60,'Univers riche et sombre',11700),
('Peaky Blinders','crime','2013-09-12',60,'Tommy Shelby est iconique',12400),
('Squid Game','thriller','2021-09-17',55,'Choc culturel mondial',16500),
('Black Mirror','science-fiction','2011-12-04',60,'Glacant et visionnaire',13800),
('Ted Lasso','comedie','2020-08-14',30,'Chaleureux et drole',10500),
('Mandalorian','science-fiction','2019-11-12',40,'Star Wars au sommet',14200);

-- ajout de donnés dans la table films
insert into films (video_id) values
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(21),
(22),
(23),
(24),
(25),
(26),
(27),
(28),
(29),
(30);

-- ajout de donnés dans la table series
insert into series (video_id, nb_saison) values
(11,2),
(12,2),
(13,2),
(14,2),
(15,3),
(16,2),
(17,4),
(18,3),
(19,2),
(20,5),
(31,5),
(32,8),
(33,3),
(34,2),
(35,3),
(36,6),
(37,2),
(38,6),
(39,3),
(40,3);

-- ajout de donnés dans la table utilisateurs
insert into utilisateurs (nom, prenom, email) values
('Dupont','Jean','dupontjean05@mail.com'),
('Martin','Sophie','93martinsophie@mail.com'),
('Durand','Paul','Duranda0585@mail.com'),
('Bernard','Julie','juliebernard093@mail.com'),
('Petit','Lucas','petitlucas085@mail.com'),
('Robert','Emma','11robertemma@mail.com'),
('Richard','Leo','richardleo92ti@mail.com'),
('Moreau','Sarah','Sarahmoreau@mail.com'),
('Simon','Hugo','vhugoSimon@mail.com'),
('Laurent','Nina','laurent@mail.com'),
('Lefevre','Tom','96lefevretom@mail.com'),
('Garcia','Eva','GarciaAlo@mail.com'),
('Roux','Adam','RouxAdam@mail.com'),
('Fournier','Lina','FournierBlueStar@mail.com'),
('Girard','Noah','12girardnoah@mail.com'),
('Andre','Mia','andremia55@mail.com'),
('Mercier','Ethan','mercierOLEIethan@mail.com'),
('Blanc','Chloe','LeBlanc@mail.com'),
('Guerin','Louis','GuerinSlime@mail.com'),
('Boyer','Jade','mayerjade12@mail.com');

-- ajout de donnés dans la table role
insert into roles (video_id, acteur_id, nom_role) values
(1,1,'Harry Potter'),
(1,2,'Hermione'),
(1,3,'Ron'),
(2,4,'Cooper'),
(3,5,'Oppenheimer'),
(4,6,'Ken'),
(5,7,'Spider Man'),
(6,8,'Iron Man'),
(7,11,'Marty Mauser'),
(8,9,'Paul Edgecomb'),
(9,10,'Batman'),
(10,11,'Wonka'),
(11,12,'Wednesday'),
(12,13,'Rhaenyra'),
(13,14,'Joel'),
(13,15,'Ellie'),
(14,16,'Ghoul'),
(15,17,'Assane'),
(16,18,'Luffy'),
(17,19,'Eleven'),
(18,20,'Carmy'),
(19,22,'Vi'),
(20,21,'Professeur'),
(21,11,'Paul Atreides'),
(22,11,'Paul Atreides'),
(23,5,'Scarecrow'),
(24,28,'Cobb'),
(25,29,'Arthur Fleck'),
(26,28,'Jack Dawson'),
(27,30,'Maximus'),
(28,31,'Ki-taek'),
(29,6,'Sebastian'),
(30,34,'Max Rockatansky'),
(31,23,'Walter White'),
(31,24,'Jesse Pinkman'),
(32,14,'Oberyn Martell'),
(32,25,'Jon Snow'),
(33,33,'Martha Nielsen'),
(34,26,'Mark Scout'),
(35,27,'Geralt'),
(36,5,'Tommy Shelby'),
(37,32,'Seong Gi-hun'),
(38,36,'Cooper'),
(39,35,'Ted Lasso'),
(39,37,'Nate Shelley'),
(40,14,'Din Djarin');

-- ajout de donnés dans la table realiser
insert into realiser (video_id, realisateur_id) values
(1,1),
(2,2),
(3,2),
(4,3),
(5,4),
(6,5),
(6,6),
(7,22),
(8,7),
(9,8),
(10,9),
(11,10),
(12,11),
(13,12),
(13,13),
(14,14),
(15,15),
(16,16),
(17,17),
(17,18),
(18,19),
(19,20),
(20,21),
(21,23),
(22,23),
(23,2),
(24,2),
(25,31),
(26,28),
(27,24),
(28,25),
(29,26),
(30,27),
(31,29),
(32,11),
(33,33),
(34,35),
(35,16),
(36,34),
(37,32),
(38,35),
(39,36),
(40,37);

-- ajout de donnés dans la table regarde
insert into regarde (utilisateur_id, video_id) values
(1,1),
(1,2),
(1,3),
(2,1),
(2,4),
(2,5),
(3,2),
(3,6),
(3,7),
(4,3),
(4,8),
(4,9),
(5,4),
(5,10),
(5,11),
(6,5),
(6,12),
(6,13),
(7,6),
(7,14),
(7,15),
(8,7),
(8,16),
(8,17),
(9,8),
(9,18),
(9,19),
(10,9),
(10,20),
(11,10),
(11,1),
(12,11),
(12,2),
(13,12),
(13,3),
(14,13),
(14,4),
(15,14),
(15,5),
(16,15),
(16,6),
(17,16),
(17,7),
(18,17),
(18,8),
(19,18),
(19,9),
(20,19),
(20,10);

-- les requétes SQL:

-- donne le top 10 des acteurs les plus présents
select a.nom, a.prenom, count(*) as nb_videos
From roles r
Join acteurs a on a.acteur_id = r.acteur_id
group by a.acteur_id, a.nom, a.prenom
order by nb_videos desc
limit 10;



-- donne le top 10 des séries et des film les plus vue
select nom, vue
from videos
order by vue desc
limit 10;



-- donne la répartition des genres de video (film et séries)
select genre, count(*) as nb_contenus
from videos
group by genre
order by nb_contenus desc;



-- donne la recommendation des 3 meilleurs video de leur genre 
select v1.genre, v1.nom, v1.vue
from videos v1
where (select count(*) 
from videos v2 
where v2.genre = v1.genre 
and v2.vue > v1.vue) < 3
order by v1.genre, v1.vue desc;



-- donne le top 10 des utilisateur qui on regarder le plus de video(film ou séries) 
select u.nom, u.prenom, count(*) as nb_videos
from regarde r
join utilisateurs u on u.utilisateur_id = r.utilisateur_id
group by u.nom, u.prenom
order by nb_videos desc
limit 10;



-- doone le top 10 des acteur présents 
-- dans les videos les plus populaires
select a.nom, a.prenom, sum(v.vue) as total_vues
from roles r
join acteurs a on a.acteur_id = r.acteur_id
join videos v on v.video_id = r.video_id
group by a.nom, a.prenom
order by total_vues desc
limit 10;



-- donne la relation entre le nombre de saison de la séries
-- et le nombre de vue
select s.nb_saison, v.vue
from streaming.series s
join streaming.videos v on v.video_id = s.video_id;



-- donne de nombre de film et série sortie de 2010 a 2025
select extract(year from date_de_sortie) as année, count(*) as nb
from videos
where date_de_sortie >= '2010-01-01'
group by année
order by année;


-- donne le total de vue de chaque genre
select genre, sum(vue) as total_vues
from videos
group by genre
order by total_vues desc;


-- donne le nombre de vue total de chaque 
-- de chaque realisateur par ordre décroissants
select re.nom, sum(v.vue) as total_vues
from realiser r
join realisateurs re on re.realisateur_id = r.realisateur_id
join videos v on v.video_id = r.video_id
group by re.nom
order by total_vues desc;
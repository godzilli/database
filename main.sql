CREATE SCHEMA `pythondb` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE `pythondb`.`pokemon` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL DEFAULT 'pikachu',
  `numeropokedex` INT UNSIGNED NOT NULL,
  `genero` ENUM('Masculino', 'Feminino') NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE,
  UNIQUE INDEX `numero_pokedex_UNIQUE` (`numero_pokedex` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

ALTER TABLE `pythondb`.`pokemon` 
ADD COLUMN `criado_em` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER `genero`,
CHANGE COLUMN `numeropokedex` `numero_pokedex` INT UNSIGNED NOT NULL ;

CREATE TABLE `tipo` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(10) NOT NULL UNIQUE,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SELECT * FROM tipo;

INSERT INTO tipo (`nome`)
VALUES ("Água"), ("Fogo");

CREATE TABLE `tipo_pokemon` (
  `id_pokemon` int unsigned NOT NULL,
  `id_tipo` int unsigned NOT NULL,
  PRIMARY KEY (`id_pokemon`, `id_tipo`)
  
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- SET SQL_SAFE_UPDATES=1;

DELETE FROM tipo_pokemon WHERE id_pokemon = 5 and id_tipo = 4;

-- TRUNCATE apaga a linha inteira de uma tabela sem utilizar WHERE

INSERT INTO tipo_pokemon (`id_pokemon`, `id_tipo`)
VALUES (2,59);

select p.nome,t.nome from pokemon p
INNER JOIN tipo_pokemon tp ON tp.id_pokemon = p.id
INNER JOIN tipo t ON t.id = tp.id_tipo;

select * from tipo_pokemon;

select * from pokemon;

UPDATE `pythondb`.`tipo_pokemon` SET `id_tipo` = '2' WHERE (`id_pokemon` = '2') and (`id_tipo` = '3');

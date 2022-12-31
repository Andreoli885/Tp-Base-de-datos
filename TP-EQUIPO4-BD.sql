

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cliente` ;

CREATE TABLE IF NOT EXISTS `cliente` (
  `id_codigo` INT NOT NULL,
  `dni` int(11) NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  PRIMARY KEY (`id_codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `telefono`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `telefono` ;

CREATE TABLE IF NOT EXISTS `telefono` (
  `telefono_fijo` INT NOT NULL,
  `telefono_movil` INT NULL,
  `trabajadores_id_codigo` INT NOT NULL,
  CONSTRAINT `fk_telefono_trabajadores1`
    FOREIGN KEY (`trabajadores_id_codigo`)
    REFERENCES `trabajador` (`id_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `trabajador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trabajador` ;

CREATE TABLE IF NOT EXISTS `trabajador` (
  `id_codigo` INT NOT NULL,
  `dni` int(11) NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `cliente_id_codigo` INT NOT NULL,
  PRIMARY KEY (`id_codigo`),
  CONSTRAINT `fk_trabajador_cliente1`
    FOREIGN KEY (`cliente_id_codigo`)
    REFERENCES `cliente` (`id_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `telefono`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `telefono` ;

CREATE TABLE IF NOT EXISTS `telefono` (
  `telefono_fijo` INT NOT NULL,
  `telefono_movil` INT NULL,
  `trabajadores_id_codigo` INT NOT NULL,
  CONSTRAINT `fk_telefono_trabajadores1`
    FOREIGN KEY (`trabajadores_id_codigo`)
    REFERENCES `trabajador` (`id_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `locales`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `locales` ;

CREATE TABLE IF NOT EXISTS `locales` (
  `idlocales` INT NOT NULL,
  `disponibilidad` VARCHAR(45) NULL,
  PRIMARY KEY (`idlocales`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inmuebles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inmuebles` ;

CREATE TABLE IF NOT EXISTS `inmuebles` (
  `id_codigo` INT  NULL,
  `metros` DOUBLE NULL,
  `descripcion` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `codigo_compra` INT NULL,
  `fecha_compra` DATE NULL,
  `nombre` VARCHAR(45) NULL,
  
  `ciudad` VARCHAR(45) NULL,
  PRIMARY KEY (`id_codigo`))
  
    
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `garage`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `garage` ;

CREATE TABLE IF NOT EXISTS `garage` (
  `numero_cochera` INT NOT NULL,
  `planta` INT NULL,
  `npiso` INT NULL,
  `inmuebles_id_codigo` INT NOT NULL,
  
  CONSTRAINT `fk_garage_inmuebles1`
    FOREIGN KEY (`inmuebles_id_codigo`)
    REFERENCES `inmuebles` (`id_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `mantenimiento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mantenimiento` ;

CREATE TABLE IF NOT EXISTS `mantenimiento` (
  `codigo_reparacion` INT NOT NULL,
  `fecha_inicio` DATETIME NULL,
  `fecha_fin` DATETIME NULL,
  `costo` DOUBLE NOT NULL,
  PRIMARY KEY (`codigo_reparacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabajadores_has_mantenimiento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trabajadores_has_mantenimiento` ;

CREATE TABLE IF NOT EXISTS `trabajadores_has_mantenimiento` (
  `trabajadores_id_codigo` INT NOT NULL,
  `mantenimiento_codigo_reparacion` INT NOT NULL,
  PRIMARY KEY (`trabajadores_id_codigo`, `mantenimiento_codigo_reparacion`),
  CONSTRAINT `fk_trabajadores_has_mantenimiento_trabajadores`
    FOREIGN KEY (`trabajadores_id_codigo`)
    REFERENCES `trabajador` (`id_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trabajadores_has_mantenimiento_mantenimiento1`
    FOREIGN KEY (`mantenimiento_codigo_reparacion`)
    REFERENCES `mantenimiento` (`codigo_reparacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `compra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `compra` ;

CREATE TABLE IF NOT EXISTS `compra` (
  `inmuebles_id_codigo` INT null  ,
  `cliente_id_codigo` INT NOT NULL,
    `valor_compra` DOUBLE NULL,
PRIMARY KEY (`inmuebles_id_codigo`, `cliente_id_codigo`),
  CONSTRAINT `fk_inmuebles_has_cliente_inmuebles1`
    FOREIGN KEY (`inmuebles_id_codigo`)
    REFERENCES `inmuebles` (`id_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inmuebles_has_cliente_cliente1`
    FOREIGN KEY (`cliente_id_codigo`)
    REFERENCES `cliente` (`id_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `cliente` (`id_codigo`, `dni`, `nombre`, `apellido`) VALUES (1, '4643843', 'juan', 'lopez');
INSERT INTO `cliente` (`id_codigo`, `dni`, `nombre`, `apellido`) VALUES (2, '22122871', 'nico', 'nicol');
INSERT INTO `cliente` (`id_codigo`, `dni`, `nombre`, `apellido`) VALUES (3, '15919132', 'juan', 'juansi');
INSERT INTO `cliente` (`id_codigo`, `dni`, `nombre`, `apellido`) VALUES (4, '5161655', 'esteban', 'este'); 
INSERT INTO `cliente` (`id_codigo`, `dni`, `nombre`, `apellido`) VALUES (5, '15159215', 'matias', 'lennon');
INSERT INTO `cliente` (`id_codigo`, `dni`, `nombre`, `apellido`) VALUES (6, '15919123', 'leo', 'messi');
INSERT INTO `cliente` (`id_codigo`, `dni`, `nombre`, `apellido`) VALUES (7, '51616523', 'niko', 'bellic');
INSERT INTO `cliente` (`id_codigo`, `dni`, `nombre`, `apellido`) VALUES (8, '46166233', 'carl', 'johnson');
INSERT INTO `cliente` (`id_codigo`, `dni`, `nombre`, `apellido`) VALUES (9, '1515919', 'roman', 'riquelme');
INSERT INTO `cliente` (`id_codigo`, `dni`, `nombre`, `apellido`) VALUES (10,'32548945', 'perez', 'juansi');




INSERT INTO `inmuebles` (`id_codigo`, `metros`, `descripcion`, `direccion`, `codigo_compra`, `fecha_compra`, `nombre`, `ciudad`) VALUES (1, 19, 'local ', 'aliba2', 156, '2000/10/1',  'local de comida',  'Matanza');
INSERT INTO `inmuebles` (`id_codigo`, `metros`, `descripcion`, `direccion`, `codigo_compra`, `fecha_compra`,  `nombre`,  `ciudad`) VALUES (2, 18, 'garage ', 'aliba22', 156, '2020/8/1', 'garage matanza',  'Matanza');
INSERT INTO `inmuebles` (`id_codigo`, `metros`, `descripcion`, `direccion`, `codigo_compra`, `fecha_compra`,  `nombre`, `ciudad`) VALUES (3, 19, 'piso ', 'aliba 23', 156, '2000/9/1', 'piso en la Matanza',  'Matanza');
INSERT INTO `inmuebles` (`id_codigo`, `metros`, `descripcion`, `direccion`, `codigo_compra`, `fecha_compra`,  `nombre`,  `ciudad`) VALUES (4, 20, 'local ' , 'chile1 23' ,120, '2020/8/3', 'local de ropa', 'Tigre');
INSERT INTO `inmuebles` (`id_codigo`, `metros`, `descripcion`, `direccion`, `codigo_compra`, `fecha_compra`,  `nombre`, `ciudad`) VALUES (5,33, 'piso ' , 'brasil 21' ,130, '2020/6/1', 'piso en palermo', 'Palermo');
INSERT INTO `inmuebles` (`id_codigo`, `metros`, `descripcion`, `direccion`, `codigo_compra`, `fecha_compra`,  `nombre`, `ciudad`) VALUES (6,51, 'piso' , 'francia 31', 150, '2020/12/31', 'departamento', 'Belgrano');
INSERT INTO `inmuebles` (`id_codigo`, `metros`, `descripcion`, `direccion`, `codigo_compra`, `fecha_compra`,  `nombre`, `ciudad`) VALUES (8,22, 'piso ', 'corrientes 22',160, '2000/12/11' , 'piso en san isidro','San Isidro');
INSERT INTO `inmuebles` (`id_codigo`, `metros`, `descripcion`, `direccion`, `codigo_compra`, `fecha_compra`,  `nombre`, `ciudad`) VALUES (9 ,31, 'garage ' , 'santa fe 30 ',180 , '2020/5/5',  'garage en beccar', ' Beccar');
INSERT INTO `inmuebles` (`id_codigo`, `metros`, `descripcion`, `direccion`, `codigo_compra`, `fecha_compra`, `nombre`, `ciudad`) VALUES (10 ,100, 'local ' , 'cordoba',190 ,'2015/2/2' ,  'local de casino' , 'Martinez');
INSERT INTO `inmuebles` (`id_codigo`, `metros`, `descripcion`, `direccion`, `codigo_compra`, `fecha_compra`, `nombre`, `ciudad`) VALUES (11, 10, 'local ', 'rosario 22' ,60, '2020/6/2', 'local de guitarras',  'San pedro ');

																																							
INSERT INTO  `compra`(`inmuebles_id_codigo`,`cliente_id_codigo`,`valor_compra`) VALUES (1,1,20000);
INSERT INTO  `compra`(`inmuebles_id_codigo`,`cliente_id_codigo`,`valor_compra`) VALUES (2,2,35000);
INSERT INTO  `compra`(`inmuebles_id_codigo`,`cliente_id_codigo`,`valor_compra`) VALUES (3,3,2000000);
INSERT INTO  `compra`(`inmuebles_id_codigo`,`cliente_id_codigo`,`valor_compra`) VALUES (4,4,33000);
INSERT INTO  `compra`(`inmuebles_id_codigo`,`cliente_id_codigo`,`valor_compra`) VALUES  (5,5,12300);
INSERT INTO  `compra`(`inmuebles_id_codigo`,`cliente_id_codigo`,`valor_compra`) VALUES  (6,6,22000);
INSERT INTO  `compra`(`inmuebles_id_codigo`,`cliente_id_codigo`,`valor_compra`) VALUES (8,7,22000);
INSERT INTO  `compra`(`inmuebles_id_codigo`,`cliente_id_codigo`,`valor_compra`) VALUES  (9,8,11000);
INSERT INTO  `compra`(`inmuebles_id_codigo`,`cliente_id_codigo`,`valor_compra`) VALUES  (10,9,1000000);
INSERT INTO  `compra`(`inmuebles_id_codigo`,`cliente_id_codigo`,`valor_compra`) VALUES  (11,10,70000);









/* En qué ciudad estan los locales más caros? */

select ciudad, valor_compra,descripcion
from inmuebles
inner join  compra
on inmuebles.id_codigo = compra.inmuebles_id_codigo
where descripcion="local" 
ORDER BY valor_compra DESC ;
;


/*  Listado de ventas por ciudad en el último año? Ordenado de mayor a menor. */
SELECT nombre,valor_compra,ciudad,fecha_compra
from inmuebles
inner join compra
on inmuebles.id_codigo = compra.inmuebles_id_codigo
where year (fecha_compra)='2020'
ORDER BY valor_compra DESC ;




/*   Listar la cantidad de Pisos, locales y garages vendidos en el último semestre.  */
SELECT descripcion,COUNT(descripcion) AS "Cantidad" 
FROM inmuebles	
 where fecha_compra between '2020/6/1' and '2020/12/31'
GROUP BY descripcion;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

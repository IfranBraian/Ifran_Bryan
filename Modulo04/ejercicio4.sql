SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema trabajo4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema trabajo4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `trabajo4` DEFAULT CHARACTER SET utf8 ;
USE `trabajo4` ;

-- -----------------------------------------------------
-- Table `trabajo4`.`ALumnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabajo4`.`ALumnos` (
  `Cod_Matricula` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `DNI` VARCHAR(45) NOT NULL,
  `Fecha_de_Nacimiento` DATE NOT NULL,
  PRIMARY KEY (`Cod_Matricula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabajo4`.`Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabajo4`.`Curso` (
  `IdCurso` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdCurso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabajo4`.`Alumnos_Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabajo4`.`Alumnos_Curso` (
  `ALumnos_Cod_Matricula` INT NOT NULL,
  `Curso_IdCurso` INT NOT NULL,
  PRIMARY KEY (`ALumnos_Cod_Matricula`, `Curso_IdCurso`),
  INDEX `fk_Alumnos_Curso_Curso1_idx` (`Curso_IdCurso` ASC) VISIBLE,
  CONSTRAINT `fk_Alumnos_Curso_ALumnos`
    FOREIGN KEY (`ALumnos_Cod_Matricula`)
    REFERENCES `trabajo4`.`ALumnos` (`Cod_Matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumnos_Curso_Curso1`
    FOREIGN KEY (`Curso_IdCurso`)
    REFERENCES `trabajo4`.`Curso` (`IdCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabajo4`.`Profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabajo4`.`Profesor` (
  `IdProfesor` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Especialidad` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdProfesor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabajo4`.`Curso_Profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabajo4`.`Curso_Profesor` (
  `Profesor_IdProfesor` INT NOT NULL,
  `Curso_IdCurso` INT NOT NULL,
  PRIMARY KEY (`Profesor_IdProfesor`, `Curso_IdCurso`),
  INDEX `fk_Curso_Profesor_Curso1_idx` (`Curso_IdCurso` ASC) VISIBLE,
  CONSTRAINT `fk_Curso_Profesor_Profesor1`
    FOREIGN KEY (`Profesor_IdProfesor`)
    REFERENCES `trabajo4`.`Profesor` (`IdProfesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Curso_Profesor_Curso1`
    FOREIGN KEY (`Curso_IdCurso`)
    REFERENCES `trabajo4`.`Curso` (`IdCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Insertar datos en las tablas.
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Insertar datos en la tabla 'ALumnos'.
-- -----------------------------------------------------
INSERT INTO ALumnos (Cod_Matricula,Nombre,DNI,Fecha_de_Nacimiento)
VALUES (01,'Carlos',4567890,'2000/03/15');

INSERT INTO ALumnos (Cod_Matricula,Nombre,DNI,Fecha_de_Nacimiento)
VALUES (02,'Pedro',43847574,'2004/07/20');

INSERT INTO ALumnos (Cod_Matricula,Nombre,DNI,Fecha_de_Nacimiento)
VALUES (03,'Juan',47239567,'2002/01/06');

-- -----------------------------------------------------
-- Insertar datos en la tabla 'Curso'
-- -----------------------------------------------------
INSERT INTO Curso (IdCurso,Nombre)
VALUES (01,'Matemáticas');

INSERT INTO Curso (IdCurso,Nombre)
VALUES (02,'Economía');

INSERT INTO Curso (IdCurso,Nombre)
VALUES (03,'Lengua Extranjera');

-- -----------------------------------------------------
-- Insertar datos en la tabla 'Profesor'
-- -----------------------------------------------------
INSERT INTO Profesor (IdProfesor,Nombre,Especialidad,Email)
VALUES (01,'Sancho','Economía','sancho45@gamil.com');

INSERT INTO Profesor (IdProfesor,Nombre,Especialidad,Email)
VALUES (02,'Lorenzo','Matemáticas','Lorenz0@gamil.com');

INSERT INTO Profesor (IdProfesor,Nombre,Especialidad,Email)
VALUES (03,'Samanta','Lengua Extranjera','sam7@gamil.com');



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
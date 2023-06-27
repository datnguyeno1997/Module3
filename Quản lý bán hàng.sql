CREATE SCHEMA `quanlybanhang` ;
USE quanlybanhang;

CREATE TABLE `quanlybanhang`.`customer` (
  `cID` INT NOT NULL,
  `cName` VARCHAR(45) NULL,
  `cAge` INT NULL,
  PRIMARY KEY (`cID`));

CREATE TABLE `quanlybanhang`.`order` (
  `oID` INT NOT NULL,
  `cID` INT NULL,
  `oDate` DATETIME NULL,
  `oTotalPrice` FLOAT NULL,
  PRIMARY KEY (`oID`),
  INDEX `cId_idx` (`cID` ASC),
  CONSTRAINT `cId`
    FOREIGN KEY (`cID`) REFERENCES `quanlybanhang`.`customer` (`cID`));
    
    CREATE TABLE `quanlybanhang`.`product` (
  `pID` INT NOT NULL,
  `pName` VARCHAR(45) NULL,
  `pPrice` FLOAT NULL,
  PRIMARY KEY (`pID`));

CREATE TABLE `quanlybanhang`.`orderdetail` (
  `oID` INT NOT NULL,
  `pID` INT NOT NULL,
  `odQTY` VARCHAR(45) NULL,
  PRIMARY KEY (`oID`, `pID`),
  INDEX `pId_idx` (`pID` ASC),
  CONSTRAINT `oId`
  FOREIGN KEY (`oID`) REFERENCES `quanlybanhang`.`order` (`oID`),
  CONSTRAINT `pId`
  FOREIGN KEY (`pID`) REFERENCES `quanlybanhang`.`product` (`pID`));

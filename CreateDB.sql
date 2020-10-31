DROP SCHEMA IF EXISTS `triggerexample` ;

CREATE SCHEMA IF NOT EXISTS `triggerexample` DEFAULT CHARACTER SET utf8 ;
USE `triggerexample` ;

-- -----------------------------------------------------
-- Table `customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `customer` ;

CREATE TABLE IF NOT EXISTS `customer` (
  `CustomerID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(255) NOT NULL,
  `Status` VARCHAR(9) NOT NULL,
  `Address` VARCHAR(255) NOT NULL,
  `State` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE INDEX `CustomerID_UNIQUE` (`CustomerID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `salesorder`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `salesorder` ;

CREATE TABLE IF NOT EXISTS `salesorder` (
  `OrderID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `CustomerID` INT UNSIGNED NOT NULL,
  `OrderDate` DATETIME NOT NULL,
  `Amount` DECIMAL(10,2) UNSIGNED NOT NULL,
  `PaymentDate` DATETIME,
  PRIMARY KEY (`OrderID`, `CustomerID`),
  UNIQUE INDEX `OrderID_UNIQUE` (`OrderID` ASC),
  INDEX `fk_order_customer_idx` (`CustomerID` ASC),
  CONSTRAINT `fk_order_customer`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `product` ;

CREATE TABLE IF NOT EXISTS `product` (
  `ProductID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ProductName` VARCHAR(45) NOT NULL,
  `AvailableStock` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`ProductID`),
  UNIQUE INDEX `ProductID_UNIQUE` (`ProductID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orderitem`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `orderitem` ;

CREATE TABLE IF NOT EXISTS `orderitem` (
  `OrderItemID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `OrderID` INT UNSIGNED NOT NULL,
  `ProductID` INT UNSIGNED NOT NULL,
  `Quantity` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`OrderItemID`, `OrderID`, `ProductID`),
  UNIQUE INDEX `OrderItemID_UNIQUE` (`OrderItemID` ASC),
  INDEX `fk_orderitem_order1_idx` (`OrderID` ASC),
  INDEX `fk_orderitem_product1_idx` (`ProductID` ASC),
  CONSTRAINT `fk_orderitem_order1`
    FOREIGN KEY (`OrderID`)
    REFERENCES `salesorder` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderitem_product1`
    FOREIGN KEY (`ProductID`)
    REFERENCES `product` (`ProductID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


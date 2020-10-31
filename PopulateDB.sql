USE triggerexample;

SET SQL_SAFE_UPDATES = 0;
SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM `customer`;
INSERT INTO `customer` (`CustomerID`, `Name`, `Status`, `Address`, `State`)
VALUES ('1','Bunny', 'ACTIVE', '10 Nowhere St', 'NSW');
INSERT INTO `customer` (`CustomerID`, `Name`, `Status`, `Address`, `State`)
VALUES ('2','Mickey', 'ACTIVE', '23/9 Faraway Lane', 'VIC');
INSERT INTO `customer` (`CustomerID`, `Name`, `Status`, `Address`, `State`)
VALUES ('3','Charlie', 'BLOCKED', '5 Middle of Nowhere', 'QLD');
INSERT INTO `customer` (`CustomerID`, `Name`, `Status`, `Address`, `State`)
VALUES ('4','Grinch', 'ACTIVE', '44 Lala Land St', 'NSW');
INSERT INTO `customer` (`CustomerID`, `Name`, `Status`, `Address`, `State`)
VALUES ('5','Goofy', 'BLOCKED', '31 Somewhere St', 'QLD');

DELETE FROM `product`;
INSERT INTO `product` (`ProductID`, `ProductName`, `AvailableStock`)
VALUES ('1', 'Chocolate Chip Cookies', '100');
INSERT INTO `product` (`ProductID`, `ProductName`, `AvailableStock`)
VALUES ('2', 'Dark Cherry Cookies ', '10');
INSERT INTO `product` (`ProductID`, `ProductName`, `AvailableStock`)
VALUES ('3', 'Gluten-free White Chocolate Cookies', '30');
INSERT INTO `product` (`ProductID`, `ProductName`, `AvailableStock`)
VALUES ('4', 'Black Sesame Cookies', '45');
INSERT INTO `product` (`ProductID`, `ProductName`, `AvailableStock`)
VALUES ('5', 'Gingerbread Cookies', '20');

DELETE FROM `salesorder`;
INSERT INTO `triggerexample`.`salesorder` (`OrderID`, `CustomerID`, `OrderDate`, `Amount`, `PaymentDate`)
VALUES ('1', '1' , '2020-10-20', '60.00', '2020-10-20');
INSERT INTO `triggerexample`.`salesorder` (`OrderID`, `CustomerID`, `OrderDate`, `Amount`, `PaymentDate`)
VALUES ('2', '3', '2020-10-20', '20.00', NULL);
INSERT INTO `triggerexample`.`salesorder` (`OrderID`, `CustomerID`, `OrderDate`, `Amount`, `PaymentDate`)
VALUES ('3', '2', '2020-10-21', '35.00', '2020-10-21');
INSERT INTO `triggerexample`.`salesorder` (`OrderID`, `CustomerID`, `OrderDate`, `Amount`, `PaymentDate`)
VALUES ('4', '4', '2020-10-22', '80.00', '2020-10-22');
INSERT INTO `triggerexample`.`salesorder` (`OrderID`, `CustomerID`, `OrderDate`, `Amount`, `PaymentDate`)
VALUES ('5', '5', '2020-10-23', '40.00', NULL);
INSERT INTO `triggerexample`.`salesorder` (`OrderID`, `CustomerID`, `OrderDate`, `Amount`, `PaymentDate`)
VALUES ('6', '1', '2020-10-27', '30.00', '2020-10-28');
INSERT INTO `triggerexample`.`salesorder` (`OrderID`, `CustomerID`, `OrderDate`, `Amount`, `PaymentDate`)
VALUES ('7', '2', '2020-10-28', '50.00', '2020-10-30');
INSERT INTO `triggerexample`.`salesorder` (`OrderID`, `CustomerID`, `OrderDate`, `Amount`, `PaymentDate`)
VALUES ('8', '4', '2020-10-29', '50.00', NULL);

DELETE FROM orderitem;
INSERT INTO `orderitem` (`OrderItemID`, `OrderID`, `ProductID`, `Quantity`)
VALUES ('1','1','1','12');
INSERT INTO `orderitem` (`OrderItemID`, `OrderID`, `ProductID`, `Quantity`)
VALUES ('2','2','2','2');
INSERT INTO `orderitem` (`OrderItemID`, `OrderID`, `ProductID`, `Quantity`)
VALUES ('3','2','4','2');
INSERT INTO `orderitem` (`OrderItemID`, `OrderID`, `ProductID`, `Quantity`)
VALUES ('4','3','1','1');
INSERT INTO `orderitem` (`OrderItemID`, `OrderID`, `ProductID`, `Quantity`)
VALUES ('5','3','3','2');
INSERT INTO `orderitem` (`OrderItemID`, `OrderID`, `ProductID`, `Quantity`)
VALUES ('6','3','5','4');
INSERT INTO `orderitem` (`OrderItemID`, `OrderID`, `ProductID`, `Quantity`)
VALUES ('7','4','1','5');
INSERT INTO `orderitem` (`OrderItemID`, `OrderID`, `ProductID`, `Quantity`)
VALUES ('8','4','2','6');
INSERT INTO `orderitem` (`OrderItemID`, `OrderID`, `ProductID`, `Quantity`)
VALUES ('9','4','3','2');
INSERT INTO `orderitem` (`OrderItemID`, `OrderID`, `ProductID`, `Quantity`)
VALUES ('10','4','4','2');
INSERT INTO `orderitem` (`OrderItemID`, `OrderID`, `ProductID`, `Quantity`)
VALUES ('11','4','5','1');
INSERT INTO `orderitem` (`OrderItemID`, `OrderID`, `ProductID`, `Quantity`)
VALUES ('12','5','3','8');
INSERT INTO `orderitem` (`OrderItemID`, `OrderID`, `ProductID`, `Quantity`)
VALUES ('13','6','1','6');
INSERT INTO `orderitem` (`OrderItemID`, `OrderID`, `ProductID`, `Quantity`)
VALUES ('14','7','4','5');
INSERT INTO `orderitem` (`OrderItemID`, `OrderID`, `ProductID`, `Quantity`)
VALUES ('15','7','5','5');
INSERT INTO `orderitem` (`OrderItemID`, `OrderID`, `ProductID`, `Quantity`)
VALUES ('16','8','1','3');
INSERT INTO `orderitem` (`OrderItemID`, `OrderID`, `ProductID`, `Quantity`)
VALUES ('17','8','3','3');
INSERT INTO `orderitem` (`OrderItemID`, `OrderID`, `ProductID`, `Quantity`)
VALUES ('18','8','4','4');

SET FOREIGN_KEY_CHECKS = 1;

SELECT * from product;
SELECT * from customer;
SELECT * from salesorder;
SELECT * from orderitem;
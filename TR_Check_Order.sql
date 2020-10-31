USE triggerexample;

DELIMITER //
DROP TRIGGER IF EXISTS TR_Check_Order 
//

CREATE TRIGGER TR_Check_Order
BEFORE INSERT ON salesorder
FOR EACH ROW

BEGIN

IF (SELECT Status FROM customer WHERE CustomerID = new.CustomerID) = 'BLOCKED' 
THEN SIGNAL SQLSTATE '13000' SET MESSAGE_TEXT = 'Customer has been blocked.';

ELSE IF new.Amount < 20 
THEN SIGNAL SQLSTATE '14000' SET MESSAGE_TEXT = 'This order does not meet the minimum order amout of $20.';

ELSE IF (SELECT COUNT(OrderID) FROM salesorder 
WHERE CustomerID = new.CustomerID AND PaymentDate IS NULL) > 0 
THEN SIGNAL SQLSTATE '15000' SET MESSAGE_TEXT = 'Customer has outstanding payment.';
		
END IF;
END IF;
END IF;

END;

//
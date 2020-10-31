/* 

TEST SCRIPT FOR TR_Check_Order

Purpose: To validate whether the trigger TR_Check_Order works as expected based on 4 agreed test cases.

Before you begin, please perform the following steps. 

Step 1. Create the tables by executing the CreateDB.sql file
Step 2. Populate the tables with sample datas by executing the PopulateDB.sql file
Step 3. Create the trigger by executing the TR_Check_Order.sql file

Upon completing the initial setup, please execute each code in the below steps ONE BY ONE for the actual testing of TR_Check_Order trigger. */

-- Step 4. Specify the name of the database to be used for subsequent statements. Here we use the name of the database/ schema created from the CreateDB.sql script, which is "triggerexample"
USE triggerexample;

-- Step 5. Turn off autocommit to facilitate rolling back of transaction
SET autocommit = 0;

-- Step 6. Inspect the customer and salesorder table, choose the "Don't limit" option and notice the number of records before executing any INSERT statement
SELECT * FROM salesorder;
SELECT * FROM customer;

-- Step 7. Insert new records to the salesorder table for each test case and validate the actual result versus the expected result

-- Step 7A. Test Case 1 - A customer with BLOCKED status places an order
-- Expected Result: INSERT not allowed. Error Message: Customer has been blocked
INSERT INTO `salesorder`(`CustomerID`, `OrderDate`, `Amount`, `PaymentDate`)
VALUES ('3', curdate(), '50.00', NULL);

-- Step 7B. Test Case 2 - The order's Amount is less than $20
-- Expected Result: INSERT not allowed. Error Message: Customer has been blocked
INSERT INTO `salesorder`(`CustomerID`, `OrderDate`, `Amount`, `PaymentDate`)
VALUES ('1', curdate(), '19.00', NULL);

-- Step 7C. Test Case 3 - The customer has an unpaid order.
-- Expected Result: INSERT not allowed. Error Message: Customer has outstanding payment.
INSERT INTO `salesorder`(`CustomerID`, `OrderDate`, `Amount`, `PaymentDate`)
VALUES ('4', curdate(), '60.00', NULL);

-- Step 7D. Test Case 4 - The sales order passes all 3 checks.
-- Expected Result: INSERT allowed. No error message is displayed. A new salesorder record is created.
INSERT INTO `salesorder`(`CustomerID`, `OrderDate`, `Amount`, `PaymentDate`)
VALUES ('2', curdate(), '60.00', NULL);

SELECT * FROM salesorder;

-- Step 8. Bring the database back to the original state
ROLLBACK;

/* THE END */
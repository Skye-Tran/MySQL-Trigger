# MySQL-Trigger

For this short tutorial, we will illustrate how to create a trigger for a simplified database. Belonging to a dummy business named The Hoot Cookies. 
- The database is used to track sales orders from customers who ordered cookies via the online shop. 
- The business accepted credit sales for some customers with a 3-day credit term. 
  - During those 3 days, no further sales order can be placed for the same customer before the payment is settled. 
  - If no payment is received after 3 days from the order date, the customer’s Status will be changed to BLOCKED. 
  
The trigger called TR_Check_Order will fire when a customer wishes to place an order and checks for the following conditions:
- The customer’s Status can’t be “BLOCKED”. 
- The order’s Amount has to be at least $20
- The customer does not have any overdue invoice which has not been paid.
If the above check pass, then the INSERT statement is allowed to proceed.  

Here is the sequence to review the files.
1. ERD: contain the entity-relationship diagram of the database.
2. CreateDB: to create the database schema
3. PopulateDB: to populate the database with sample data
4. TR_Check_Order: to create the database trigger to solve the above-mentioned problem
5. TestScript: to test whether the trigger works according to 4 different test cases.


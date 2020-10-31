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

Further explanation about the code can be found on my blog digitalskye.com 

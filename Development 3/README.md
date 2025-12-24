## Sales department:

- The company wants to classify customers based on custom categories that they can define as needed and that can change in the future. Each customer category must have its own details that can be used for some business processes inside the ERP.
- The sales office must be able to set up a default customer category and assign this default value to a customer automatically.
- The sales office needs the possibility to create gift campaigns for customer categories. A gift campaign is related to a limited period of time and a limited set of items.
- A gift campaign can be set to inactive for a certain period of time.
- When a gift campaign is active, the sales order manager must be able to automatically assign free gifts on a customer’s sales order (they need a button on a sales order document that an alyzes the order content, checks whether a campaign is active, and creates a line in the order for a free gift accordingly).
- When a sales operator inserts a sales order line, they should be alerted if the customer is ordering an item quantity near to the threshold of an active campaign promotion.
- When a sales order is posted, the generated item ledger entry record must store the custom er category value that the customer has assigned at the time of posting for future reporting purposes.
- They want to have the possibility to calculate item charges based on defined criteria and automatically assign charges to a sales order by clicking a button on the sales order document.

## Vendor quality management:

- The company has a quality process in place (CSQ, from the International Institute for the Certification of Business Quality) and they need to classify vendors according to their CSQ requirements:
  - Score related to item quality (from 1 to 10)
  - Score related to delivery on time (from 1 to 10)
  - Score related to item packaging (from 1 to 10)
  - Score related to pricing (from 1 to 10)
- The vendor quality card must also display some financial data:
  - Invoiced for current year N
  - Invoiced for the year N-1
  - Invoiced for the year N-2
  - Amount due for this vendor
  - Amount to pay (not already due) for this vendor
- The assigned scores determine a vendor rating (a numeric value) based on an algorithm.
- The purchase office cannot release a purchase order if the vendor does not meet standard company requirements (the vendor rating).
- The application’s behavior should have the capacity to be extended in the future.

### Customer category implementations

One of the business requirements was to have the ability to group customers by category.
To handle the customer category management requirements, we need to do the following:

1. Define the Customer Category table.
2. Create the pages (user interface) that will handle the Customer Category entity (the List and Card pages).
3. Add a new Customer Category field to the standard Customer table.
4. Add the new field to the standard Customer Card page in the General tab and add some actions to the Customer pages to handle some tasks.
5. Create the business logic to handle the requirements.

### Gift campaign implementations

To handle the gift campaign requirements, we need to do the following:

1. Define the Gift Campaign table. This table must be able to store data as follows:

2. Create the page (user interface) for handling the gift campaign data (a list page).
3. Handling the business logic for assigning gifts to a sales order is based on Customer Category and the active campaign for this category. This will be done in an external codeunit.
4. Add a new function to the Sales Order page interface in order to permit the sales operator to automatically insert a gift line when the sales order is finished.
5. When the sales operator inserts the Quantity in a sales order line, we want to check the active campaigns and alert the user if the ordered quantity is close to the threshold of an active promotion.

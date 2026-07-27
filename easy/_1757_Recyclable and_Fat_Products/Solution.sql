-- sql\leetcode-sql\tables\create_products1.sql

SELECT product_id
  FROM Products
 WHERE low_fats = 'Y'
   AND recyclable = 'Y';

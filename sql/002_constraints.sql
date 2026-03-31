-- orders -> customers

ALTER TABLE orders
ADD CONSTRAINT fk_orders_customer
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);

-- order_items -> orders

ALTER TABLE order_items
ADD CONSTRAINT fk_items_order
FOREIGN KEY (order_id)
REFERENCES orders(order_id);

-- order_items -> products

ALTER TABLE order_items
ADD CONSTRAINT fk_items_product
FOREIGN KEY (product_id)
REFERENCES products(product_id);

-- order_reviews -> orders

ALTER TABLE order_reviews
ADD CONSTRAINT fk_reviews_order
FOREIGN KEY (order_id)
REFERENCES orders(order_id);

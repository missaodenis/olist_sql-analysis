-- CRIANDO VIEW POR PEDIDOS

CREATE VIEW pedidos_base AS 
SELECT
    o.order_id,
    o.customer_id,
    c.customer_state,
    
    o.order_purchase_timestamp,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,

    (o.order_delivered_customer_date - o.order_purchase_timestamp) AS tempo_entrega,
    (o.order_delivered_customer_date - o.order_estimated_delivery_date) AS atraso,
    
    r.review_score,

    SUM(oi.price) AS total_pedido,
    SUM(oi.freight_value) AS frete_total

FROM orders o

JOIN customers c 
    ON o.customer_id = c.customer_id

LEFT JOIN order_items oi 
    ON o.order_id = oi.order_id

LEFT JOIN (
    SELECT 
        order_id,
        AVG(review_score) AS review_score
    FROM order_reviews
    GROUP BY order_id
) r 
    ON o.order_id = r.order_id

GROUP BY
    o.order_id,
    o.customer_id,
    c.customer_state,
    o.order_purchase_timestamp,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,
    r.review_score;

-- CRIANDO VIEW POR ITENS

CREATE VIEW itens_base AS
SELECT
    o.order_id,
    pr.product_id,
    pr.product_category_name,
    pr.product_weight_g,
    
    o.order_purchase_timestamp,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,

    (o.order_delivered_customer_date - o.order_purchase_timestamp) AS tempo_entrega,
    (o.order_delivered_customer_date - o.order_estimated_delivery_date) AS atraso,

    oi.price,
    oi.freight_value

FROM orders o

JOIN order_items oi 
    ON o.order_id = oi.order_id

JOIN products pr 
    ON pr.product_id = oi.product_id;

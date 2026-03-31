-- CRIANDO A TABELA CUSTOMERS

CREATE TABLE customers (
    customer_id TEXT PRIMARY KEY, -- id de cada cliente (chave primária)
    customer_unique_id TEXT,      -- id real do cliente (pode repetir)
    customer_zip_code_prefix INT, -- código do cep do cliente
    customer_city TEXT,           -- cidade do cliente 
    customer_state TEXT           -- estado (UF) do cliente 
);

-- CRIANDO A TABELA ORDERS

CREATE TABLE orders (
    order_id TEXT PRIMARY KEY,                 -- id de cada pedido
    customer_id TEXT,                          -- id do cliente (FK futura)
    order_status TEXT,                         -- status do pedido
    order_purchase_timestamp TIMESTAMP,        -- data da compra
    order_approved_at TIMESTAMP,               -- data da aprovação
    order_delivered_carrier_date TIMESTAMP,    -- envio para transportadora
    order_delivered_customer_date TIMESTAMP,   -- entrega ao cliente
    order_estimated_delivery_date TIMESTAMP    -- previsão de entrega
);
			
-- CRIANDO A TABELA ORDER_ITEMS

CREATE TABLE order_items (
    order_id TEXT,                      -- id do pedido
    order_item_id INT,                  -- posição do item no pedido
    product_id TEXT,                    -- id do produto
    seller_id TEXT,                     -- id do vendedor
    shipping_limit_date TIMESTAMP,      -- data limite de envio
    price DOUBLE PRECISION,             -- preço
    freight_value DOUBLE PRECISION,     -- frete
    
    PRIMARY KEY (order_id, order_item_id)
);

-- CRIANDO A TABELA PRODUCTS

CREATE TABLE products (
    product_id TEXT PRIMARY KEY,              -- id do produto
    product_category_name TEXT NULL,          -- categoria
    product_name_length INT,                  -- tamanho do nome (escrito de forma incorreta lenght)
    product_description_length INT,           -- tamanho da descrição
    product_photos_qty INT,                   -- quantidade de fotos
    product_weight_g DOUBLE PRECISION,        -- peso (gramas)
    product_length_cm DOUBLE PRECISION,       -- comprimento
    product_height_cm DOUBLE PRECISION,       -- altura
    product_width_cm DOUBLE PRECISION         -- largura
);

-- CRIANDO A TABELA ORDER_REVIEWS

CREATE TABLE order_reviews (
    review_row_id SERIAL PRIMARY KEY,   -- chave artificial
    review_id TEXT,                     -- id da avaliação
    order_id TEXT,                      -- id do pedido
    review_score INT,                   -- avaliação da compra
    review_comment_title TEXT,          -- título do comentário
    review_comment_message TEXT,        -- texto do comentário
    review_creation_date TIMESTAMP,     -- data da avaliação
    review_answer_timestamp TIMESTAMP   -- data da resposta
);
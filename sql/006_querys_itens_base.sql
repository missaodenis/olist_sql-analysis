------------------------------
-- RECEITA POR CATEGORIA
------------------------------

SELECT 
    product_category_name,
    SUM(price) AS receita
FROM itens_base
GROUP BY product_category_name
ORDER BY receita DESC;

------------------------------
-- PESO x TEMPO DE ENTREGA
------------------------------

SELECT 
    product_weight_g,
    AVG(tempo_entrega) AS tempo_medio
FROM itens_base
GROUP BY product_weight_g;

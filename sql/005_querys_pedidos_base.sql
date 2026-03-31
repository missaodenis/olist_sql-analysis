------------------------------
-- TICKET MÉDIO
------------------------------

SELECT AVG(total_pedido) FROM pedidos_base;

------------------------------
-- TICKET POR ESTADO
------------------------------

SELECT 
    customer_state,
    AVG(total_pedido)
FROM pedidos_base
GROUP BY customer_state;

------------------------------
-- ATRASO POR ESTADO
------------------------------

SELECT 
    customer_state,
    AVG(atraso)
FROM pedidos_base
GROUP BY customer_state;

--------------------------------
-- TEMPO DE ENTREGA x AVALIAÇÃO
--------------------------------

SELECT
    review_score,
    COUNT(*) AS total_pedidos,
    AVG(tempo_entrega) AS tempo_medio
FROM pedidos_base
GROUP BY review_score
ORDER BY total_pedidos;
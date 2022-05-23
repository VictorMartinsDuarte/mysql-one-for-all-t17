SELECT
  MIN(pl.plan_value) AS faturamento_minimo,
  MAX(pl.plan_value) AS faturamento_maximo,
  ROUND(AVG(pl.plan_value), 2) AS faturamento_medio,
  SUM(pl.plan_value) AS faturamento_total
FROM
  SpotifyClone.users AS us
JOIN plans AS pl ON pl.plan_id = us.plan_id;
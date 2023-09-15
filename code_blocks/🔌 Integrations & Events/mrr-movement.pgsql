-- MRR Movement

with
subscribes AS (
  SELECT
    date_trunc('day', start_time) AS date,
    SUM(
      CASE
        WHEN end_time IS NOT NULL AND is_trial_period = 'false' AND (is_trial_conversion = 'false' AND renewal_number = 1) OR is_trial_conversion = 'true' THEN
          CASE
            WHEN is_in_intro_offer_period = 'true' THEN
              CASE
                WHEN product_duration = 'P1Y' THEN (0.08333 * price_in_usd)::DECIMAL(18,2)
                WHEN product_duration = 'P6M' THEN (0.1666666 * price_in_usd)::DECIMAL(18,2)
                WHEN product_duration = 'P3M' THEN (0.333333 * price_in_usd)::DECIMAL(18,2)
                WHEN product_duration = 'P2M' THEN (0.5 * price_in_usd)::DECIMAL(18,2)
                WHEN product_duration = 'P1M' THEN (1 * price_in_usd)::DECIMAL(18,2)
                WHEN product_duration = 'P2W' THEN (2 * price_in_usd)::DECIMAL(18,2)
                WHEN product_duration = 'P1W' THEN (4 * price_in_usd)::DECIMAL(18,2)
                WHEN product_duration = 'P3D' THEN (10 * price_in_usd)::DECIMAL(18,2)
                WHEN product_duration = 'P1D' THEN (30 * price_in_usd)::DECIMAL(18,2)
                -- Fallback: Estimates duration when it is missing (undercounts MRR in all months except February)
                ELSE ((28 / (extract(epoch from end_time - start_time)::float / (24 * 3600))) * price_in_usd)::DECIMAL(18,2)
              END
            ELSE
              CASE
                WHEN product_duration = 'P1Y' THEN (0.08333 * price_in_usd)::DECIMAL(18,2)
                WHEN product_duration = 'P6M' THEN (0.1666666 * price_in_usd)::DECIMAL(18,2)
                WHEN product_duration = 'P3M' THEN (0.333333 * price_in_usd)::DECIMAL(18,2)
                WHEN product_duration = 'P2M' THEN (0.5 * price_in_usd)::DECIMAL(18,2)
                WHEN product_duration = 'P1M' THEN (1 * price_in_usd)::DECIMAL(18,2)
                WHEN product_duration = 'P2W' THEN (2 * price_in_usd)::DECIMAL(18,2)
                WHEN product_duration = 'P1W' THEN (4 * price_in_usd)::DECIMAL(18,2)
                WHEN product_duration = 'P3D' THEN (10 * price_in_usd)::DECIMAL(18,2)
                WHEN product_duration = 'P1D' THEN (30 * price_in_usd)::DECIMAL(18,2)
                ELSE ((28 / (extract(epoch from end_time - start_time)::float / (24 * 3600))) * price_in_usd)::DECIMAL(18,2)
              END
          END
        ELSE NULL
      END
    ) AS new_mrr,
    SUM(
      CASE
        WHEN end_time IS NOT NULL AND is_trial_period = 'false' AND is_trial_conversion = 'false' AND renewal_number > 1 THEN
          CASE
            WHEN is_in_intro_offer_period = 'true' THEN
              CASE
                WHEN product_duration = 'P1Y' THEN (0.08333 * price_in_usd)::DECIMAL(18,2)
                WHEN product_duration = 'P6M' THEN (0.1666666 * price_in_usd)::DECIMAL(18,2)
                WHEN product_duration = 'P3M' THEN (0.333333 * price_in_usd)::DECIMAL(18,2)
                WHEN product_duration = 'P2M' THEN (0.5 * price_in_usd)::DECIMAL(18,2)
                WHEN product_duration = 'P1M' THEN (1 * price_in_usd)::DECIMAL(18,2)
                WHEN product_duration = 'P2W' THEN (2 * price_in_usd)::DECIMAL(18,2)
                WHEN product_duration = 'P1W' THEN (4 * price_in_usd)::DECIMAL(18,2)
                WHEN product_duration = 'P3D' THEN (10 * price_in_usd)::DECIMAL(18,2)
                WHEN product_duration = 'P1D' THEN (30 * price_in_usd)::DECIMAL(18,2)
                ELSE ((28 / (extract(epoch from end_time - start_time)::float / (24 * 3600))) * price_in_usd)::DECIMAL(18,2)
              END
            ELSE
              CASE
                WHEN product_duration = 'P1Y' THEN (0.08333 * price_in_usd)::DECIMAL(18,2)
                WHEN product_duration = 'P6M' THEN (0.1666666 * price_in_usd)::DECIMAL(18,2)
                WHEN product_duration = 'P3M' THEN (0.333333 * price_in_usd)::DECIMAL(18,2)
                WHEN product_duration = 'P2M' THEN (0.5 * price_in_usd)::DECIMAL(18,2)
                WHEN product_duration = 'P1M' THEN (1 * price_in_usd)::DECIMAL(18,2)
                WHEN product_duration = 'P2W' THEN (2 * price_in_usd)::DECIMAL(18,2)
                WHEN product_duration = 'P1W' THEN (4 * price_in_usd)::DECIMAL(18,2)
                WHEN product_duration = 'P3D' THEN (10 * price_in_usd)::DECIMAL(18,2)
                WHEN product_duration = 'P1D' THEN (30 * price_in_usd)::DECIMAL(18,2)
                ELSE ((28 / (extract(epoch from end_time - start_time)::float / (24 * 3600))) * price_in_usd)::DECIMAL(18,2)
              END
          END
        ELSE NULL
      END
    ) AS renewal_mrr
  FROM <table_name>
  WHERE
    -- Set these dates as needed
    start_time BETWEEN '2023-07-10' AND CURRENT_DATE
    AND is_sandbox <> 'true'
    AND (end_time IS NOT NULL OR extract(epoch from end_time - start_time)::float > 0)
    AND (ownership_type IS NULL OR ownership_type != 'FAMILY_SHARED')
    AND store != 'promotional'
  GROUP BY 1
),
expirations AS (
  SELECT
    date_trunc('day', effective_end_time) AS date,
    SUM(
      CASE
        WHEN is_in_intro_offer_period = 'true' THEN
          CASE
            WHEN product_duration = 'P1Y' THEN (0.08333 * price_in_usd)::DECIMAL(18,2)
            WHEN product_duration = 'P6M' THEN (0.1666666 * price_in_usd)::DECIMAL(18,2)
            WHEN product_duration = 'P3M' THEN (0.333333 * price_in_usd)::DECIMAL(18,2)
            WHEN product_duration = 'P2M' THEN (0.5 * price_in_usd)::DECIMAL(18,2)
            WHEN product_duration = 'P1M' THEN (1 * price_in_usd)::DECIMAL(18,2)
            WHEN product_duration = 'P2W' THEN (2 * price_in_usd)::DECIMAL(18,2)
            WHEN product_duration = 'P1W' THEN (4 * price_in_usd)::DECIMAL(18,2)
            WHEN product_duration = 'P3D' THEN (10 * price_in_usd)::DECIMAL(18,2)
            WHEN product_duration = 'P1D' THEN (30 * price_in_usd)::DECIMAL(18,2)
            ELSE ((28 / (extract(epoch from end_time - start_time)::float / (24 * 3600))) * price_in_usd)::DECIMAL(18,2)
          END
        ELSE
          CASE
            WHEN product_duration = 'P1Y' THEN (0.08333 * price_in_usd)::DECIMAL(18,2)
            WHEN product_duration = 'P6M' THEN (0.1666666 * price_in_usd)::DECIMAL(18,2)
            WHEN product_duration = 'P3M' THEN (0.333333 * price_in_usd)::DECIMAL(18,2)
            WHEN product_duration = 'P2M' THEN (0.5 * price_in_usd)::DECIMAL(18,2)
            WHEN product_duration = 'P1M' THEN (1 * price_in_usd)::DECIMAL(18,2)
            WHEN product_duration = 'P2W' THEN (2 * price_in_usd)::DECIMAL(18,2)
            WHEN product_duration = 'P1W' THEN (4 * price_in_usd)::DECIMAL(18,2)
            WHEN product_duration = 'P3D' THEN (10 * price_in_usd)::DECIMAL(18,2)
            WHEN product_duration = 'P1D' THEN (30 * price_in_usd)::DECIMAL(18,2)
            ELSE ((28 / (extract(epoch from end_time - start_time)::float / (24 * 3600))) * price_in_usd)::DECIMAL(18,2)
          END
      END
    ) AS expired_mrr
  FROM <table_name>
  WHERE
    end_time IS NOT NULL
    -- Set these dates as needed
    AND effective_end_time BETWEEN '2023-07-10' AND CURRENT_DATE
    AND is_sandbox <> 'true'
    AND extract(epoch from end_time - start_time)::float > 0
    AND (ownership_type IS NULL OR ownership_type != 'FAMILY_SHARED')
    AND store != 'promotional'
  GROUP BY 1
),
joined AS (
  SELECT
    COALESCE(s.date, e.date) AS date,
    COALESCE(s.new_mrr, 0) AS new_mrr,
    COALESCE(s.renewal_mrr, 0) AS renewal_mrr,
    COALESCE(e.expired_mrr, 0) AS expired_mrr
  FROM subscribes s
  FULL JOIN expirations e ON
    s.date = e.date
)
SELECT
  date,
  new_mrr,
  renewal_mrr,
  expired_mrr,
  expired_mrr - renewal_mrr AS churned_mrr
FROM joined j;
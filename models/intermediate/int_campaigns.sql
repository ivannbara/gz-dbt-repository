SELECT * FROM {{ ref("stg_raw__adwords") }}
Union ALL
SELECT * FROM {{ ref("stg_raw__bing") }}
Union ALL
SELECT * FROM {{ ref("stg_raw__criteo") }}
Union ALL
SELECT * FROM {{ ref("stg_raw__facebook") }}

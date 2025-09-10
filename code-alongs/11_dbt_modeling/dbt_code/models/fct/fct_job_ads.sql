
WITH ja AS (SELECT * FROM {{ ref('src_job_ads') }}
),

jd AS (SELECT * FROM {{ ref('src_job_details') }}
),

e AS (SELECT * FROM {{ ref('sc_employer') }}
)


SELECT
    {{dbt_utils.generate_surrogate_key(['jd.id', 'jd.headline'])}} AS job_details_key,
    {{dbt_utils.generate_surrogate_key(['e.id', 'e.employer_name'])}} AS employer_key,
    ja.relevance,
    ja.vacancies,
    ja.application_deadline,
    -- for verifying that is relation works
    e.employer_name,
    jd."description"
FROM
    ja
LEFT JOIN 
    jd ON ja.id = jd.id
LEFT JOIN
    e ON ja.id = e.id
    

-- Integro Consulting AB details_key: b70fbb22da1fe5b70948809d213937c0


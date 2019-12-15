SELECT  sub.web_count/sub.total::DOUBLE PRECISION AS web_only,
        sub.mob_count/sub.total::DOUBLE PRECISION AS mobil_only,
        sub.web_and_mob_count/sub.total::DOUBLE PRECISION AS web_and_mobile

  FROM(SELECT
        COUNT(DISTINCT CASE WHEN web.user_id IS NOT NULL AND mob.user_id IS NULL
                  THEN web.user_id ELSE NULL END) AS web_count,
        COUNT(DISTINCT CASE WHEN web.user_id IS NULL AND mob.user_id IS NOT NULL
                  THEN mob.user_id ELSE NULL END) AS mob_count,
        COUNT(DISTINCT CASE WHEN web.user_id IS NOT NULL AND mob.user_id IS NOT NULL
                  THEN web.user_id ELSE NULL END) AS web_and_mob_count,
        COUNT(DISTINCT web.user_id) + COUNT(DISTINCT mob.user_id) -COUNT(DISTINCT CASE WHEN web.user_id IS NOT NULL AND mob.user_id IS NOT NULL
                  THEN web.user_id ELSE NULL END) AS total
        
        FROM  (SELECT distinct user_id FROM query_2_web ) web
              FULL OUTER JOIN
              (SELECT distinct user_id FROM data_2_mobile ) mob
          ON web.user_id = mob.user_id) sub
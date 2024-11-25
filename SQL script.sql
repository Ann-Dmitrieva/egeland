WITH hw as (
SELECT
    hd.user_id,
    l.course_id,
    CASE
        WHEN hd.mark IS NULL THEN 0
        ELSE 1                        
    END homework_done
FROM
    homework_done hd
    JOIN homework_lessons hl
        ON hd.homework_id = hl.homework_id
    JOIN lessons l
        ON l.id = hl.lesson_id
),
hwd AS (
SELECT
    hw.user_id,
    hw.course_id,
    SUM(hw.homework_done) total_homeworks_done   
FROM
    hw
GROUP BY
    hw.user_id, hw.course_id
)
SELECT
    c.id course_id, 
    c.name course_name,
    s.name subject_name,
    s.project subject_type,
    ct.name course_type,
    c.starts_at,
    u.id user_id,
    u.last_name,
    ci.name city,
    cu.active,
    cu.created_at course_access_at,
    FLOOR(cu.available_lessons / c.lessons_in_month) total_available_months,
    hwd.total_homeworks_done
FROM
    users u
    JOIN course_users cu
        ON u.id = cu.user_id AND u.user_role_id = 5 
    JOIN courses c
        ON c.id = cu.course_id
    JOIN course_types ct
        ON ct.id = c.course_type_id  AND ct.id IN (1, 6)  
    JOIN subjects s
        ON s.id = c.subject_id
    LEFT JOIN cities ci
        ON ci.id = u.city_id
    LEFT JOIN hwd
        ON hwd.user_id = u.id AND hwd.course_id = c.id
ORDER  BY
    u.id
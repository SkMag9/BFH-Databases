-- Aufgabe 2 
-- Sebastian Miszczuk, Miriam Streit
-- 2.1
SELECT i.name, s.semester, s.year, s.time_slot_id, COUNT() as anzahl FROM instructor AS i
LEFT JOIN teaches AS t
    ON t.ID = i.ID
LEFT JOIN section AS s
    ON (
        (t.course_id = s.course_id) AND
        (t.sec_id = s.sec_id) AND
        (t.semester = s.semester) AND
        (t.year = s.year)
    )
GROUP BY i.name, s.semester, s.year, s.time_slot_id
HAVING anzahl > 1;

-- 2.2
DROP TRIGGER IF EXISTS timeslot_check1;
CREATE TRIGGER timeslot_check1 BEFORE INSERT ON teaches
FOR EACH ROW
WHEN EXISTS (
    SELECT t.ID, t.year, t.semester, t.sec_id, t.course_id FROM teaches AS t
)
BEGIN
    SELECT raise(ROLLBACK,'wrong');
END;

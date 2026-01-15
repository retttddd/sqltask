--zamknac umowe
UPDATE salaries s
SET valid_to = CURRENT_DATE
WHERE valid_to IS NULL
  AND s.user_id IN (
    SELECT t.assigned_user_id
    FROM tasks t
    WHERE t.project_id = 1
  );

--usuwanie zadan 
UPDATE tasks 
SET status = 'done', project_id = NULL, assigned_user_id = NULL
WHERE project_id = 1;
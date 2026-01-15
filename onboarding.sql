WITH new_project AS (
  INSERT INTO projects(name, budget)
  VALUES ('TEST PROJECT', 9999)
  RETURNING id
),
new_users AS (
  SELECT u.id
  FROM users u
  ORDER BY u.id DESC
  LIMIT 3
)
  
INSERT INTO tasks(title, status, project_id, assigned_user_id)
SELECT 
    'BEGINNER TASKS', 
    'in_progress', 
    np.id, 
    nu.id
FROM new_project np
CROSS JOIN new_users nu;

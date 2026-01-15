-- Mamy tylko dane nowych pracownikow i ich stanowiska 

WITH new_users AS (
    INSERT INTO users (name, age, department_id, manager_id)
    VALUES 
        ('Nowy Pracownik 1', 30, 2, NULL),
        ('Nowy Pracownik 2', 30, 2, NULL),
        ('Nowy Pracownik 3', 30, 2, NULL),
    RETURNING id
)
INSERT INTO user_roles (user_id, role_id)
SELECT nu.id, r.id
FROM new_users nu
JOIN roles r ON r.name = 'Programista'
ON CONFLICT DO NOTHING;

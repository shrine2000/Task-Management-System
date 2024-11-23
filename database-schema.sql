-- USER TABLE
CREATE TABLE USER (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NUL UNIQUE,
    phone_number VARCHAR,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- TASK TABLE
CREATE TABLE TASK (
    task_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    due_date DATE NOT NULL,
    priority ENUM('low', 'medium', 'high') NOT NULL,
    assigned_user_id INT,
    remainder_time TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (assigned_user_id) REFERENCES USER(user_id)
);

-- TASK HISTORY
CREATE TABLE TASK_HISTORY(
    history_id SERIAL PRIMARY KEY,
    task_id INT NOT NULL,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    old_status ENUM('pending', 'in progress', 'completed', 'overdue'),
    new_status ENUM('pending', 'in progress', 'completed', 'overdue'),
    changed_by_user INT,
    FOREIGN KEY (task_id) REFERENCES TASK(task_id),
    FOREIGN KEY (changed_by_user_id) REFERENCES USER(user_id)
)
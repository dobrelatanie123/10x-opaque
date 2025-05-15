# Final Database Schema

## 1. Tables

### users
- **id**: SERIAL PRIMARY KEY
- **email**: VARCHAR(255) NOT NULL UNIQUE
- **password**: VARCHAR(255) NOT NULL
- **created_at**: TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP

### reports
- **id**: SERIAL PRIMARY KEY
- **user_id**: INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE
- **title**: VARCHAR(255) NOT NULL
- **content**: TEXT NOT NULL
- **created_at**: TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
- **status**: VARCHAR(50) NOT NULL
- **dynamic_data**: JSONB

### activity_logs
- **id**: SERIAL PRIMARY KEY
- **user_id**: INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE
- **action**: VARCHAR(100) NOT NULL
- **timestamp**: TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
- **details**: TEXT

## 2. Relationships

- **users** to **reports**: One-to-Many (deleting a user cascades deletion of their reports).
- **users** to **activity_logs**: One-to-Many (each log is linked to a user).

## 3. Indexes

- Unique index on `users.email`.
- Index on `reports.user_id`.
- Index on `activity_logs.user_id`.

## 4. Row-Level Security (RLS)

- Enable RLS on the `reports` table to restrict report access to their respective owners.
  ```sql
  ALTER TABLE reports ENABLE ROW LEVEL SECURITY;
  CREATE POLICY user_reports_policy ON reports
    USING (user_id = current_setting('my.current_user_id')::integer);
  ```

## 5. Additional Notes

- All timestamps default to the current time.
- The schema is normalized (3NF) to minimize redundancy and is designed for scalability. 
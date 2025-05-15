-- Migration: Create database schema based on db-plan.md
-- Description: Creates users, reports, and activity_logs tables with appropriate relations and RLS

-- IMPORTANT: In Supabase, auth.users already exists with UUID as id type
-- We don't need to create users table as it's managed by Supabase Auth

-- reports table with jsonb field for dynamic data
create table if not exists public.reports (
  id serial primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  title varchar(255) not null,
  content text not null,
  created_at timestamp not null default current_timestamp,
  status varchar(50) not null,
  dynamic_data jsonb
);

-- activity logs for user actions
create table if not exists public.activity_logs (
  id serial primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  action varchar(100) not null,
  timestamp timestamp not null default current_timestamp,
  details text
);

-- create indexes for performance
create index if not exists reports_user_id_idx on public.reports(user_id);
create index if not exists activity_logs_user_id_idx on public.activity_logs(user_id);

-- enable row level security on all tables
alter table public.reports enable row level security;
alter table public.activity_logs enable row level security;

-- create rls policies for reports table
-- select policy for authenticated users (can only see their own reports)
create policy "Users can view their own reports"
  on public.reports for select
  using (auth.uid() = user_id);

-- insert policy for authenticated users
create policy "Users can create their own reports"
  on public.reports for insert
  with check (auth.uid() = user_id);

-- update policy for authenticated users
create policy "Users can update their own reports"
  on public.reports for update
  using (auth.uid() = user_id);

-- delete policy for authenticated users
create policy "Users can delete their own reports"
  on public.reports for delete
  using (auth.uid() = user_id);

-- create rls policies for activity_logs table
-- select policy for authenticated users
create policy "Users can view their own activity logs"
  on public.activity_logs for select
  using (auth.uid() = user_id);

-- insert policy for authenticated users
create policy "Users can create activity logs"
  on public.activity_logs for insert
  with check (auth.uid() = user_id);

-- create function to set current user id for row level security
create or replace function set_current_user_id()
returns void as $$
begin
  perform set_config('my.current_user_id', auth.uid()::text, false);
end;
$$ language plpgsql security definer; 
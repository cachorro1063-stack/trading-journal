-- Tabla de Pendientes / Recordatorios para el Trading Journal.
-- Ejecutar en el SQL Editor de Supabase (Project > SQL Editor > New query).

create table if not exists public.pendientes (
  id           uuid primary key default gen_random_uuid(),
  user_id      uuid not null references auth.users(id) on delete cascade,
  titulo       text not null,
  descripcion  text,
  fecha        date not null,
  hora         text,
  prioridad    text not null default 'media' check (prioridad in ('alta','media','baja')),
  completado   boolean not null default false,
  created_at   timestamptz not null default now()
);

create index if not exists pendientes_user_fecha_idx on public.pendientes (user_id, fecha);

alter table public.pendientes enable row level security;

create policy "pendientes_select_own" on public.pendientes
  for select using (auth.uid() = user_id);

create policy "pendientes_insert_own" on public.pendientes
  for insert with check (auth.uid() = user_id);

create policy "pendientes_update_own" on public.pendientes
  for update using (auth.uid() = user_id);

create policy "pendientes_delete_own" on public.pendientes
  for delete using (auth.uid() = user_id);

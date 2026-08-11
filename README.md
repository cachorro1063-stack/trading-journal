# Trading Journal Pro

Dashboard de trading con autenticación por usuario, multi-backtest, calculadora de contratos y calendario de pendientes/recordatorios.

## Deploy en Vercel

1. Sube esta carpeta a GitHub (New Repository)
2. En Vercel: New Project → importa el repo
3. Click Deploy

## Configurar la tabla de Pendientes (Supabase)

La sección "Pendientes" (calendario y recordatorios) necesita una tabla nueva en Supabase:

1. Entra a tu proyecto en Supabase → SQL Editor → New query
2. Pega y ejecuta el contenido de [`supabase_pendientes.sql`](./supabase_pendientes.sql)

Eso crea la tabla `pendientes` con Row Level Security, para que cada usuario solo vea sus propios pendientes.

## Stack
- Frontend: HTML + CSS + JavaScript vanilla
- Auth + DB: Supabase
- Hosting: Vercel

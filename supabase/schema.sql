-- Ejecutar completo en Supabase → SQL Editor → New query → Run
-- (si ya corriste una versión anterior de este archivo, borra la tabla primero:
--  drop table if exists projects;)

create extension if not exists "pgcrypto";

create table if not exists projects (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  category text not null,
  cell_ref text not null default '',
  problem text not null,
  result text not null,
  tags text[] not null default '{}',
  image_url text,
  featured boolean not null default false,
  sort_order int not null default 0,
  created_at timestamptz not null default now()
);

alter table projects enable row level security;

create policy "public_read_projects" on projects for select using (true);
create policy "auth_insert_projects" on projects for insert with check (auth.uid() is not null);
create policy "auth_update_projects" on projects for update using (auth.uid() is not null);
create policy "auth_delete_projects" on projects for delete using (auth.uid() is not null);

insert into projects (title, category, cell_ref, problem, result, tags, image_url, featured, sort_order) values
(
  'Motor de configuración textil',
  'Motor de producto',
  'B4',
  'Cálculo manual de consumos y costos de mano de obra por prenda, propenso a error.',
  'Motor con LAMBDA + LET + BUSCARX: cálculo instantáneo del costo por prenda para una empresa fabricante de ropa deportiva.',
  array['Excel Avanzado','LAMBDA','VBA'],
  null,
  true,
  1
),
(
  'Análisis de Stock',
  'Inventario',
  'C7',
  'Seguimiento disperso de la rotación y cobertura de stock por producto.',
  'Dashboard con KPIs de giro y cobertura de stock, tendencia mensual de ventas vs. costo, y ranking de productos por margen.',
  array['Power Query','Tablas Dinámicas','Dashboards'],
  'assets/img/stock.jpeg',
  false,
  2
),
(
  'Ventas por Sucursal',
  'Ventas',
  'D3',
  'Comparar desempeño de venta entre sucursales y medios de pago a lo largo de 4 años.',
  'Dashboard interactivo con slicers por sucursal, año y trimestre, participación por medio de pago, y ranking de meses de mayor/menor venta.',
  array['Tablas Dinámicas','Dashboards','Segmentación de datos'],
  'assets/img/sucursales.jpeg',
  false,
  3
),
(
  'Ventas por País',
  'Finanzas',
  'D9',
  'Consolidar ventas de múltiples países en un solo panel comparativo, 2009–2012.',
  'Dashboard con KPIs financieros (ventas, utilidad, margen, costo de envío), mapa interactivo de Sudamérica y variación % año a año por país.',
  array['Power Query','Mapas','Dashboards'],
  'assets/img/pais.jpeg',
  false,
  4
),
(
  'Atención al Cliente',
  'Operaciones',
  'E2',
  'Monitorear volumen y tipo de casos de atención al cliente por canal y por mes.',
  'Dashboard con radar de estacionalidad mensual, gauges de atención y ranking de motivos de contacto (devoluciones, soporte técnico).',
  array['Dashboards','Power Query'],
  'assets/img/atencion-cliente.jpeg',
  false,
  5
),
(
  'Limpieza de Datos de Evento',
  'Automatización de datos',
  'E6',
  'Base de datos cruda de participantes de un evento (pagos, hospedaje, comidas) sin estructura.',
  'Sistema limpio con filtros, subtotales automáticos, formato condicional y tarjetas KPI de participantes, ingresos y gastos — todo formulado.',
  array['VBA','Formato Condicional','Tablas Dinámicas'],
  'assets/img/limpieza-evento.png',
  false,
  6
);

# Base de datos

Esta carpeta contiene la documentación y los archivos relacionados con el diseño de la base de datos de Mental Connection.

## Segunda entrega

Para la segunda entrega se incluye el esquema inicial de base de datos relacional utilizando PostgreSQL mediante Supabase.

El archivo principal es:

- [schema.sql](schema.sql)

## Descripción

El esquema inicial contempla las tablas necesarias para gestionar:

- Usuarios y roles.
- Pacientes.
- Profesionales.
- Especialidades.
- Disponibilidad horaria.
- Turnos.
- Pagos o señas mediante Mercado Pago.
- Registros clínicos o historia clínica básica.
- Auditoría de acciones relevantes.

## Motor de base de datos

El proyecto utilizará PostgreSQL mediante Supabase.

## Seguridad

Debido a que el sistema manejará datos personales y registros clínicos, se contemplará el uso de autenticación, control de roles, Row Level Security y auditoría de acciones relevantes.

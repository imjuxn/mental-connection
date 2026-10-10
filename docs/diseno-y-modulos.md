# Segunda Entrega: Diseño y Módulos

## 1. Introducción

En esta segunda entrega se presenta el diseño técnico inicial del sistema Mental Connection. El objetivo es definir el esquema de base de datos relacional y los módulos principales que serán desarrollados durante el proyecto.

Mental Connection utilizará una base de datos PostgreSQL mediante Supabase. El sistema estará compuesto por módulos relacionados con usuarios, pacientes, profesionales, turnos, pagos, disponibilidad horaria, registros clínicos y auditoría.

---

## 2. Arquitectura general del sistema

El sistema se desarrollará como una aplicación web utilizando React.js con TypeScript para el frontend y Supabase como Backend as a Service.

Supabase será utilizado para la autenticación de usuarios, base de datos PostgreSQL, políticas de seguridad, almacenamiento de datos y funciones serverless en caso de ser necesarias.

La arquitectura general estará compuesta por:

- Frontend web desarrollado con React.js y TypeScript.
- Supabase Auth para autenticación y gestión de usuarios.
- PostgreSQL mediante Supabase como base de datos relacional.
- Supabase Row Level Security para control de acceso a datos.
- Supabase Edge Functions para lógica del lado del servidor.
- Mercado Pago API para pagos o señas de turnos.

---

## 3. Modelo de base de datos

El sistema utilizará una base de datos relacional PostgreSQL mediante Supabase. Se eligió un modelo relacional porque permite representar de forma clara las relaciones entre usuarios, pacientes, profesionales, especialidades, turnos, pagos y registros clínicos.

Las tablas principales del sistema serán:

| Tabla | Nombre en español | Descripción |
|---|---|---|
| `profiles` | Perfiles | Almacena los datos generales de los usuarios registrados y su rol dentro del sistema. |
| `patients` | Pacientes | Almacena la información específica de los usuarios que cumplen el rol de paciente. |
| `professionals` | Profesionales | Almacena la información específica de los profesionales de salud mental. |
| `specialties` | Especialidades | Contiene las especialidades disponibles, como psicología, psiquiatría, psicopedagogía o fonoaudiología. |
| `professional_specialties` | Profesionales y especialidades | Relaciona profesionales con una o más especialidades. |
| `availability_blocks` | Bloques de disponibilidad | Registra los días y horarios disponibles de cada profesional. |
| `appointments` | Turnos | Almacena las reservas de turnos entre pacientes y profesionales. |
| `payments` | Pagos | Registra los pagos o señas asociados a los turnos mediante Mercado Pago. |
| `clinical_records` | Registros clínicos | Almacena el registro de atenciones o historia clínica básica asociada a cada paciente. |
| `audit_logs` | Auditorías | Registra acciones relevantes realizadas en el sistema, especialmente sobre datos sensibles. |

---

## 4. Diagrama entidad-relación

```mermaid
erDiagram
    profiles ||--o| patients : "puede_ser"
    profiles ||--o| professionals : "puede_ser"

    professionals ||--o{ professional_specialties : "tiene"
    specialties ||--o{ professional_specialties : "pertenece_a"

    professionals ||--o{ availability_blocks : "define"
    professionals ||--o{ appointments : "atiende"
    patients ||--o{ appointments : "solicita"

    appointments ||--o| payments : "puede_tener"
    patients ||--o{ clinical_records : "posee"
    professionals ||--o{ clinical_records : "registra"

    profiles ||--o{ audit_logs : "genera"

    profiles {
        uuid id PK
        string full_name
        string email
        string role
        timestamp created_at
    }

    patients {
        uuid id PK
        uuid profile_id FK
        string phone
        date birth_date
        string notes
    }

    professionals {
        uuid id PK
        uuid profile_id FK
        string license_number
        string modality
        string bio
    }

    specialties {
        uuid id PK
        string name
        string description
    }

    professional_specialties {
        uuid professional_id FK
        uuid specialty_id FK
    }

    availability_blocks {
        uuid id PK
        uuid professional_id FK
        int weekday
        time start_time
        time end_time
    }

    appointments {
        uuid id PK
        uuid patient_id FK
        uuid professional_id FK
        timestamp start_at
        timestamp end_at
        string status
        string reason
    }

    payments {
        uuid id PK
        uuid appointment_id FK
        string provider
        string provider_payment_id
        numeric amount
        string status
    }

    clinical_records {
        uuid id PK
        uuid patient_id FK
        uuid professional_id FK
        uuid appointment_id FK
        date record_date
        string summary
        string evolution
        string observations
    }

    audit_logs {
        uuid id PK
        uuid user_id FK
        string action
        string table_name
        uuid record_id
        timestamp created_at
    }

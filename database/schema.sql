-- Mental Connection
-- Esquema inicial de base de datos
-- PostgreSQL / Supabase

CREATE TABLE profiles (
  id UUID PRIMARY KEY,
  full_name VARCHAR(120) NOT NULL,
  email VARCHAR(160) NOT NULL UNIQUE,
  role VARCHAR(30) NOT NULL CHECK (role IN ('patient', 'professional', 'admin')),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE patients (
  id UUID PRIMARY KEY,
  profile_id UUID NOT NULL REFERENCES profiles(id),
  phone VARCHAR(50),
  birth_date DATE,
  notes TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE professionals (
  id UUID PRIMARY KEY,
  profile_id UUID NOT NULL REFERENCES profiles(id),
  license_number VARCHAR(80),
  modality VARCHAR(30) CHECK (modality IN ('in_person', 'online', 'mixed')),
  bio TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE specialties (
  id UUID PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  description TEXT
);

CREATE TABLE professional_specialties (
  professional_id UUID NOT NULL REFERENCES professionals(id),
  specialty_id UUID NOT NULL REFERENCES specialties(id),
  PRIMARY KEY (professional_id, specialty_id)
);

CREATE TABLE availability_blocks (
  id UUID PRIMARY KEY,
  professional_id UUID NOT NULL REFERENCES professionals(id),
  weekday INTEGER NOT NULL CHECK (weekday BETWEEN 1 AND 7),
  start_time TIME NOT NULL,
  end_time TIME NOT NULL,
  is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE appointments (
  id UUID PRIMARY KEY,
  patient_id UUID NOT NULL REFERENCES patients(id),
  professional_id UUID NOT NULL REFERENCES professionals(id),
  start_at TIMESTAMP NOT NULL,
  end_at TIMESTAMP NOT NULL,
  status VARCHAR(30) NOT NULL CHECK (status IN ('pending', 'confirmed', 'cancelled', 'completed')),
  reason TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE payments (
  id UUID PRIMARY KEY,
  appointment_id UUID NOT NULL REFERENCES appointments(id),
  provider VARCHAR(50) NOT NULL DEFAULT 'mercado_pago',
  provider_payment_id VARCHAR(120),
  amount NUMERIC(10, 2) NOT NULL,
  status VARCHAR(30) NOT NULL CHECK (status IN ('pending', 'approved', 'rejected', 'cancelled', 'refunded')),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE clinical_records (
  id UUID PRIMARY KEY,
  patient_id UUID NOT NULL REFERENCES patients(id),
  professional_id UUID NOT NULL REFERENCES professionals(id),
  appointment_id UUID REFERENCES appointments(id),
  record_date DATE NOT NULL,
  summary TEXT,
  evolution TEXT,
  observations TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE audit_logs (
  id UUID PRIMARY KEY,
  user_id UUID REFERENCES profiles(id),
  action VARCHAR(100) NOT NULL,
  table_name VARCHAR(100) NOT NULL,
  record_id UUID,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

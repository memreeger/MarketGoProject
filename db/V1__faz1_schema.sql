-- ============================================
-- MarketGo - Faz 1 Şeması
-- Persons hiyerarşisi (Customer/Courier/Admin)
-- ============================================

DROP TABLE IF EXISTS addresses CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS couriers CASCADE;
DROP TABLE IF EXISTS admins CASCADE;
DROP TABLE IF EXISTS persons CASCADE;

CREATE TABLE persons (
    id              BIGSERIAL PRIMARY KEY,
    first_name      VARCHAR(50)  NOT NULL,
    last_name       VARCHAR(50)  NOT NULL,
    email           VARCHAR(100) NOT NULL UNIQUE,
    phone           VARCHAR(20)  NOT NULL,
    password_hash   VARCHAR(255) NOT NULL,
    person_type     VARCHAR(20)  NOT NULL,
    is_active       BOOLEAN      NOT NULL DEFAULT TRUE,
    created_at      TIMESTAMP    NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMP    NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_persons_email ON persons(email);
CREATE INDEX idx_persons_type ON persons(person_type);

CREATE TABLE customers (
    person_id       BIGINT PRIMARY KEY REFERENCES persons(id) ON DELETE CASCADE,
    birth_date      DATE,
    customer_type   VARCHAR(20)  NOT NULL DEFAULT 'REGULAR'
);

CREATE TABLE couriers (
    person_id       BIGINT PRIMARY KEY REFERENCES persons(id) ON DELETE CASCADE,
    vehicle_plate   VARCHAR(20),
    courier_status  VARCHAR(20)  NOT NULL DEFAULT 'OFFLINE'
);

CREATE TABLE admins (
    person_id       BIGINT PRIMARY KEY REFERENCES persons(id) ON DELETE CASCADE,
    admin_role      VARCHAR(20)  NOT NULL DEFAULT 'ADMIN'
);

CREATE TABLE addresses (
    id              BIGSERIAL PRIMARY KEY,
    customer_id     BIGINT       NOT NULL REFERENCES customers(person_id) ON DELETE CASCADE,
    title           VARCHAR(50)  NOT NULL,
    full_address    TEXT         NOT NULL,
    city            VARCHAR(50)  NOT NULL,
    district        VARCHAR(50)  NOT NULL,
    is_default      BOOLEAN      NOT NULL DEFAULT FALSE,
    created_at      TIMESTAMP    NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_addresses_customer ON addresses(customer_id);

-- Test: seed admin
INSERT INTO persons (first_name, last_name, email, phone, password_hash, person_type)
VALUES ('System', 'Admin', 'admin@marketgo.com', '+905001112233',
        '8c6976e5b5410415bde908bdf4f4f0d1aaab7e0e4f31bb8ef8df8e9b1e8c8f76',
        'ADMIN');

INSERT INTO admins (person_id, admin_role)
VALUES (currval('persons_id_seq'), 'SUPER_ADMIN');

SELECT p.id, p.first_name, p.email, p.person_type, a.admin_role
FROM persons p
JOIN admins a ON p.id = a.person_id;

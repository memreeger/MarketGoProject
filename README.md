# MarketGo Projesi

Multi-Vendor Sipariş & Teslimat Platformu — Vanilla Java + JDBC + PostgreSQL

## Kurulum Adımları

### 1. Gereksinimler
- JDK 21
- IntelliJ IDEA Community Edition
- PostgreSQL 16 (Docker veya native)
- DBeaver (opsiyonel, DB yönetimi için)

### 2. Veritabanı Kurulumu

**Docker ile:**
\\\
docker run --name marketgo-db -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=marketgo -p 5432:5432 -d postgres:16
\\\

Veya native kurulum sonrası \marketgo\ veritabanı oluştur.

### 3. Şemayı Yükle

DBeaver'dan veya psql'den \db/V1__faz1_schema.sql\ dosyasını çalıştır.

### 4. JAR Dosyalarını Ekle

\lib/\ klasörüne şu JAR'ları indir:
- PostgreSQL JDBC driver: https://jdbc.postgresql.org/download/
- Lombok: https://projectlombok.org/download

### 5. IntelliJ Ayarları

- **File → Project Structure → Libraries** → + Java → \lib/\ klasörünü seç
- \esources/\ klasörü için sağ tık → **Mark Directory as → Resources Root**
- Lombok plugin'i kur (Settings → Plugins)
- Annotation Processing'i aç (Settings → Build → Compiler → Annotation Processors)

### 6. Çalıştır

\Main.java\'yı çalıştır (yeşil ok butonu).

## Paket Yapısı

\\\
src/tr/com/melih/marketgo/system/
├── abst/         - Generic interfaces (Readable, Writable, Crud)
├── bll/          - Business Logic (Manager sınıfları)
├── dao/          - Data Access (JDBC operasyonları)
├── dto/          - Data Transfer Objects (records)
├── enums/        - Enum tipleri
├── exception/    - Custom exception hierarchy (Faz 3)
├── model/        - Domain entity'leri
├── presentation/ - Konsol menüleri
└── util/         - Yardımcı sınıflar
\\\

## Faz 1 İlerlemesi

Aşağıdaki sınıflardaki TODO'ları sırasıyla doldur:

1. enums/ — zaten dolu
2. util/DaoConnection.java
3. util/PasswordHasher.java
4. util/ConsoleHelper.java
5. util/Validation.java
6. model/BaseEntity.java
7. model/Person.java
8. model/Customer.java, Courier.java, Admin.java, Address.java
9. abst/ — zaten dolu
10. dto/request/CustomerRequestDto.java
11. dto/response/CustomerResponseDto.java
12. dao/CustomerDao.java
13. bll/CustomerManager.java
14. presentation/customer/CustomerMenu.java
15. presentation/MainMenu.java

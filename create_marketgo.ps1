# ============================================================
# MarketGo - Proje İskelet Oluşturucu (PowerShell)
# ============================================================
# Kullanım:
#   1. Bu dosyayı projeyi oluşturmak istediğin dizine kopyala
#   2. PowerShell aç, o dizine git
#   3. .\create_marketgo.ps1 komutuyla çalıştır
#
# Not: Eğer "execution policy" hatası alırsan, önce şunu çalıştır:
#   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
# ============================================================

$ErrorActionPreference = "Stop"

# Renkli yazdırma fonksiyonu
function Write-Section($text) {
    Write-Host ""
    Write-Host "==> $text" -ForegroundColor Cyan
}

function Write-Created($text) {
    Write-Host "    [+] $text" -ForegroundColor Green
}

function Write-Info($text) {
    Write-Host "    $text" -ForegroundColor Gray
}

# ============================================================
# Konfigürasyon
# ============================================================
$ProjectName = "MarketGo"
$BasePackage = "tr\com\melih\marketgo\system"
$BasePackageDot = "tr.com.melih.marketgo.system"
$SrcRoot = "src\$BasePackage"

$createdDirs = 0
$createdFiles = 0

# ============================================================
# 1. ANA KLASÖR YAPISI
# ============================================================
Write-Section "Klasör yapısı oluşturuluyor"

$folders = @(
    "lib",
    "resources",
    "db",
    "$SrcRoot",
    "$SrcRoot\abst",
    "$SrcRoot\bll",
    "$SrcRoot\dao",
    "$SrcRoot\dto",
    "$SrcRoot\dto\request",
    "$SrcRoot\dto\response",
    "$SrcRoot\enums",
    "$SrcRoot\exception",
    "$SrcRoot\model",
    "$SrcRoot\presentation",
    "$SrcRoot\presentation\customer",
    "$SrcRoot\presentation\courier",
    "$SrcRoot\presentation\vendor",
    "$SrcRoot\presentation\admin",
    "$SrcRoot\util"
)

foreach ($folder in $folders) {
    if (-not (Test-Path $folder)) {
        New-Item -ItemType Directory -Path $folder -Force | Out-Null
        Write-Created $folder
        $createdDirs++
    } else {
        Write-Info "(var) $folder"
    }
}

# ============================================================
# 2. JAVA DOSYA OLUŞTURUCU FONKSIYON
# ============================================================
function New-JavaFile {
    param(
        [string]$Path,
        [string]$Content
    )

    if (Test-Path $Path) {
        Write-Info "(var) $Path"
        return
    }

    Set-Content -Path $Path -Value $Content -Encoding UTF8
    Write-Created $Path
    $script:createdFiles++
}

# ============================================================
# 3. ENUMS PAKETI
# ============================================================
Write-Section "enums/ paketi"

New-JavaFile "$SrcRoot\enums\PersonType.java" @"
package $BasePackageDot.enums;

public enum PersonType {
    CUSTOMER,
    COURIER,
    ADMIN
}
"@

New-JavaFile "$SrcRoot\enums\CustomerType.java" @"
package $BasePackageDot.enums;

public enum CustomerType {
    REGULAR,
    PREMIUM,
    VIP
}
"@

New-JavaFile "$SrcRoot\enums\CourierStatus.java" @"
package $BasePackageDot.enums;

public enum CourierStatus {
    AVAILABLE,
    BUSY,
    OFFLINE
}
"@

New-JavaFile "$SrcRoot\enums\AdminRole.java" @"
package $BasePackageDot.enums;

public enum AdminRole {
    ADMIN,
    SUPER_ADMIN
}
"@

# ============================================================
# 4. ABST PAKETI (Generic interfaces)
# ============================================================
Write-Section "abst/ paketi (Generic interfaces)"

New-JavaFile "$SrcRoot\abst\Readable.java" @"
package $BasePackageDot.abst;

import java.util.List;
import java.util.Optional;

/**
 * Sadece okuma operasyonları.
 * Interface Segregation Principle (ISP) örneği.
 */
public interface Readable<T, ID> {

    // TODO: getById metodunu tanımla — Optional<T> dönmeli
    Optional<T> getById(ID id);

    // TODO: getAll metodunu tanımla — List<T> dönmeli
    List<T> getAll();
}
"@

New-JavaFile "$SrcRoot\abst\Writable.java" @"
package $BasePackageDot.abst;

/**
 * Sadece yazma operasyonları.
 */
public interface Writable<T, ID> {

    // TODO: create metodunu tanımla
    T create(T obj);

    // TODO: update metodunu tanımla
    T update(T obj, ID id);

    // TODO: delete metodunu tanımla
    void delete(ID id);
}
"@

New-JavaFile "$SrcRoot\abst\Crud.java" @"
package $BasePackageDot.abst;

/**
 * Hem okuma hem yazma. Çoğu DAO bunu implement eder.
 */
public interface Crud<T, ID> extends Readable<T, ID>, Writable<T, ID> {
}
"@

# ============================================================
# 5. MODEL PAKETI
# ============================================================
Write-Section "model/ paketi (Domain entities)"

New-JavaFile "$SrcRoot\model\BaseEntity.java" @"
package $BasePackageDot.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

/**
 * Tüm domain entity'lerinin atası.
 * Ortak alanlar: id, createdAt, updatedAt, isActive.
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public abstract class BaseEntity {

    // TODO: id alanını tanımla (Long)
    // TODO: createdAt alanını tanımla (LocalDateTime)
    // TODO: updatedAt alanını tanımla (LocalDateTime)
    // TODO: isActive alanını tanımla (boolean, default true)

}
"@

New-JavaFile "$SrcRoot\model\Person.java" @"
package $BasePackageDot.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import $BasePackageDot.enums.PersonType;

/**
 * Person hiyerarşisinin soyut atası.
 * Customer, Courier, Admin bu sınıftan extends eder.
 */
@Getter
@Setter
@NoArgsConstructor
public abstract class Person extends BaseEntity {

    // TODO: firstName, lastName, email, phone alanlarını tanımla
    // TODO: passwordHash alanını tanımla
    // TODO: personType alanını tanımla (PersonType enum)

    /**
     * Polimorfik metot — her subclass kendi panel adını döner.
     */
    // TODO: getDashboardTitle() abstract metodunu tanımla

    /**
     * Tam ad (utility).
     */
    // TODO: getFullName() metodunu yaz
}
"@

New-JavaFile "$SrcRoot\model\Customer.java" @"
package $BasePackageDot.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import $BasePackageDot.enums.CustomerType;
import $BasePackageDot.enums.PersonType;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class Customer extends Person {

    // TODO: birthDate alanı (LocalDate)
    // TODO: customerType alanı (CustomerType, default REGULAR)
    // TODO: addresses listesi (List<Address>, ArrayList ile başlat)

    public Customer() {
        super();
        // TODO: personType'ı CUSTOMER olarak ayarla
    }

    @Override
    public String getDashboardTitle() {
        // TODO: "Müşteri Paneli" dön
        return null;
    }
}
"@

New-JavaFile "$SrcRoot\model\Courier.java" @"
package $BasePackageDot.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import $BasePackageDot.enums.CourierStatus;
import $BasePackageDot.enums.PersonType;

@Getter
@Setter
public class Courier extends Person {

    // TODO: vehiclePlate alanı (String)
    // TODO: courierStatus alanı (CourierStatus, default OFFLINE)

    public Courier() {
        super();
        // TODO: personType'ı COURIER olarak ayarla
    }

    @Override
    public String getDashboardTitle() {
        // TODO: "Kurye Paneli" dön
        return null;
    }
}
"@

New-JavaFile "$SrcRoot\model\Admin.java" @"
package $BasePackageDot.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import $BasePackageDot.enums.AdminRole;
import $BasePackageDot.enums.PersonType;

@Getter
@Setter
public class Admin extends Person {

    // TODO: adminRole alanı (AdminRole, default ADMIN)

    public Admin() {
        super();
        // TODO: personType'ı ADMIN olarak ayarla
    }

    @Override
    public String getDashboardTitle() {
        // TODO: "Yönetici Paneli" dön
        return null;
    }
}
"@

New-JavaFile "$SrcRoot\model\Address.java" @"
package $BasePackageDot.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Address extends BaseEntity {

    // TODO: customerId (Long) — adresin sahibi olan müşterinin ID'si
    // TODO: title (String) — örn: "Ev", "İş"
    // TODO: fullAddress (String) — tam adres metni
    // TODO: city (String)
    // TODO: district (String)
    // TODO: isDefault (boolean) — varsayılan adres mi
}
"@

# ============================================================
# 6. DTO PAKETI
# ============================================================
Write-Section "dto/ paketi (Request/Response DTOs)"

New-JavaFile "$SrcRoot\dto\request\CustomerRequestDto.java" @"
package $BasePackageDot.dto.request;

import java.time.LocalDate;

/**
 * Müşteri kayıt isteği. Record olarak immutable.
 * NOT: password plain — Manager katmanında hash'lenecek.
 */
public record CustomerRequestDto(
        // TODO: firstName, lastName, email, phone, password, birthDate alanlarını ekle
) {
}
"@

New-JavaFile "$SrcRoot\dto\response\CustomerResponseDto.java" @"
package $BasePackageDot.dto.response;

import $BasePackageDot.enums.CustomerType;

import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * Sisteme dönen müşteri bilgisi.
 * DİKKAT: passwordHash YOK — güvenlik için asla dışarı çıkmaz.
 */
public record CustomerResponseDto(
        // TODO: id, firstName, lastName, email, phone, customerType, birthDate, createdAt ekle
        // NOT: password VEYA passwordHash KESINLIKLE YOK!
) {
}
"@

# ============================================================
# 7. EXCEPTION PAKETI (Faz 3'te dolacak, şimdi boş)
# ============================================================
Write-Section "exception/ paketi (Faz 3'te dolacak)"

New-JavaFile "$SrcRoot\exception\.gitkeep" "# Faz 3'te custom exception hierarchy buraya gelecek"

# ============================================================
# 8. UTIL PAKETI
# ============================================================
Write-Section "util/ paketi"

New-JavaFile "$SrcRoot\util\DaoConnection.java" @"
package $BasePackageDot.util;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 * Singleton pattern ile thread-safe PostgreSQL bağlantısı.
 * application.properties dosyasından credentials okur.
 *
 * NOT: Eğitim amaçlı tek connection. Gerçek hayatta connection pool kullanılır.
 */
public final class DaoConnection {

    // TODO: static volatile Connection instance alanını tanımla
    // TODO: static final Object LOCK alanını tanımla

    // TODO: private constructor yaz (UnsupportedOperationException fırlatsın)

    /**
     * Connection'a erişim. Lazy initialization + double-checked locking.
     */
    public static Connection getConnection() {
        // TODO: Double-checked locking pattern uygula
        // 1. instance null mı kontrol et
        // 2. null ise LOCK ile synchronized blok aç
        // 3. Tekrar null kontrol et
        // 4. Hala null ise createConnection() çağır
        // 5. instance'ı dön
        return null;
    }

    /**
     * Properties'ten okuyup yeni connection açar.
     */
    private static Connection createConnection() {
        // TODO: try-with-resources ile application.properties'i oku
        // TODO: Class.forName ile driver'ı yükle
        // TODO: DriverManager.getConnection() ile bağlantı kur
        return null;
    }

    /**
     * Bağlantıyı manuel kapat (uygulama kapanırken).
     */
    public static void closeConnection() {
        // TODO: instance null değilse close() çağır, instance'ı null yap
    }
}
"@

New-JavaFile "$SrcRoot\util\PasswordHasher.java" @"
package $BasePackageDot.util;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Basit SHA-256 şifre hash'leme.
 * NOT: Gerçek hayatta BCrypt veya Argon2 kullanılır.
 */
public final class PasswordHasher {

    // TODO: private constructor (UnsupportedOperationException)

    /**
     * Plain şifreyi SHA-256 hash'e çevirir, hex string olarak döner.
     */
    public static String hash(String plainPassword) {
        // TODO: MessageDigest.getInstance("SHA-256") al
        // TODO: digest() ile byte[] hashBytes üret
        // TODO: byte[]'i hex string'e çevir
        return null;
    }

    /**
     * Plain şifreyi hash'le ve mevcut hash ile karşılaştır.
     */
    public static boolean verify(String plainPassword, String storedHash) {
        // TODO: hash(plainPassword).equals(storedHash) dön
        return false;
    }
}
"@

New-JavaFile "$SrcRoot\util\ConsoleHelper.java" @"
package $BasePackageDot.util;

import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.Scanner;

/**
 * Scanner wrapper — input okuma yardımcısı.
 * Tüm console I/O bu sınıftan geçer.
 */
public class ConsoleHelper {

    // TODO: private static final Scanner scanner = new Scanner(System.in);

    /**
     * String input okur.
     */
    public static String readString(String prompt) {
        // TODO: prompt yazdır, scanner.nextLine().trim() dön
        return null;
    }

    /**
     * Int input okur. Hatalıysa tekrar sorar.
     */
    public static int readInt(String prompt) {
        // TODO: while loop içinde:
        //   - prompt yazdır
        //   - try: Integer.parseInt(scanner.nextLine().trim()) dön
        //   - catch NumberFormatException: hata mesajı, tekrar sor
        return 0;
    }

    /**
     * LocalDate input okur (yyyy-MM-dd formatında).
     */
    public static LocalDate readDate(String prompt) {
        // TODO: while loop içinde:
        //   - prompt + format hint yazdır
        //   - try: LocalDate.parse() dön
        //   - catch DateTimeParseException: hata mesajı
        return null;
    }

    /**
     * Evet/Hayır cevabı okur.
     */
    public static boolean readYesNo(String prompt) {
        // TODO: e/h cevabı al, true/false dön
        return false;
    }

    /**
     * Enter beklesin.
     */
    public static void waitForEnter() {
        // TODO: "Devam etmek için Enter..." yazdır, nextLine() çağır
    }
}
"@

New-JavaFile "$SrcRoot\util\Validation.java" @"
package $BasePackageDot.util;

import java.util.regex.Pattern;

/**
 * Regex ve iş kuralı validasyonları.
 * Hata durumunda RuntimeException fırlatır.
 * (Faz 3'te custom exception'lara evrilecek)
 */
public class Validation {

    // TODO: EMAIL_PATTERN regex: ^[\w.-]+@[\w.-]+\.[a-zA-Z]{2,}$
    // TODO: PHONE_PATTERN regex: ^\+?\d{10,15}$

    public void validateEmail(String email) {
        // TODO: null/blank kontrolü
        // TODO: regex match
    }

    public void validatePhone(String phone) {
        // TODO: null/blank kontrolü
        // TODO: regex match
    }

    public void validatePassword(String password) {
        // TODO: minimum 6 karakter
    }

    public void validateName(String name, String fieldName) {
        // TODO: null/blank kontrolü
        // TODO: maksimum 50 karakter
    }
}
"@

# ============================================================
# 9. DAO PAKETI
# ============================================================
Write-Section "dao/ paketi"

New-JavaFile "$SrcRoot\dao\CustomerDao.java" @"
package $BasePackageDot.dao;

import $BasePackageDot.abst.Crud;
import $BasePackageDot.model.Customer;
import $BasePackageDot.util.DaoConnection;

import java.sql.*;
import java.util.List;
import java.util.Optional;

/**
 * Customer için JDBC tabanlı DAO.
 * persons + customers tablolarına JOIN'li çalışır.
 */
public class CustomerDao implements Crud<Customer, Long> {

    // ============================================
    // CREATE
    // ============================================
    @Override
    public Customer create(Customer customer) {
        // TODO: persons tablosuna INSERT (RETURN_GENERATED_KEYS ile)
        // TODO: Generated ID'yi customer.setId() ile ayarla
        // TODO: customers tablosuna INSERT (person_id ile birlikte)
        // TODO: customer'ı dön
        return null;
    }

    // ============================================
    // READ — getById
    // ============================================
    @Override
    public Optional<Customer> getById(Long id) {
        // TODO: persons + customers JOIN sorgusu
        // TODO: PreparedStatement ile id parametresi
        // TODO: rs.next() varsa mapRowToCustomer() ile Optional dön
        // TODO: yoksa Optional.empty() dön
        return Optional.empty();
    }

    // ============================================
    // READ — getAll
    // ============================================
    @Override
    public List<Customer> getAll() {
        // TODO: persons + customers JOIN, is_active = TRUE filtreli
        // TODO: ORDER BY p.id
        // TODO: ResultSet'i loop'la mapRowToCustomer() ile listeye ekle
        return List.of();
    }

    // ============================================
    // UPDATE
    // ============================================
    @Override
    public Customer update(Customer customer, Long id) {
        // TODO: persons tablosunu UPDATE (first_name, last_name, phone)
        // TODO: customers tablosunu UPDATE (birth_date, customer_type)
        // TODO: customer'ı dön
        return null;
    }

    // ============================================
    // DELETE — soft delete
    // ============================================
    @Override
    public void delete(Long id) {
        // TODO: UPDATE persons SET is_active = FALSE WHERE id = ?
        // TODO: rowsAffected == 0 ise exception
    }

    // ============================================
    // CUSTOM FINDERS
    // ============================================
    public Optional<Customer> findByEmail(String email) {
        // TODO: getById gibi ama WHERE email = ?
        return Optional.empty();
    }

    public boolean existsByEmail(String email) {
        // TODO: SELECT 1 FROM persons WHERE email = ?
        // TODO: rs.next() dön
        return false;
    }

    // ============================================
    // PRIVATE HELPER — ResultSet → Customer mapping
    // ============================================
    private Customer mapRowToCustomer(ResultSet rs) throws SQLException {
        // TODO: Yeni Customer oluştur
        // TODO: rs'den tüm alanları al ve setter'larla ata
        // TODO: birth_date null olabilir, kontrol et
        // TODO: customer_type için CustomerType.valueOf() kullan
        return null;
    }
}
"@

# ============================================================
# 10. BLL PAKETI
# ============================================================
Write-Section "bll/ paketi (Business Logic)"

New-JavaFile "$SrcRoot\bll\CustomerManager.java" @"
package $BasePackageDot.bll;

import $BasePackageDot.dao.CustomerDao;
import $BasePackageDot.dto.request.CustomerRequestDto;
import $BasePackageDot.dto.response.CustomerResponseDto;
import $BasePackageDot.model.Customer;
import $BasePackageDot.util.PasswordHasher;
import $BasePackageDot.util.Validation;

import java.util.List;
import java.util.Optional;

public class CustomerManager {

    // TODO: private final CustomerDao customerDao
    // TODO: private final Validation validation

    public CustomerManager() {
        // TODO: customerDao = new CustomerDao()
        // TODO: validation = new Validation()
    }

    /**
     * Yeni müşteri kaydı.
     * Validasyon → unique kontrolü → hash → persist → response DTO.
     */
    public CustomerResponseDto register(CustomerRequestDto dto) {
        // TODO 1: validation.validateName, validateEmail, validatePhone, validatePassword
        // TODO 2: customerDao.existsByEmail() kontrolü, varsa exception fırlat
        // TODO 3: Yeni Customer oluştur, dto'dan değerleri ata
        // TODO 4: PasswordHasher.hash() ile şifreyi hash'le
        // TODO 5: customerDao.create() ile kaydet
        // TODO 6: toResponseDto() ile çevir ve dön
        return null;
    }

    /**
     * Giriş işlemi. Hash'lenmiş şifreyle karşılaştırır.
     */
    public CustomerResponseDto login(String email, String password) {
        // TODO 1: customerDao.findByEmail(email) — Optional
        // TODO 2: Optional empty ise exception
        // TODO 3: PasswordHasher.verify() ile şifre kontrolü
        // TODO 4: Yanlışsa exception (mesaj: "e-mail veya şifre hatalı" — detay verme!)
        // TODO 5: toResponseDto() dön
        return null;
    }

    public CustomerResponseDto getById(Long id) {
        // TODO: customerDao.getById() — Optional
        // TODO: map(this::toResponseDto).orElseThrow()
        return null;
    }

    public List<CustomerResponseDto> getAll() {
        // TODO: customerDao.getAll()
        // TODO: stream().map(this::toResponseDto).toList()
        return List.of();
    }

    public void deleteAccount(Long id) {
        // TODO: customerDao.delete(id)
    }

    /**
     * Customer → CustomerResponseDto dönüşümü.
     * passwordHash dışarı çıkmaz!
     */
    private CustomerResponseDto toResponseDto(Customer c) {
        // TODO: new CustomerResponseDto(...) dön — passwordHash YOK!
        return null;
    }
}
"@

# ============================================================
# 11. PRESENTATION PAKETI
# ============================================================
Write-Section "presentation/ paketi"

New-JavaFile "$SrcRoot\presentation\customer\CustomerMenu.java" @"
package $BasePackageDot.presentation.customer;

import $BasePackageDot.bll.CustomerManager;
import $BasePackageDot.dto.request.CustomerRequestDto;
import $BasePackageDot.dto.response.CustomerResponseDto;
import $BasePackageDot.util.ConsoleHelper;

import java.time.LocalDate;
import java.util.List;

public class CustomerMenu {

    // TODO: private final CustomerManager customerManager = new CustomerManager();

    public void show() {
        // TODO: while(true) loop'u içinde:
        //   - Menü başlığını yazdır
        //   - Seçenekleri yazdır: 1.Kayıt 2.Giriş 3.Listele 0.Geri
        //   - ConsoleHelper.readInt() ile seçim al
        //   - switch case ile uygun metoda yönlendir
        //   - case 0 -> return
    }

    private void register() {
        // TODO: try-catch içinde:
        //   - ConsoleHelper ile firstName, lastName, email, phone, password, birthDate al
        //   - CustomerRequestDto oluştur
        //   - customerManager.register(dto) çağır
        //   - Başarı mesajı yazdır (ID dahil)
        //   - catch: hata mesajı yazdır
        //   - ConsoleHelper.waitForEnter()
    }

    private void login() {
        // TODO: try-catch içinde:
        //   - email ve password al
        //   - customerManager.login() çağır
        //   - Başarı mesajı + müşteri bilgileri
        //   - catch: hata mesajı
    }

    private void listAll() {
        // TODO: try-catch içinde:
        //   - customerManager.getAll() çağır
        //   - Liste boşsa "Henüz müşteri yok" mesajı
        //   - Doluysa tablo formatında yazdır (printf)
    }
}
"@

New-JavaFile "$SrcRoot\presentation\MainMenu.java" @"
package $BasePackageDot.presentation;

import $BasePackageDot.presentation.customer.CustomerMenu;
import $BasePackageDot.util.ConsoleHelper;
import $BasePackageDot.util.DaoConnection;

public class MainMenu {

    // TODO: private final CustomerMenu customerMenu = new CustomerMenu();

    public void show() {
        // TODO: Hoş geldin mesajı yazdır
        // TODO: while(true) loop:
        //   - Ana menüyü yazdır (1.Müşteri 2.Kurye 3.Satıcı 4.Admin 0.Çıkış)
        //   - Seçim al
        //   - case 1 -> customerMenu.show()
        //   - case 2,3,4 -> "Henüz hazır değil" mesajı
        //   - case 0 -> DaoConnection.closeConnection() + return
    }
}
"@

# ============================================================
# 12. MAIN.JAVA
# ============================================================
Write-Section "Main.java"

New-JavaFile "$SrcRoot\Main.java" @"
package $BasePackageDot;

import $BasePackageDot.presentation.MainMenu;

public class Main {
    public static void main(String[] args) {
        new MainMenu().show();
    }
}
"@

# ============================================================
# 13. RESOURCES / application.properties
# ============================================================
Write-Section "resources/application.properties"

New-JavaFile "resources\application.properties" @"
# PostgreSQL Connection
db.url=jdbc:postgresql://localhost:5432/marketgo
db.username=postgres
db.password=postgres

# Driver class
db.driver=org.postgresql.Driver
"@

# ============================================================
# 14. DB / SQL şeması
# ============================================================
Write-Section "db/V1__faz1_schema.sql"

New-JavaFile "db\V1__faz1_schema.sql" @"
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
"@

# ============================================================
# 15. README
# ============================================================
Write-Section "README.md"

New-JavaFile "README.md" @"
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
\`\`\`
docker run --name marketgo-db -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=marketgo -p 5432:5432 -d postgres:16
\`\`\`

Veya native kurulum sonrası \`marketgo\` veritabanı oluştur.

### 3. Şemayı Yükle

DBeaver'dan veya psql'den \`db/V1__faz1_schema.sql\` dosyasını çalıştır.

### 4. JAR Dosyalarını Ekle

\`lib/\` klasörüne şu JAR'ları indir:
- PostgreSQL JDBC driver: https://jdbc.postgresql.org/download/
- Lombok: https://projectlombok.org/download

### 5. IntelliJ Ayarları

- **File → Project Structure → Libraries** → + Java → \`lib/\` klasörünü seç
- \`resources/\` klasörü için sağ tık → **Mark Directory as → Resources Root**
- Lombok plugin'i kur (Settings → Plugins)
- Annotation Processing'i aç (Settings → Build → Compiler → Annotation Processors)

### 6. Çalıştır

\`Main.java\`'yı çalıştır (yeşil ok butonu).

## Paket Yapısı

\`\`\`
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
\`\`\`

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
"@

# ============================================================
# 16. .gitignore
# ============================================================
New-JavaFile ".gitignore" @"
# Compiled
out/
*.class
*.jar
!lib/*.jar

# IntelliJ
.idea/
*.iml
*.iws
*.ipr

# OS
.DS_Store
Thumbs.db

# Logs
*.log

# Environment
.env
"@

# ============================================================
# 17. ÖZET
# ============================================================
Write-Host ""
Write-Host "============================================================" -ForegroundColor Yellow
Write-Host "  ✓ Proje iskeleti oluşturuldu!" -ForegroundColor Green
Write-Host "============================================================" -ForegroundColor Yellow
Write-Host ""
Write-Host "  Oluşturulan klasör sayısı: $createdDirs" -ForegroundColor White
Write-Host "  Oluşturulan dosya sayısı:  $createdFiles" -ForegroundColor White
Write-Host ""
Write-Host "  Sıradaki adımlar:" -ForegroundColor Cyan
Write-Host "    1. lib/ klasörüne PostgreSQL JDBC driver ve Lombok JAR'larını koy" -ForegroundColor Gray
Write-Host "    2. IntelliJ'de projeyi aç" -ForegroundColor Gray
Write-Host "    3. Project Structure'dan JAR'ları library olarak ekle" -ForegroundColor Gray
Write-Host "    4. resources/'i Resources Root olarak işaretle" -ForegroundColor Gray
Write-Host "    5. PostgreSQL'i kur ve db/V1__faz1_schema.sql'i çalıştır" -ForegroundColor Gray
Write-Host "    6. TODO yorumlarındaki kodları sırasıyla doldurmaya başla" -ForegroundColor Gray
Write-Host ""
Write-Host "  Sınıf doldurma sırası README.md'de yazıyor." -ForegroundColor Cyan
Write-Host ""

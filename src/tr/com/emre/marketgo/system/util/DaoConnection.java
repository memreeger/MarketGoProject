package tr.com.emre.marketgo.system.util;

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

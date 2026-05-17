package tr.com.melih.marketgo.system.util;

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

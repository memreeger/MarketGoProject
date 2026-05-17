package tr.com.emre.marketgo.system.util;

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

package tr.com.emre.marketgo.system.dto.request;

import java.time.LocalDate;

/**
 * Müşteri kayıt isteği. Record olarak immutable.
 * NOT: password plain — Manager katmanında hash'lenecek.
 */
public record CustomerRequestDto(
        // TODO: firstName, lastName, email, phone, password, birthDate alanlarını ekle
) {
}

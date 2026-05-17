package tr.com.melih.marketgo.system.dto.response;

import tr.com.melih.marketgo.system.enums.CustomerType;

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

package tr.com.emre.marketgo.system.dto.response;

/**
 * Sisteme dönen müşteri bilgisi.
 * DİKKAT: passwordHash YOK — güvenlik için asla dışarı çıkmaz.
 */
public record CustomerResponseDto(
        // TODO: id, firstName, lastName, email, phone, customerType, birthDate, createdAt ekle
        // NOT: password VEYA passwordHash KESINLIKLE YOK!
) {
}

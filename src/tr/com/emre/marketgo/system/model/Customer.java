package tr.com.emre.marketgo.system.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

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

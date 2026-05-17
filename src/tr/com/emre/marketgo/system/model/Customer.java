package tr.com.emre.marketgo.system.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import tr.com.emre.marketgo.system.enums.CustomerType;
import tr.com.emre.marketgo.system.enums.PersonType;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
public class Customer extends Person {
    private LocalDate birthDate;
    private CustomerType customerType = CustomerType.REGULAR;
    private List<Address> adresses;

    // TODO: birthDate alanı (LocalDate)
    // TODO: customerType alanı (CustomerType, default REGULAR)
    // TODO: addresses listesi (List<Address>, ArrayList ile başlat)

    public Customer() {
        super();
        setPersonType(PersonType.CUSTOMER);
        // TODO: personType'ı CUSTOMER olarak ayarla
    }

    @Override
    public String getDashboardTitle() {
        // TODO: "Müşteri Paneli" dön
        return "Müşteri paneli";
    }
}

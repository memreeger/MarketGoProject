package tr.com.melih.marketgo.system.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import tr.com.melih.marketgo.system.enums.CustomerType;
import tr.com.melih.marketgo.system.enums.PersonType;

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

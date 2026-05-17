package tr.com.emre.marketgo.system.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Address extends BaseEntity {

    private long customerId;
    private String adressTitle;
    private String fullAdress;
    private String city;
    private String district;
    private boolean isDefault;

    // TODO: customerId (Long) — adresin sahibi olan müşterinin ID'si
    // TODO: title (String) — örn: "Ev", "İş"
    // TODO: fullAddress (String) — tam adres metni
    // TODO: city (String)
    // TODO: district (String)
    // TODO: isDefault (boolean) — varsayılan adres mi
}

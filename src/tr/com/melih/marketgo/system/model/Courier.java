package tr.com.melih.marketgo.system.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import tr.com.melih.marketgo.system.enums.CourierStatus;
import tr.com.melih.marketgo.system.enums.PersonType;

@Getter
@Setter
public class Courier extends Person {

    // TODO: vehiclePlate alanı (String)
    // TODO: courierStatus alanı (CourierStatus, default OFFLINE)

    public Courier() {
        super();
        // TODO: personType'ı COURIER olarak ayarla
    }

    @Override
    public String getDashboardTitle() {
        // TODO: "Kurye Paneli" dön
        return null;
    }
}

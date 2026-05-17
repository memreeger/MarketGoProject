package tr.com.emre.marketgo.system.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import tr.com.emre.marketgo.system.enums.CourierStatus;
import tr.com.emre.marketgo.system.enums.PersonType;

@Getter
@Setter
public class Courier extends Person {
    private String vehiclePlate;
    private CourierStatus courierStatus = CourierStatus.OFFLINE;

    // TODO: vehiclePlate alanı (String)
    // TODO: courierStatus alanı (CourierStatus, default OFFLINE)

    public Courier() {
        super();
        // TODO: personType'ı COURIER olarak ayarla
        setPersonType(PersonType.COURIER);
    }

    @Override
    public String getDashboardTitle() {
        // TODO: "Kurye Paneli" dön
        return "Kurye paneli";
    }
}

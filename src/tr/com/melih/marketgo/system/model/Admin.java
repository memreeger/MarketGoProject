package tr.com.melih.marketgo.system.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import tr.com.melih.marketgo.system.enums.AdminRole;
import tr.com.melih.marketgo.system.enums.PersonType;

@Getter
@Setter
public class Admin extends Person {

    // TODO: adminRole alanı (AdminRole, default ADMIN)

    public Admin() {
        super();
        // TODO: personType'ı ADMIN olarak ayarla
    }

    @Override
    public String getDashboardTitle() {
        // TODO: "Yönetici Paneli" dön
        return null;
    }
}

package tr.com.emre.marketgo.system.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import tr.com.emre.marketgo.system.enums.AdminRole;
import tr.com.emre.marketgo.system.enums.PersonType;

@Getter
@Setter
public class Admin extends Person {
    private AdminRole adminRole = AdminRole.ADMIN;

    // TODO: adminRole alanı (AdminRole, default ADMIN)

    public Admin() {
        super();
        // TODO: personType'ı ADMIN olarak ayarla
        setPersonType(PersonType.ADMIN);
    }

    @Override
    public String getDashboardTitle() {
        // TODO: "Yönetici Paneli" dön
        return "Yönetici paneli";
    }
}

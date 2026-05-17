package tr.com.emre.marketgo.system.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

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

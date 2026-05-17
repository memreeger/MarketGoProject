package tr.com.emre.marketgo.system.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import tr.com.emre.marketgo.system.enums.PersonType;

/**
 * Person hiyerarşisinin soyut atası.
 * Customer, Courier, Admin bu sınıftan extends eder.
 */
@Getter
@Setter
@NoArgsConstructor
public abstract class Person extends BaseEntity {

    private String firstName;
    private String lastName;
    private String email;
    private String phone;
    private PersonType personType;

    public String getFullName() {
        return firstName + " " + lastName;
    }

    public String getDashboardTitle() {
        return "müşteri paneli : ";
    }


    // TODO: firstName, lastName, email, phone alanlarını tanımla
    // TODO: passwordHash alanını tanımla
    // TODO: personType alanını tanımla (PersonType enum)

    /**
     * Polimorfik metot — her subclass kendi panel adını döner.
     */
    // TODO: getDashboardTitle() abstract metodunu tanımla

    /**
     * Tam ad (utility).
     */
    // TODO: getFullName() metodunu yaz
}

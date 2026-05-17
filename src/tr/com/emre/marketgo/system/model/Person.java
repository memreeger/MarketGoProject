package tr.com.emre.marketgo.system.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Person hiyerarşisinin soyut atası.
 * Customer, Courier, Admin bu sınıftan extends eder.
 */
@Getter
@Setter
@NoArgsConstructor
public abstract class Person extends BaseEntity {

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

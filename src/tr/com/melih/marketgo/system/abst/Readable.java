package tr.com.melih.marketgo.system.abst;

import java.util.List;
import java.util.Optional;

/**
 * Sadece okuma operasyonları.
 * Interface Segregation Principle (ISP) örneği.
 */
public interface Readable<T, ID> {

    // TODO: getById metodunu tanımla — Optional<T> dönmeli
    Optional<T> getById(ID id);

    // TODO: getAll metodunu tanımla — List<T> dönmeli
    List<T> getAll();
}

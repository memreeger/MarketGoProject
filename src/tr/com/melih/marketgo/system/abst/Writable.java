package tr.com.melih.marketgo.system.abst;

/**
 * Sadece yazma operasyonları.
 */
public interface Writable<T, ID> {

    // TODO: create metodunu tanımla
    T create(T obj);

    // TODO: update metodunu tanımla
    T update(T obj, ID id);

    // TODO: delete metodunu tanımla
    void delete(ID id);
}

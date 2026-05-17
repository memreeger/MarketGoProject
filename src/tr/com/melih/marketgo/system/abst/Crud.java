package tr.com.melih.marketgo.system.abst;

/**
 * Hem okuma hem yazma. Çoğu DAO bunu implement eder.
 */
public interface Crud<T, ID> extends Readable<T, ID>, Writable<T, ID> {
}

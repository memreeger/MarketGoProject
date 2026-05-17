package tr.com.melih.marketgo.system.dao;

import tr.com.melih.marketgo.system.abst.Crud;
import tr.com.melih.marketgo.system.model.Customer;
import tr.com.melih.marketgo.system.util.DaoConnection;

import java.sql.*;
import java.util.List;
import java.util.Optional;

/**
 * Customer için JDBC tabanlı DAO.
 * persons + customers tablolarına JOIN'li çalışır.
 */
public class CustomerDao implements Crud<Customer, Long> {

    // ============================================
    // CREATE
    // ============================================
    @Override
    public Customer create(Customer customer) {
        // TODO: persons tablosuna INSERT (RETURN_GENERATED_KEYS ile)
        // TODO: Generated ID'yi customer.setId() ile ayarla
        // TODO: customers tablosuna INSERT (person_id ile birlikte)
        // TODO: customer'ı dön
        return null;
    }

    // ============================================
    // READ — getById
    // ============================================
    @Override
    public Optional<Customer> getById(Long id) {
        // TODO: persons + customers JOIN sorgusu
        // TODO: PreparedStatement ile id parametresi
        // TODO: rs.next() varsa mapRowToCustomer() ile Optional dön
        // TODO: yoksa Optional.empty() dön
        return Optional.empty();
    }

    // ============================================
    // READ — getAll
    // ============================================
    @Override
    public List<Customer> getAll() {
        // TODO: persons + customers JOIN, is_active = TRUE filtreli
        // TODO: ORDER BY p.id
        // TODO: ResultSet'i loop'la mapRowToCustomer() ile listeye ekle
        return List.of();
    }

    // ============================================
    // UPDATE
    // ============================================
    @Override
    public Customer update(Customer customer, Long id) {
        // TODO: persons tablosunu UPDATE (first_name, last_name, phone)
        // TODO: customers tablosunu UPDATE (birth_date, customer_type)
        // TODO: customer'ı dön
        return null;
    }

    // ============================================
    // DELETE — soft delete
    // ============================================
    @Override
    public void delete(Long id) {
        // TODO: UPDATE persons SET is_active = FALSE WHERE id = ?
        // TODO: rowsAffected == 0 ise exception
    }

    // ============================================
    // CUSTOM FINDERS
    // ============================================
    public Optional<Customer> findByEmail(String email) {
        // TODO: getById gibi ama WHERE email = ?
        return Optional.empty();
    }

    public boolean existsByEmail(String email) {
        // TODO: SELECT 1 FROM persons WHERE email = ?
        // TODO: rs.next() dön
        return false;
    }

    // ============================================
    // PRIVATE HELPER — ResultSet → Customer mapping
    // ============================================
    private Customer mapRowToCustomer(ResultSet rs) throws SQLException {
        // TODO: Yeni Customer oluştur
        // TODO: rs'den tüm alanları al ve setter'larla ata
        // TODO: birth_date null olabilir, kontrol et
        // TODO: customer_type için CustomerType.valueOf() kullan
        return null;
    }
}

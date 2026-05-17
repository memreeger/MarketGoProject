package tr.com.melih.marketgo.system.bll;

import tr.com.melih.marketgo.system.dao.CustomerDao;
import tr.com.melih.marketgo.system.dto.request.CustomerRequestDto;
import tr.com.melih.marketgo.system.dto.response.CustomerResponseDto;
import tr.com.melih.marketgo.system.model.Customer;
import tr.com.melih.marketgo.system.util.PasswordHasher;
import tr.com.melih.marketgo.system.util.Validation;

import java.util.List;
import java.util.Optional;

public class CustomerManager {

    // TODO: private final CustomerDao customerDao
    // TODO: private final Validation validation

    public CustomerManager() {
        // TODO: customerDao = new CustomerDao()
        // TODO: validation = new Validation()
    }

    /**
     * Yeni müşteri kaydı.
     * Validasyon → unique kontrolü → hash → persist → response DTO.
     */
    public CustomerResponseDto register(CustomerRequestDto dto) {
        // TODO 1: validation.validateName, validateEmail, validatePhone, validatePassword
        // TODO 2: customerDao.existsByEmail() kontrolü, varsa exception fırlat
        // TODO 3: Yeni Customer oluştur, dto'dan değerleri ata
        // TODO 4: PasswordHasher.hash() ile şifreyi hash'le
        // TODO 5: customerDao.create() ile kaydet
        // TODO 6: toResponseDto() ile çevir ve dön
        return null;
    }

    /**
     * Giriş işlemi. Hash'lenmiş şifreyle karşılaştırır.
     */
    public CustomerResponseDto login(String email, String password) {
        // TODO 1: customerDao.findByEmail(email) — Optional
        // TODO 2: Optional empty ise exception
        // TODO 3: PasswordHasher.verify() ile şifre kontrolü
        // TODO 4: Yanlışsa exception (mesaj: "e-mail veya şifre hatalı" — detay verme!)
        // TODO 5: toResponseDto() dön
        return null;
    }

    public CustomerResponseDto getById(Long id) {
        // TODO: customerDao.getById() — Optional
        // TODO: map(this::toResponseDto).orElseThrow()
        return null;
    }

    public List<CustomerResponseDto> getAll() {
        // TODO: customerDao.getAll()
        // TODO: stream().map(this::toResponseDto).toList()
        return List.of();
    }

    public void deleteAccount(Long id) {
        // TODO: customerDao.delete(id)
    }

    /**
     * Customer → CustomerResponseDto dönüşümü.
     * passwordHash dışarı çıkmaz!
     */
    private CustomerResponseDto toResponseDto(Customer c) {
        // TODO: new CustomerResponseDto(...) dön — passwordHash YOK!
        return null;
    }
}

package tr.com.emre.marketgo.system.presentation.customer;

public class CustomerMenu {

    // TODO: private final CustomerManager customerManager = new CustomerManager();

    public void show() {
        // TODO: while(true) loop'u içinde:
        //   - Menü başlığını yazdır
        //   - Seçenekleri yazdır: 1.Kayıt 2.Giriş 3.Listele 0.Geri
        //   - ConsoleHelper.readInt() ile seçim al
        //   - switch case ile uygun metoda yönlendir
        //   - case 0 -> return
    }

    private void register() {
        // TODO: try-catch içinde:
        //   - ConsoleHelper ile firstName, lastName, email, phone, password, birthDate al
        //   - CustomerRequestDto oluştur
        //   - customerManager.register(dto) çağır
        //   - Başarı mesajı yazdır (ID dahil)
        //   - catch: hata mesajı yazdır
        //   - ConsoleHelper.waitForEnter()
    }

    private void login() {
        // TODO: try-catch içinde:
        //   - email ve password al
        //   - customerManager.login() çağır
        //   - Başarı mesajı + müşteri bilgileri
        //   - catch: hata mesajı
    }

    private void listAll() {
        // TODO: try-catch içinde:
        //   - customerManager.getAll() çağır
        //   - Liste boşsa "Henüz müşteri yok" mesajı
        //   - Doluysa tablo formatında yazdır (printf)
    }
}

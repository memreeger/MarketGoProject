package tr.com.emre.marketgo.system.util;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Scanner;

/**
 * Scanner wrapper — input okuma yardımcısı.
 * Tüm console I/O bu sınıftan geçer.
 */
public class ConsoleHelper {

    // TODO: private static final Scanner scanner = new Scanner(System.in);
    private static final Scanner scanner = new Scanner(System.in);

    /**
     * String input okur.
     */
    public static String readString(String prompt) {
        // TODO: prompt yazdır, scanner.nextLine().trim() dön
        return scanner.nextLine().trim();
    }

    /**
     * Int input okur. Hatalıysa tekrar sorar.
     */
    public static int readInt(String prompt) {
        while (true) {
            try {
                System.out.println(prompt);
                return Integer.parseInt(scanner.nextLine().trim());
            } catch (NumberFormatException e) {
                System.out.println("Hatalı prompt lütfen tekrar deneyin");
            }
        }

        // TODO: while loop içinde:
        //   - prompt yazdır
        //   - try: Integer.parseInt(scanner.nextLine().trim()) dön
        //   - catch NumberFormatException: hata mesajı, tekrar sor
    }

    /**
     * LocalDate input okur (yyyy-MM-dd formatında).
     */
    public static LocalDate readDate(String prompt) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/mm/YYYY");
        while (true) {
            try {
                System.out.println(prompt + "dd/mm/YYYY");
                return LocalDate.parse(scanner.nextLine().trim(), formatter);
            } catch (DateTimeParseException e) {
                System.out.println("Hatalı tarih tekrar deneyin");
            }
        }

        // TODO: while loop içinde:
        //   - prompt + format hint yazdır
        //   - try: LocalDate.parse() dön
        //   - catch DateTimeParseException: hata mesajı

    }

    /**
     * Evet/Hayır cevabı okur.
     */
    public static boolean readYesNo(String prompt) {
        // TODO: e/h cevabı al, true/false dön
        String input;
        while (true) {
            System.out.println(prompt + " Seçim yapınız (E/H)");
            input = scanner.nextLine().trim().toLowerCase();
            if (input.equals("e")) {
                return true;
            } else {
                return false;
            }
        }
    }

    /**
     * Enter beklesin.
     */
    public static void waitForEnter() {
        // TODO: "Devam etmek için Enter..." yazdır, nextLine() çağır
        System.out.println("Devam etmek için lütfen enter tuşuna basın");
        scanner.nextLine();
    }
}

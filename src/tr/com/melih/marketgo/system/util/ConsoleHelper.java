package tr.com.melih.marketgo.system.util;

import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.Scanner;

/**
 * Scanner wrapper — input okuma yardımcısı.
 * Tüm console I/O bu sınıftan geçer.
 */
public class ConsoleHelper {

    // TODO: private static final Scanner scanner = new Scanner(System.in);

    /**
     * String input okur.
     */
    public static String readString(String prompt) {
        // TODO: prompt yazdır, scanner.nextLine().trim() dön
        return null;
    }

    /**
     * Int input okur. Hatalıysa tekrar sorar.
     */
    public static int readInt(String prompt) {
        // TODO: while loop içinde:
        //   - prompt yazdır
        //   - try: Integer.parseInt(scanner.nextLine().trim()) dön
        //   - catch NumberFormatException: hata mesajı, tekrar sor
        return 0;
    }

    /**
     * LocalDate input okur (yyyy-MM-dd formatında).
     */
    public static LocalDate readDate(String prompt) {
        // TODO: while loop içinde:
        //   - prompt + format hint yazdır
        //   - try: LocalDate.parse() dön
        //   - catch DateTimeParseException: hata mesajı
        return null;
    }

    /**
     * Evet/Hayır cevabı okur.
     */
    public static boolean readYesNo(String prompt) {
        // TODO: e/h cevabı al, true/false dön
        return false;
    }

    /**
     * Enter beklesin.
     */
    public static void waitForEnter() {
        // TODO: "Devam etmek için Enter..." yazdır, nextLine() çağır
    }
}

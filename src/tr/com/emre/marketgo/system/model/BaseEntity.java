package tr.com.emre.marketgo.system.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

/**
 * Tüm domain entity'lerinin atası.
 * Ortak alanlar: id, createdAt, updatedAt, isActive.
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public abstract class BaseEntity {

    // TODO: id alanını tanımla (Long)
    // TODO: createdAt alanını tanımla (LocalDateTime)
    // TODO: updatedAt alanını tanımla (LocalDateTime)
    // TODO: isActive alanını tanımla (boolean, default true)

}

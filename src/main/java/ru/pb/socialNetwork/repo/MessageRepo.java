package ru.pb.socialNetwork.repo;

import org.springframework.data.repository.CrudRepository;
import ru.pb.socialNetwork.domain.Message;

import java.util.List;

public interface MessageRepo extends CrudRepository<Message, Long> {
    /**
     * Получить сообщение по названию тега
     *
     * @param tag    Тег
     * @return Список сообщений
     */
    List<Message> findByTag(String tag);
}

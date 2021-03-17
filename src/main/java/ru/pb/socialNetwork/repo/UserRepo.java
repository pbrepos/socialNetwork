package ru.pb.socialNetwork.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.pb.socialNetwork.domain.User;

public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String username);

    User findByActivationCode(String code);
}

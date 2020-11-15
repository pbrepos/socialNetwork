package ru.pb.socialNetwork.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import ru.pb.socialNetwork.domain.Role;
import ru.pb.socialNetwork.domain.User;
import ru.pb.socialNetwork.repo.UserRepo;

import java.util.Collections;
import java.util.Map;
import java.util.Objects;

@Controller
public class RegistrationController {
    @Autowired
    private UserRepo userRepo;

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Map<String, Object> model) {
        User userFromDb = userRepo.findByUsername(user.getUsername());
        if (Objects.nonNull(userFromDb)) {
            model.put("message", "User exests!");
            return "registartion";
        }
        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        userRepo.save(user);

        return "redirect:login";

    }
}

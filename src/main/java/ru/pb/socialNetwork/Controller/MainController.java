package ru.pb.socialNetwork.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import ru.pb.socialNetwork.domain.Message;
import ru.pb.socialNetwork.domain.User;
import ru.pb.socialNetwork.repo.MessageRepo;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;

@Controller
public class MainController {
    @Autowired
    private MessageRepo messageRepo;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping("/main")
    public String mainPage(@RequestParam(required = false,defaultValue = "")
                                       String filter, Model model) {
        Iterable<Message> messages;

        if (Objects.nonNull(filter) && !filter.isEmpty()) {
            messages = messageRepo.findByTag(filter);
        } else {
            messages = messageRepo.findAll();
        }

        model.addAttribute("messages", messages);
        model.addAttribute("filter", filter);
        return "main";
    }

    @PostMapping("/main")
    public String addMessage(@AuthenticationPrincipal User user,
                             @RequestParam String text,
                             @RequestParam String tag, Map<String, Object> model,
                             @RequestParam("file")MultipartFile file
    ) throws IOException {
        Message message = new Message(text, tag, user);
        if (Objects.nonNull(file) && !file.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String uniqUploadFileName = uuidFile + "_" + file.getOriginalFilename();
            file.transferTo(new File(uploadPath + "/" + uniqUploadFileName));

            message.setFilename(uniqUploadFileName);
        }
        messageRepo.save(message);
        Iterable<Message> messages = messageRepo.findAll();
        model.put("messages", messages);
        return "main";
    }

}
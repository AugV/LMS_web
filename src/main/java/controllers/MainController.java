package controllers;

import entities.University;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import util.UniversityDataFiller;

@Controller
public class MainController {
    University university;

    public MainController() {
        this.university = new UniversityDataFiller().getUniversityWithData();
    }

    @RequestMapping("/")
    public String indexPage(Model model) {
        model.addAttribute("students", university.getAllStudents());
        return "index";
    }

    @RequestMapping(value="/courses")
    public String coursePage(@RequestParam("studentIdForm") String id, Model m) {
        String ID = id;
        m.addAttribute("studentId", ID);
        return "courses";
    }
}

package controllers;

import entities.Course;
import entities.Student;
import entities.University;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import util.UniversityDataFiller;

import java.util.List;
import java.util.NoSuchElementException;

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
    public String coursePage(@RequestParam("studentIdForm") int studentId, Model model) {
        Student loggedStudent= getStudent(studentId);
        if(exists(loggedStudent)){
            List<Course> loggedStudentCourses = loggedStudent.getStudentsGroup().getGroupCourses();
            model.addAttribute("courseList", loggedStudentCourses);
            return "courses";}
        else {
            return callNoInfopage();
        }
    }

    private boolean exists(Object objectToCheck) {
        return objectToCheck != null;
    }

    private Student getStudent(int studentId) {
        Student student=null;
        try{
            student = university.getStudentById(studentId);
        } catch(NoSuchElementException e){
            System.out.println("EXCEPTION: " + e);
        }
        return student;
    }

    public String callNoInfopage(){
        return "noInfo";
    }
}

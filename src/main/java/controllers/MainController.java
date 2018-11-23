package controllers;

import entities.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import util.UniversityDataFiller;

import java.util.List;
import java.util.NoSuchElementException;

@Controller
public class MainController {
    private University university;
    private Student loggedStudent;
    private Course selectedCourse;
    private Task selectedTask;

    public MainController() {
        this.university = new UniversityDataFiller().getUniversityWithData();
    }

    @RequestMapping("/")
    public String indexPage(Model model) {
        model.addAttribute("students", university.getAllStudents());
        return "index";
    }

    @RequestMapping(value = "/courses")
    public String coursePage(@RequestParam("studentIdForm") int studentId, Model model) {
        loggedStudent = getStudent(studentId);
        if (exists(loggedStudent)) {
            List<Course> loggedStudentCourses = loggedStudent.getStudentsGroup().getGroupCourses();
            model.addAttribute("courseList", loggedStudentCourses);
            return "courses";
        } else {
            return callNoInfopage();
        }
    }

    @RequestMapping(value = "/tasks")
    public String taskPage(@RequestParam("courseId") int courseId, Model model) {
        selectedCourse = getCourse(courseId);
        if (exists(selectedCourse)) {
            List<Task> selectedCourseTasks = selectedCourse.getCourseTasks();
            model.addAttribute("taskList", selectedCourseTasks);
            return "tasks";
        } else {
            return callNoInfopage();
        }
    }

    @RequestMapping("/selectedTask")
    public String selectedTaskPage(@RequestParam("taskId") int taskId, Model model) {
        selectedTask = getTask(taskId);
        if (exists(selectedTask)) {
            model.addAttribute("taskName", selectedTask.getName());
            model.addAttribute("taskCondition", selectedTask.getTaskCondition());
            model.addAttribute("taskDeadline", selectedTask.getDeadline());
            model.addAttribute("taskPoints", selectedTask.getPoints());
            return "selectedTask";
        } else {
            return callNoInfopage();
        }
    }

    @RequestMapping("/completedTasks")
    public String completedTaskPage(@RequestParam("answer") String taskAnswer, Model model) {
        selectedTask.addTaskCompletedTask(new CompletedTask((int)(Math.random()*10) , taskAnswer, loggedStudent));
        List<CompletedTask> completedTaskList = selectedTask.getTaskCompletedTasks();
        model.addAttribute("selectedTaskname", selectedTask.getName());
        model.addAttribute("completedTaskList", completedTaskList);
        return "completedTasks";
    }

    private Task getTask(int taskId) {
        Task task = null;
        try {
            task = selectedCourse.getCourseTaskByID(taskId);
        } catch (NoSuchElementException e) {
            System.out.println("EXCEPTION:" + e);
        }
        return task;
    }


    private boolean exists(Object objectToCheck) {
        return objectToCheck != null;
    }

    private Course getCourse(int courseId) {
        Course course = null;
        try {
            course = university.getCourseByID(courseId);
        } catch (NoSuchElementException e) {
            System.out.println("EXCEPTION: " + e);
        }
        return course;
    }

    private Student getStudent(int studentId) {
        Student student = null;
        try {
            student = university.getStudentById(studentId);
        } catch (NoSuchElementException e) {
            System.out.println("EXCEPTION: " + e);
        }
        return student;
    }

    public String callNoInfopage() {
        return "noInfo";
    }
}

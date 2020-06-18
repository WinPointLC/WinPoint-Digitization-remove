package application.controllers;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;

public class MainScreenController {

    @FXML
    private ComboBox<?> selectStream;

    @FXML
    private ComboBox<?> selectCourseType;

    @FXML
    private Button courseName;

    @FXML
    void getCourseName(ActionEvent event) {
    	System.out.println(event);
    }

    @FXML
    void getCourseType(ActionEvent event) {
    	System.out.println("OK2");
    }

    @FXML
    void getStream(ActionEvent event) {
    	System.out.println("OK3");
    }

}


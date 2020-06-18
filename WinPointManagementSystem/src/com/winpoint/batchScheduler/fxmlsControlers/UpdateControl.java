package mainPage.controller;

import com.jfoenix.controls.JFXButton;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;

public class UpdateControl {
	
	@FXML
    private JFXButton CancelButton;

    @FXML
    private JFXButton SubmitButton;

    @FXML
    private JFXButton ResetButton;

    @FXML
    void cancelClick(ActionEvent event) {
    	System.out.println("will take to the enquiry details page");
    }

    @FXML
    void resetClick(ActionEvent event) {
    	System.out.println("will reset all the fields");
    }

    @FXML
    void submitClick(ActionEvent event) {
    	System.out.println("will save the changes made and take back to the equiry detais table");
    }
}

# SwiftClasses

## [Custom Picker View in Textfield Class](https://github.com/varen1994/SwiftClasses/blob/master/Picker_Classes/CustomPickerTextField.swift)
I was trying to open picker for each textfield activation in table view cells but the code quantity was getting increased in the controller
 and the cells were dequeueing so the picker was not starting from the value present in that textfield.
So i created this class where i can manage the picker view.

### How to use?
1. Give your textfield this class in the storybord.
2. Attach delegate to the Viewcontroller.
3. Pass value for picker titles in the method 


  ```func setUpWithValuesCell(arrayString:Array<String>,tag:Int)```  
   *  arrayString -> Values to Set in picker view
   *  tag -> give it unique number for each cell and use it on click of Done button for storing it in your View controller class.
   
## [Custom Button with Activity Indicator](https://github.com/varen1994/SwiftClasses/blob/master/Button_Classes/CustomActivityIndicatorButton.swift)   
Adding activity indicator to the button for showing some activity occuring in the controller.
I have added some designable elements like CornerRadius, Border Width, Text, activity indicator color.
User can start activity indicator and stop it using following methods.
    
    
    ``` func startAnimating() ```
    ``` func endAnimating() ```
   
   

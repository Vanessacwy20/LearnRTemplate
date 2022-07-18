<!-- HOW TO ADD NEW STYLE BOX -->
## How to add new style box

1. You can find this under R/QuickBuildBlock.R
  ```r
  block.data <- data.frame(
  block_type = c ("QuestionBox","InstructionBox","SolutionBox","TaskBox"), 
  block_color = c("BlueBox","GreenBox","YellowBox","BlueBox"),
  icon = c("fa-question-circle","fa-check-circle","fa-cog","a-pencil"),
  title = c("Question","Instruction","Solution","Task"),
  open_status = c("TRUE","TRUE","FALSE","TRUE")
  )
  ```
  
  You can add a new box style by:
  ```r
  block.data <- data.frame(
  block_type = c ("QuestionBox","InstructionBox","SolutionBox","[___New Box Type___]"), 
  block_color = c("BlueBox","GreenBox","YellowBox","[___BlueBox/YellowBox/RedBox/GreenBox (The color of the box) ___]"),
  icon = c("fa-question-circle","fa-check-circle","fa-cog","[___*The icon shown infront of the title___]"),
  title = c("Question","Instruction","Solution","[___The title of the box___]"),
  open_status = c("TRUE","TRUE","FALSE","[___TRUE/FALSE (Default status of the box; TRUE -> open, FALSE -> closed)___]")
  )
  ```
  
  * You can find the icons here: https://fontawesome.com/v4/icons/
  For example:
  ```html
  <i class="fa fa-address-book" aria-hidden="true"></i>
  ```
  Copy `fa-address-book` and add at the back of the icon list. 
  

2. Call the box 
   The box can be called by:
   ```r
   BuildBlock(BlockType,Content)
   ```
   
3. Style can be used in the box
   * By adding `` infront and behind the text, the text would be highlighted into blue (``Example``)
   
   * By adding # infront of the sentence, the sentence would be bolded and larger (#Sentence to be bolded)
   

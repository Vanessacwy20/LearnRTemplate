### Installation

_Below is an example of how you can instruct your audience on installing and setting up your app. This template doesn't rely on any external dependencies or services._

1. Get a free API Key at [https://example.com](https://example.com)
2. Clone the repo
   ```sh
   git clone https://github.com/your_username_/Project-Name.git
   ```
3. Install NPM packages
   ```sh
   npm install
   ```
4. Enter your API in `config.js`
   ```js
   const API_KEY = 'ENTER YOUR API';
   ```

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- HOW TO ADD NEW STYLE BOX -->
## How to add new style box

1. You can find this under R/QuickBuildBlock.R
  ```r
  block.data <- data.frame(
  block_type = c ("QuestionBox","InstructionBox","SolutionBox"), 
  block_color = c("BlueBox","GreenBox","YellowBox"),
  icon = c("fa-question-circle","fa-check-circle","fa-cog"),
  title = c("Question","Instruction","Solution"),
  open_status = c("TRUE","TRUE","FALSE")
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
   * By adding --b-- infront and behind the text, the text would be highlighted into blue (--b--Example--b--)
   
   * By adding # infront of the sentence, the sentence would be bolded and larger (#Sentence to be bolded)
   

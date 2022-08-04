
block.data <- data.frame(
  block_type = c ("QuestionBox","InstructionBox","SolutionBox","TaskBox"), 
  block_color = c("BlueBox","GreenBox","YellowBox","BlueBox"),
  icon = c("fa-question-circle","fa-check-circle","fa-cog","a-pencil"),
  title = c("Question","Instruction","Solution","Task"),
  open_status = c("TRUE","TRUE","FALSE","TRUE")
)

AddHorizontalLine <- function(){
  div(style="width:100%;border-bottom: 2px solid var(--bs-primary)")
}


BuildExerciseBox <- function(ID){
  
  BlockID <- paste0(toString(ID),"_ExerciseBoxContent")
  
  div( class = "ExerciseBox",class = "Box", class = "BoxContainer",class="container-fluid",
       div( class = "row",
            div( class="col", class="BoxTitle",
                 HTML('
                  <i class="fa fa-pen-square" role="presentation" aria-label="pen-square icon"></i>
                  <p>Challenge</p>
                ')
                 
            )
       ),
       div( id=BlockID,  class = "row",
            
       )
  )
  
  
}

BuildBlock <- function(BlockType,Content,BlockTitle){
  
  if(missing(BlockTitle)) {
    blocktitle <- block.data[block.data$block_type == BlockType, "title"]
  } else {
    blocktitle <- BlockTitle
  }
    
  blockColor <- block.data[block.data$block_type == BlockType, "block_color"]
  iconUsed <- block.data[block.data$block_type == BlockType, "icon"]
  
  openStatus <- block.data[block.data$block_type == BlockType, "open_status"]
  
  
 
  ICON_HTMLContent <- '</p>
                        <i class="fa fa-caret-square-down updownicon" role="presentation" aria-label="caret-square-down icon" style="margin-left:10px;"></i>
                        <i class="fa fa-caret-square-up updownicon" role="presentation" aria-label="caret-square-up icon" style="margin-left:10px;display:none"></i>
                      '
  Content_Display <- 'display:none'
  
  if (openStatus == "TRUE"){
    ICON_HTMLContent <- '</p>
                          <i class="fa fa-caret-square-down updownicon" role="presentation" aria-label="caret-square-down icon" style="margin-left:10px;display:none"></i>
                          <i class="fa fa-caret-square-up updownicon" role="presentation" aria-label="caret-square-up icon" style="margin-left:10px;"></i>
                        '
    Content_Display <- ''
  }
  
  
  
  Content <- strsplit(Content,'\n')[[1]]
  
  ContentGenerate <- ""
  
  for (line in Content)
  {
    line_counter <- 1
    
    if (line !=  ""){
      
      if(grepl("#",line)){
        
        # Header
        
        ContentGenerate <-
          paste0(
            ContentGenerate,
            '<div class="TitleFont">'
          )
        
        line <- gsub("#", "", line)
        
      }else{
        ContentGenerate <-
          paste0(
            ContentGenerate,
            '<div class="ContentFont">'
          )
      }
      
      if(grepl("`",line)){
        
        # highlight
        
        str_list_counter <- 1
        
        str_list <- strsplit(line, "`")[[1]]
        
        for (str in str_list){
          if (str_list_counter %% 2 == 0){
            
            ContentGenerate <-
              paste0(
                ContentGenerate,
                '<p class="highlightText">'
                ,str,
                '</p>'
                
              )
            
          }else{
            
            ContentGenerate <-
              paste0(
                ContentGenerate,
                '<p>'
                ,str,
                '</p>'
              )
            
          }
          
          str_list_counter <- str_list_counter + 1
        }
        
      }else{
        ContentGenerate <-
          paste0(
            ContentGenerate,
            '<p>'
            ,line,
            '</p>'
          )
      }
      
      ContentGenerate <-
        paste0(
          ContentGenerate,
          '</div>'
        )
      
      
      line_counter <- line_counter + 1
      
      
    }
  }
  

  

    
    div( class = BlockType ,class = blockColor, class="Box", class = "BoxContainer",class="container-fluid",
         div( class = "row",
              div( class="col", class="BoxTitle", class="SecondTrigger", onclick="OpenBlock(this)", 
                   HTML(paste0('
                  <i class="fa ',iconUsed,'" role="presentation" aria-label="pen-square icon"></i>
                  <p>',blocktitle, ICON_HTMLContent))
                   
              )
         ),
         div( class = "row", class = "ChildContainer",
              
              div( class = "col",
                   div( class="ChildBox", class="Box", class="container-fluid", style=Content_Display, 
                        HTML(ContentGenerate)
                   )
              )
              
         )
    )
   
  
}

BuildBoxInExBlock <-function(ParentID,BlockType,Content){
  
  ExBlockID <- paste0(ParentID,"_ExerciseBoxContent")
  
  blockColor <- block.data[block.data$block_type == BlockType, "block_color"]
  iconUsed <- block.data[block.data$block_type == BlockType, "icon"]
  blocktitle <- block.data[block.data$block_type == BlockType, "title"]
  
  Content <- strsplit(Content,'\n')[[1]]
  
  ContentGenerate <- ""
  
  for (line in Content)
  {
    line_counter <- 1
    
    if (line !=  ""){
      
      if(grepl("#",line)){
        
        # Header
        
        ContentGenerate <-
          paste0(
            ContentGenerate,
            "var d_content = document.createElement('div');",
            "d_content.classList.add('TitleFont');"
          )
        
        line <- gsub("#", "", line)
        
      }else{
        ContentGenerate <-
          paste0(
            ContentGenerate,
            "var d_content = document.createElement('div');",
            "d_content.classList.add('ContentFont');"
          )
      }
      
      if(grepl("`",line)){
        
        # highlight
        
        str_list_counter <- 1
        
        str_list <- strsplit(line, "`")[[1]]
        
        for (str in str_list){
          if (str_list_counter %% 2 == 0){
            
            ContentGenerate <-
              paste0(
                ContentGenerate,
                "var para = document.createElement('p');",
                "para.classList.add('highlightText');",
                "para.innerHTML = '",str,"';",
                "d_content.append(para);"
                
              )
            
          }else{
            
            ContentGenerate <-
              paste0(
                ContentGenerate,
                "var para = document.createElement('p');",
                "para.innerHTML = '",str,"';",
                "d_content.append(para);"
              )
            
          }
          
          str_list_counter <- str_list_counter + 1
        }
        
      }else{
        ContentGenerate <-
          paste0(
            ContentGenerate,
            "var para = document.createElement('p');",
            "para.innerHTML = '",line,"';",
            "d_content.append(para);"
          )
      }
      
      ContentGenerate <-
        paste0(
          ContentGenerate,
          "dChildBox.append(d_content);"
        )
      
      
      line_counter <- line_counter + 1
      
      
    }
  }
  
  
  appendcode <- paste0("document.getElementById('", ExBlockID , "').append(d1);")
  
  
  jscode <- paste0("
  
        var d1 = document.createElement('div');
        d1.classList.add('col');
        d1.classList.add('SecondContainer');
        
        var d2 = document.createElement('div');
        d2.classList.add('",BlockType,"');
        d2.classList.add('",blockColor,"');
        d2.classList.add('Box');
        d2.classList.add('BoxContainer');
        d2.classList.add('container-fluid');
        
        var drow1 = document.createElement('div');
        drow1.classList.add('row');
        
        var dcol1 = document.createElement('div');
        dcol1.classList.add('col');
        dcol1.classList.add('BoxTitle');
        dcol1.classList.add('SecondTrigger');
        
        var icon1 = document.createElement('i');
        icon1.classList.add('fa');
        icon1.classList.add('",iconUsed,"');
        
        
        var title1 = document.createElement('p');
        title1.innerHTML = '",blocktitle,"';
        
        var icondown = document.createElement('i');
        icondown.classList.add('fa');
        icondown.classList.add('fa-caret-square-down');
        icondown.classList.add('updownicon');
        icondown.style.marginLeft = '10px';
        icondown.style.display = 'none';
        
        var iconup = document.createElement('i');
        iconup.classList.add('fa');
        iconup.classList.add('fa-caret-square-up');
        iconup.classList.add('updownicon');
        iconup.style.marginLeft = '10px';
        
        dcol1.append(icon1);
        dcol1.append(title1);
        dcol1.append(icondown);
        dcol1.append(iconup);
        
        var drow2 = document.createElement('div');
        drow2.classList.add('row');
        drow2.classList.add('ChildContainer');
        
        var dcol2 = document.createElement('div');
        dcol2.classList.add('col');
        
        var dChildBox = document.createElement('div');
        dChildBox.classList.add('ChildBox');
        dChildBox.classList.add('Box');
        dChildBox.classList.add('container-fluid');
      "
                   ,ContentGenerate,
                   "
        
        dcol2.append(dChildBox);
        drow2.append(dcol2);
        drow1.append(dcol1);
        d2.append(drow1);
        d2.append(drow2);
        d1.append(d2);

  "
                   ,appendcode)
  
  
  tags$script(jscode)
  
  
}

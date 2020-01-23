make_key <- function(id, label) {
   glue::glue('<button id="{id}" width="100%" type="button" class="btn btn-default action-button" style="font-size: large;">{label}</button>')
}
make_register <- function(id, label) {
   glue::glue('
<tr>
  <td>{label}</td>
  <td colspan="2"> 
    <div id="{id}" class="shiny-text-output register"></div>
  </td>
</tr>')
}

make_keyboard <- function() {
   res <- glue::glue(
   '<table>
{make_register("stack2", "R2: ")}
{make_register("stack1", "R1: ")}
{make_register("stack0", "R0: ")}
{make_register("current", "#")}
<tr>
 <td>{make_key("one", "1")}</td>
 <td>{make_key("two", "2")}</td>
 <td>{make_key("three", "3")}</td>
</tr>  
<tr>
 <td>{make_key("four", "4")}</td>
 <td>{make_key("five", "5")}</td>
 <td>{make_key("six",  "6")}</td>
</tr>  
<tr>
 <td>{make_key("seven", "7")}</td>
 <td>{make_key("eight", "8")}</td>
 <td>{make_key("nine",  "9")}</td>
</tr>  
<tr>
 <td>{make_key("erase", "↤")}</td>
 <td>{make_key("zero", "0")}</td>
 <td>{make_key("dot",  " .")}</td>
</tr>  

              
</table>')
   
   HTML(res)
}

make_operations <- function() {
   res <- glue::glue('
<table>
<tr>
  <td>{make_key("divide","/")}</td>
  <!-- sqrt key here -->
  <!-- pi key here -->
</tr>
<tr>
  <td>{make_key("times","*")}</td>
  <!-- exp key here -->
  <!-- Eulers e here -->
</tr>
<tr>
  <td>{make_key("minus","-")}</td>
  <!-- ln key here -->
  <!-- lg2 key here -->
</tr>
<tr>
  <td>{make_key("plus","+")}</td>
  <!-- sin key here -->
  <!-- cos key here -->
</tr>
<tr>
  <td colspan="2">{make_key("push", "Push")}</td>
</tr>
</table>')
   
   HTML(res)
}


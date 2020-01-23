whole_board <- function() {
   res <- glue::glue(
   "<table>
<tr>
 <td>{one_square_html(1,1)}</td>
 <td>{one_square_html(1,2)}</td>
 <td>{one_square_html(1,3)}</td>
</tr>  
<tr>
 <td>{one_square_html(2,1)}</td>
 <td>{one_square_html(2,2)}</td>
 <td>{one_square_html(2,3)}</td>
</tr>  
<tr>
 <td>{one_square_html(3,1)}</td>
 <td>{one_square_html(3,2)}</td>
 <td>{one_square_html(3,3)}</td>
</tr>  
              
</table>")
   
   HTML(res)
}

one_square_html <- function(row=1, col=1) {
   id <- function(r,c) {
      glue::glue("{row}-{col}-{r}-{c}")
   }
   basic <- "<table style=\"border: 1px solid black;\">
 <tr>
   <td><button id={id(1,1)} type=\"button\" class=\"btn btn-default action-button\">X</button></td>
   <td><button id={id(1,2)} type=\"button\" class=\"btn btn-default action-button\">X</button></td>
   <td><button id={id(1,3)} type=\"button\" class=\"btn btn-default action-button\">X</button></td>
 </tr>
 <tr>
   <td><button id={id(2,1)} type=\"button\" class=\"btn btn-default action-button\">X</button></td>
   <td><button id={id(2,2)} type=\"button\" class=\"btn btn-default action-button\">X</button></td>
   <td><button id={id(2,3)} type=\"button\" class=\"btn btn-default action-button\">X</button></td>
 </tr>
 <tr>
   <td><button id={id(3,1)} type=\"button\" class=\"btn btn-default action-button\">X</button></td>
   <td><button id={id(3,2)} type=\"button\" class=\"btn btn-default action-button\">X</button></td>
   <td><button id={id(3,3)} type=\"button\" class=\"btn btn-default action-button\">X</button></td>
 </tr>
</table>"

  res <- glue::glue(basic)
  
  HTML(res)
  }

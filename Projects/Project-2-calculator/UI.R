source("keyboard.R")

ui <- HTML(
  glue::glue("
<table >
 <tr>
  <td>{make_keyboard()}</td>
  <td> </td>
  <td  style='vertical-align: bottom;'>{make_operations()}</td>
 </tr>
</table>")
)
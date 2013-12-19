window.Devise = 
  init : ->
    $(document).on "change", "#avatar_select", (event) ->
      preview = $("#avatar_div img");
      input = $(this)
      file = input[0].files[0]
      reader = new FileReader()
      reader.onload = (e) ->
        image_base64 = e.target.result
        preview.attr("src", image_base64)
      reader.readAsDataURL(file); 
  

$(document).ready ->
  Devise.init()
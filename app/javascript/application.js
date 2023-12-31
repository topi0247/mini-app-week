// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

$(function(){
  $(document).on("change","#post_photo",function(){
    let elem = this;
    let fileReader = new FileReader();
    fileReader.readAsDataURL(elem.files[0]);
    fileReader.onload = (function () {
        let imgTag = `<img src='${fileReader.result}'>`
        $("#photo-prev").html(imgTag);
    });
  })

  $(document).on("change","#user_avatar",function(){
    let elem = this;
    let fileReader = new FileReader();
    fileReader.readAsDataURL(elem.files[0]);
    fileReader.onload = (function () {
        $('#avatar_prev').attr('src',fileReader.result);
    });
  })
})
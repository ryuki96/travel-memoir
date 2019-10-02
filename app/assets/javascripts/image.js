$(function(){
  $('form').on('change', 'input[type= "file"].memoir-form__image',function(event) {
    $('.image-upload-figure').remove();
    var file = $(this).prop('files')[0];
    var reader = new FileReader();
    var img = $(`<figure class="image-upload-figure"><img class= "preview"  width= "100%" height= "400px"></figure>`);
    reader.onload = function(e) {
      img.find('img').attr({
        src: e.target.result
      })
    }
    reader.readAsDataURL(file);
    $('.upload-image').append(img)
  })
  $('form').on('change', 'input[type= "file"].backimage',function(event) {
    var file = $(this).prop('files')[0];
    var reader = new FileReader();
    var img = $(`<figure class="backimage-upload-figure"><img class= "backimage-preview"  width= "100%" height= "400px"></figure>`);
    reader.onload = function(e) {
      img.find('img').attr({
        src: e.target.result
      })
    }
    reader.readAsDataURL(file);
    $('.backimage-upload-figure').remove();
    $('.upload-backimage').append(img)
  })
  $('form').on('change', 'input[type= "file"].userimage',function(event) {
    var file = $(this).prop('files')[0];
    var reader = new FileReader();
    var img = $(`<figure class="userimage-upload-figure"><img class= "userimage-preview"  width= "100%" height= "400px"></figure>`);
    reader.onload = function(e) {
      img.find('img').attr({
        src: e.target.result
      })
    }
    reader.readAsDataURL(file);
    $('.image-upload-figure').remove();
    $('.upload-userimage').append(img)
  })
})
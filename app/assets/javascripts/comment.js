$(function(){
  function buildHTML(comment){
    var text = comment.text ? `${ comment.text }` : "";
    var html = `<div class="comment">
                  <div class="upper-comment">
                    <div class="user-name">
                      ${comment.user_name}
                    </div>
                    <div class="comment-date">
                      ${comment.date}
                    </div>
                  </div>
                  <div class="lower-comment">
                    <div class="comment-text">
                      ${text}
                    </div>
                  </div>
                 </div>`
    return html;
  }
  function scrollBottom(){
    $('.comments').animate({scrollTop: $('.comments')[0].scrollHeight},100,'swing')
  }
  $("#new_comment").on("submit",function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: 'POST',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comments').append(html)
      $('.comment-form__text').val('')
      scrollBottom();
    })
    .fail(function(){
      alert('文字を入力してください');
    })
    .always(function(){
      $('.comment-form__submit').prop('disabled', false);  
    
    })
  })
})
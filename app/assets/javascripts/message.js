$(function(){
    function buildHTML(message){
      var insertImage = ""
      if(message.image) {
        insertImage = `<img src="${message.image.url}">`;
      }
      var html =
                `<div class = "main-site__body--messages" data-id="${message.id}">
                <div class="message__box--inner">
                    <div class="message__name">${message.name}</div>
                    <div class="message__date">${message.created_at}</div>
                  </div>
                  <div class="main-site__body--messagesbottom">
                      <div class="message image">${insertImage}</div>
                    <div class="message__text">${message.body}</div>
                </div>
                </div>`;
      return html;
    }


  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      // console.log(data);
      var html = buildHTML(data);
      $('.textarea').val('')
      $('btn').val('')
      $('.main-site__body--message').append(html);
      $('.main-site__body--message').animate({scrollTop: $('.main-site__body--message')[0].scrollHeight}, 'fast');
    })
    .fail(function(){
      alert('エラーが出ました');
    })
    return false;
  })


    var autoReload = setInterval(function() {
      if (window.location.href.match(/\/groups\/\d+\/messages/)){
        update();
      } else {
      clearInterval(autoReload);
      }}, 10000);

    function update(){
      var last_message_id = $('.main-site__body--messages').last().data('id');
      console.log(last_message_id);
      var url = window.location.href;
        $.ajax({
        url: url,
        type: "GET",
        data: { 'message': { 'id': last_message_id } },
        dataType: 'json',
      })
      .done(function(data){
        data.forEach(function(data){
          insertHTML = buildHTML(data);
          $('.main-site__body--message').append(insertHTML);
          $('.main-site__body--message').animate({scrollTop: $('.main-site__body--message')[0].scrollHeight}, 'fast');
        })
      })
    }
  });

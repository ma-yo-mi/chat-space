$(function() {

  function appendUser(user) {
    console.table(user)
     var html = `<div class="chat-group-user clearfix js-remove">
                    <p class="chat-group-user__name">${ user.name }</p>
                    <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${ user.id }" data-user-name="${ user.name }">追加</a>
                  </div>`
    return html;
  }

  function appendUserList(id, name) {
     var html = `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-8'>
                    <input name='group[user_ids][]' type='hidden' value=${ id }>
                    <p class='chat-group-user__name'>${ name }</p>
                    <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn' data-user-id="${ id }">削除</a>
                </div>`
    return html;
  }

  $("#user-search-field.chat-group-form__input").on("keyup", function() {
    var input = $("#user-search-field.chat-group-form__input").val();$()
    $(".js-remove").remove();
    if (input !== '') {
      $.ajax({
        type: 'GET',
        url: '/users',
        data: { keyword: input },
        dataType: 'json'
      })
      .done(function(users) {
        $("#user-search-field.chat-group-form__input").empty();
        if (users.length !== 0) {
        $(".js-remove").remove();
          users.forEach(function(user) {
            var html = appendUser(user);
              $("#user-search-result").append(html);
          });
        } else {
          alert('Not Done Yet. Please check!')
        }
      })
      .fail(function(data){
        alert("err");
      })
    }
  });
  $(document).on('click',".chat-group-user__btn--add", function() {
    var id = $(this).attr('data-user-id');
    var name = $(this).attr('data-user-name');
    var html = appendUserList(id, name);
    $('#chat-group-users').append(html);
    $(this).parents('.chat-group-user').remove();
  });

    $(document).on('click',".chat-group-user__btn--remove", function() {
    $(this).parents('.chat-group-user').remove();
  });
});

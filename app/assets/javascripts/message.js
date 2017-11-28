$(function(){
  function buildHTML(message){
    var message_list = $(".RightContents__Bottom");
    var put_image = `
    <div class = RightContents__Bottom--word>
      <span class = RightContents__Bottom--word--name>
        ${ message.username }
      </span>
      <span class = RightContents__Bottom--word--time>
        ${ message.created_at }
      </span>
      <span class = RightContents__Bottom--word--pic>
        image_tag ${ message.image }, alt:"picture", height: "50", width: "50"
      </span>
    </div>`
    var put_text = `
    <div class = RightContents__Bottom--word>
      <span class = RightContents__Bottom--word--name>
        ${ message.username }
      </span>
      <span class = RightContents__Bottom--word--time>
        ${ message.created_at }
      </span>
      <span class = RightContents__Bottom--word--text>
        ${ message.body }
      </span>
    </div>`
      if ( message.body === null ) {
        message_list.append(put_image)
      };
      if ( message.image.url === null ) {
        message_list.append(put_text);
      }
    }

    function flash() {
      var html = '<div class="flash flash__notice"><span class = sentence>メッセージを送信しました</span></div>'
      $('body').append(html);
      $('.flash').fadeIn(500).fadeOut(5000);
      setTimeout(function(){
       $('.flash').remove();
      },2500);
    };

    $('#new_message').on('submit', function(e){
      e.preventDefault();
      var formData = new FormData(this);
      var url = $(this).attr('action')
      $('.RightContents__Bottom--Mbox--Send').removeAttr('data-disable-with');
        $.ajax({
          url: url,
          type: "POST",
          data: formData,
          dataType: 'json',
          processData: false,
          contentType: false
        })
        .done(function(data){
          buildHTML(data);
          $('.RightContents__Bottom--Mbox--inputword', '.RightContents__Bottom--Mbox--Awesome').val('');
          flash();
          $('.RightContents__Bottom--Mbox--Send').on('click', function() {
          $('.RightContents__Bottom').animate({scrollTop: 10000000 }, 'fast');
         });
       })
       .fail(function() {
         alert('メッセージを送信できません');
      });
      return false;
  });
});

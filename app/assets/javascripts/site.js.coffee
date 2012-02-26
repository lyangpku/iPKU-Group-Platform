# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  uid = $('input[name=uid]').val()

  # juggernaut channel subscribe
  jug = new Juggernaut
  jug.subscribe "channel-#{uid}", (msg) ->
    if msg.type == 'rec_msg'
      if($("chat-box-#{msg.sid}").size() == 0)
        $('chat-boxes').prepend("<div id='chat-box-#{msg.sid}'></div>")
      $("chat-box-#{msg.sid}").prepend(msg.content)

  # backend ajax form submit
  $('.admin.app-form form select').change ->
    $(this).parent('form').submit()

  # site index banners show
  $('.pics').cycle({
    fx: "fade",
    pager: '.pager',
    pagerAnchorBuilder: (idx, slide) ->
      "<li><a href='#'><img src='" + slide.src + "' width='150' /></a></li>"
  })

  # validate search box - no blank
  $('.search form').submit ->
    $('.search input[type=text]').val().length > 0
  
  # newsfeeds pictures zoom
  $('.newsfeeds').on('click', '.center img', ->
    $(this).parents('.center').toggleClass("small"))

  $('.show-category .category').children('a').css('color','rgb(226,136,26)');

  $('.submit-btn').click ->
    $('form').submit()

  $(".groups form li label").click ->
    id = $(this).attr('for')
    $(".groups form li").hide()
    $(".groups form .first").show()
    $("#"+id).parent('li').show();

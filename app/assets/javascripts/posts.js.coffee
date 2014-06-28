postComment = (url, data, error) ->
  $.ajax
    type: 'POST'
    url: url
    data: data
    success: postSuccess
    error: error

postSuccess = (data) ->
  $('#comment-list').append $("<li>#{data['comment_text']}</li>")

signInAndRePost = (url, data) ->
  $('#dismiss-sign-in-dialog').one 'click', (e) ->
    $('#submit-login').off()
    $('#dismiss-sign-in-dialog').off()
    $('#sign-in-dialog-container').hide()

  $('#submit-login').one 'click', (e) ->
    $.get '/sign_in', ->
      postComment url, data
      $('#submit-login').off()
      $('#dismiss-sign-in-dialog').off()
      $('#sign-in-dialog-container').hide()

  $('#sign-in-dialog-container').show()

ready = ->
  $('#submit-comment').on 'click', (e) ->
    url = $(e.target).data('url')
    comment = $('#new-comment').val()
    data =
      text: comment
      authenticity_token: $('meta[name=csrf-token]').attr('content')

    postComment url, data, (jqXHR, textStatus, errorThrown) ->
      signInAndRePost url, data

$(document).ready ready
$(document).on 'page:load', ready # for TurboLinks

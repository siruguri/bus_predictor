custom_functions = ->
  toggle_onoff = ($button) ->
    ret = ''
    if $button.hasClass('off')
      $button.addClass 'on'
      $button.text 'on'
      $button.removeClass 'off'
    else
      $button.addClass 'off'
      $button.text 'off'
      $button.removeClass 'on'
    
  $('.btn.change-reg-status').click (evt) ->
    curr_state = $(evt.target).data('state')
    reg_id = $(evt.target).data('reg-id')
    $.post('/ajax_api',
        payload: 'registrations/toggle_state/' + reg_id + '/' + curr_state
      (d, s, x) ->
        $(evt.target).data('state', d.data.new_state)
        toggle_onoff $(evt.target)
    )
      
    
$(document).on('turbolinks:load', custom_functions)

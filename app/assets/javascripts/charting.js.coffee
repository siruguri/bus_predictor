create_chart = (d) ->
  chart = new CanvasJS.Chart("chartContainer",
  	theme: "theme2" #theme1
  	title:
      text: "Arrival Scores"
    animationEnabled: false   # change to true
  	data: [{type: 'column', dataPoints: d}]
  )
  chart.render()
  
render_chart = () ->
  url = '/score_arrivals/generate.json'
  if $('#route_id').data('val') != null
    url += '?route_id=' + $('#route_id').data('val')
    
  $.get(url,
    (d, s, x) ->
      create_chart d
  )
      
$(document).on('turbolinks:load', render_chart)

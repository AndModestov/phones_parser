$ ->
  App.cable.subscriptions.create('PhonesChannel', {
    connected: ->
      @perform 'follow'
    ,

    received: (data) ->
      $("#phones-data-#{data.channel}").html data.message
  })

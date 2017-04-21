App.cable.subscriptions.create "CommandsChannel",
  received: (data) ->
    $('.node-log').append data["line"]
    $('.node-log').append "<br>"

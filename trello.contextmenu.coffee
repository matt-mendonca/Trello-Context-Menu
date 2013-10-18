$ = jQuery

window.trelloJS = window.trelloJS or {}

trelloJS.contextMenu = do ->
    cardOperationClick = (card_operation) ->
        card_operation.click()
    
        ###
        !!!!!!!Hacky code!!!!!!!!!
        Prevent user from having to double click open another menu
        ###
        card_operation.click()  if $(".pop-over").css("display") is "none"

    listClick = (event) ->
        card_operation = $(this).find(".js-open-list-menu")
        cardOperationClick(card_operation)
        event.preventDefault()
        return

    cardClick = (event) ->
        ###
        Sometimes .card-operation is a sibling of .list-card-details, sometimes it is a child.
        Move up one level in the DOM (.parent()), then find .card-operation.
        This will match siblings and childen of .list-card-details
        ###
        card_operation = $(this).parent(".list-card").find(".card-operation")
        cardOperationClick(card_operation)
        false

    {
        listClick: listClick
        cardClick: cardClick
    }

$(document).ready ->
    $(".list").on "contextmenu", trelloJS.contextMenu.listClick
    $(".list-card-details").on "contextmenu", trelloJS.contextMenu.cardClick
#
# Snippet from http://refills.bourbon.io/components/
#
# Edited : JQuery replace by '$' and added a $document.ready
#
###############################################################

$(document).ready ->
  $('.js-accordion-trigger').bind 'click', (e) ->
    $(this).parent().find('.more-infos').slideToggle 'fast'
    $(this).parent().toggleClass 'is-expanded'
    e.preventDefault()
    return

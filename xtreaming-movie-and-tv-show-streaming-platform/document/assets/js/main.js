/**
 * Copyright 2022
 * 
 * @author codelug
 * @version 1.0
 */
(function($) {
    'use strict'; 
    // Nav  
    $(document).on('click', '[data-nav] a', function() {
        var $this = $(this),
            $active, $li, $li_li;

        $li = $this.parent();
        $li_li = $li.parents('li');

        $active = $li.closest("[data-nav]").find('.active');

        $li_li.addClass('active');
        ($this.next().is('ul') && $li.toggleClass('active')) || $li.addClass('active');

        $active.not($li_li).not($li).removeClass('active');
 
        if ($this.attr('href') && $this.attr('href') != '#') {
            $(document).trigger('Nav:changed');
        }
        var target = $(this.hash);
        target = target.length ? target : $('[name=' + this.hash.substr(1) +']');
        if (target.length) {
            $('html,body').animate({
                scrollTop: target.offset().top
            }, 100);
            return false;
        }
    });
     
})(jQuery);
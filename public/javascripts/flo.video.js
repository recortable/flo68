(function($) {

    $.fn.vimeo = function(settings) {
        var config = {
            height: 319,
            width: 426,
            show_title: 1,
            allow_full_screen : true,
            show_byline: 0,
            show_portrait: 0,
            fullscreen: 0
        };

        if (settings) $.extend(config, settings);

        config.url = config.url.trim();
        if (config.url != null && config.url.length > 0) {
            var last_bar = config.url.lastIndexOf('/');
            config.vimeo_id = config.url.substring(last_bar + 1);
        }

        var code = '<object width="' + config.width + '" height="'+ config.height + '">';
        code += '<param name="allowfullscreen" value="' + config.allow_full_screen +  '" />';
        code += '<param name="allowscriptaccess" value="always" /><param name="movie" value="http://vimeo.com/moogaloop.swf?clip_id=' + config.vimeo_id + '&amp;'
        code += 'server=vimeo.com&amp;show_title=1&amp;show_byline=1&amp;show_portrait=0&amp;color=00adef&amp;fullscreen=1" />'
        code += '<embed src="http://vimeo.com/moogaloop.swf?clip_id='+ config.vimeo_id + '&amp;server=vimeo.com&amp;show_title=' + config.show_title;
        code += '&amp;show_byline='+ config.show_byline + '&amp;show_portrait=0&amp;color=00adef&amp;fullscreen=1" type="application/x-shockwave-flash" allowfullscreen="' + config.allow_full_screen + '" allowscriptaccess="always"'
        code += 'width="' + config.width + '" height="' + config.height + '"></embed></object>'

        console.log("id", config.vimeo_id);

        if (config.vimeo_id != undefined) {
            this.each(function() {
                $(this).html(code);
            });
        }


        return this;

    };

})(jQuery);
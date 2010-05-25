(function($) {

    $.fn.slide = function(list, settings) {
        var config = {
            height: 550,
            width: 430,
        };

        if (settings) $.extend(config, settings);

        this.each(function() {
            var self = $(this);
            var container = $("<div class='slide_container'>");
            container.css('overflow', 'hidden');
            container.css('width', config.width);
            container.css('height', config.height);
            var images = [];
            $.each(list, function() {
                var image = $('<img src="' + this.url + '" width="' + this.width +
                    '" height="'+ this.height + '" alt="' + this.title + '" style="display: none" />');
                image.css('margin-left', (config.width - this.width) / 2);
                image.css('margin-top', (config.height - this.height) / 2);
                images.push(image);
                container.append(image);
            });
            self.append(container);

            var current_image = 1;
            var image_count = list.length;
            var controls = $("<div class='slide_controls'>");

            $("<a>&lt;</a>").click(function() {
                if (current_image > 1) {
                    images[current_image - 1].fadeOut(100, function() {
                        current_image--;
                        self.find('.current_image').html(current_image);
                        images[current_image - 1].show();
                    });
                }
                return false;
            }).css('cursor', 'pointer').appendTo(controls);
            $("&nbsp; <span class='current_image'>1</span> de <span>" + image_count + "</span> &nbsp;").appendTo(controls);
            $("<a>&gt;</a>").click(function() {
                if (current_image < image_count) {
                    images[current_image - 1].fadeOut(100, function() {
                        current_image++;
                        self.find('.current_image').html(current_image);
                        images[current_image - 1].show();
                    });
                }
                return false;
            }).css('cursor', 'pointer').appendTo(controls);
            self.append(controls);

            images[current_image - 1].fadeIn();
        });
        return this;
    }

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
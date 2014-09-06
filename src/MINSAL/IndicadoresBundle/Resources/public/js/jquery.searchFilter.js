//Tomando de http://weblog.west-wind.com/posts/2014/May/12/Filtering-List-Data-with-a-jQuerysearchFilter-Plugin
(function($, undefined) {
    $.expr[":"].containsNoCase = function(el, i, m) {
        var search = m[3];
        if (!search) return false;
        return new RegExp(search, "i").test($(el).text());
    };

    $.fn.searchFilter = function(options) {
        var opt = $.extend({
            // target selector
            targetSelector: "",
            // number of characters before search is applied
            charCount: 1
        }, options);

        return this.each(function() {
            var $el = $(this);
            $el.keyup(function() {
                var search = $(this).val();

                var $target = $(opt.targetSelector);
                $target.show();

                if (search && search.length >= opt.charCount){
                    $target.not(":containsNoCase(" + search + ")").hide();
                    $('#accordion2 .collapse').collapse('show');
                }
                else
                    $('#accordion2 .collapse').collapse('hide');
            });
        });
    };
})(jQuery);
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require masonry/jquery.masonry
//= require masonry/jquery.event-drag
//= require masonry/jquery.imagesloaded.min
//= require masonry/jquery.infinitescroll.min
//= require masonry/modernizr-transitions
//= require turbolinks
//= require bootstrap-sprockets
//= require owl.carousel
//= require bootstrap-datepicker
//= require dj
Turbolinks.enableProgressBar();


$(document).on('page:change', function(){
  $(function() {
    return $('#masonry-container').imagesLoaded(function() {
      return $('#masonry-container').masonry({
        itemSelector: '.box',
        isFitWidth: true,
        columnWidth: 10,
        gutterWidth: 10,
        columnWidth: function(containerWidth) {
          if ($(window).width() > 1200) {
            return containerWidth / 6;
          } else if ($(window).width() > 1000 && $(window).width() <= 1200) {
            return containerWidth / 5;
          } else if ($(window).width() > 800 && $(window).width() <= 1000) {
            return containerWidth / 4;
          } else if ($(window).width() > 400 && $(window).width() <= 800) {
            return containerWidth / 3;
          } else {
            return containerWidth / 1;
          }
        }
      });
    });
  });

});
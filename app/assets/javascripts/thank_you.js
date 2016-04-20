$(document).ready(function(){
  $('.movie-form').on('submit', function(event){
    event.preventDefault();
    $.ajax({
      url: "/movies",
      method: 'POST',
      data: {title: $('#movie_title').val()}
    }).done(function(){
      console.log('ajaxed')
      $('#movie_title').val("");
      $('.hidden').removeClass('hidden');
    }).fail(function(){
      console.log("Error creating movie")
      $('.hidden2').removeClass('hidden2')
    });
  })
})

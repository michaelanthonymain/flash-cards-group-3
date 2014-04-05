$(document).ready(function() {

  $(function() {
    $('.error').hide();
    $(".button").click(function() {

        $('.error').hide();
        var name = $("input#name").val();
          if (name == "") {
          $("label#name_error").show();
          $("input#name").focus();
          return false;
        }

          var password = $("input#password").val();
          if (password == "") {
          $("label#password_error").show();
          $("input#password").focus();
          return false;
        }

    });
  });


});



  // $("#login-form").on('submit', function(event) {
  //   event.preventDefault();
  //   console.log("This is working.")
  //   // $.post({ url: "/login",
  //   //   data: {value: diceRoll},
  //   //   success: function(response) {
  //   //     var dieImage = "<img src='/" + response + ".png'/>";
  //   //     $("#die").html(dieImage);
  //   //   }
  //   // });

  // });
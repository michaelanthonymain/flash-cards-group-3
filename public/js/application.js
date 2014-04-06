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

        var deck_name = $("input#deck_name").val();
          if (deck_name == "") {
          $("label#deck_name_error").show();
          $("input#deck_name").focus();
          return false;
        }

        var question = $("input#question").val();
          if (question == "") {
          $("label#question_error").show();
          $("input#question").focus();
          return false;
        }

        var answer = $("input#answer").val();
          if (answer == "") {
          $("label#answer_error").show();
          $("input#answer").focus();
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
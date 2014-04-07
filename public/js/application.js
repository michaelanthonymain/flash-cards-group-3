$(document).ready(function() {

// Form validation logic for login, register, and deck creation
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


    // Authentication AJAX for Login and Registration pages
    $("#login-form").on('submit', function(event) {
      var formData = $("form#login-form").serialize();
      event.preventDefault();
        $.post("/login", formData, function(response) {
            if(response === "error") {
              $("label#login_input_error").show();
              $("input#name").focus();
              return false;
            }
            else if(response ==="no error") {
              location.href = "/usr"
            }
        });
    });

     $("#registration-form").on('submit', function(event) {
      var formData = $("form#registration-form").serialize();
      event.preventDefault();
        $.post("/register", formData, function(response) {
            if(response === "error") {
              $("label#registration_input_error").show();
              $("input#name").focus();
              return false;
            }
            else if(response ==="no error") {
              location.href = "/usr"
            }
        });
    });


     // Tabbed interface functionality for stats page
    $( "#tab1").show();

      $(".tabs li").on("click", function(event) {
        $(".tabs li").removeClass("active");
        $(".tab").hide();
        $(this).addClass("active");
        var activeTab = $(this).children("a").attr("href");
        $(activeTab).show();
      });

      //AJAX for statistics
      $("#stats-by-round").on('submit', function(event) {
        var formData = $("form#stats-by-round").serialize();
        event.preventDefault();
          $.post("/usr/stats/round", formData, function(response) {
                  $("#score-for-round").html("<p> You managed to get " + response + "% correct that round. <br> Yikes. Get your shit together.</p>")
          });
      });

});


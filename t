
$('#estate-contact-form').on('submit', function(e) {
        alert("Hi");
    e.preventDefault();
    // Remove any existing error messages
    $('.error').remove();
    $.ajax({
        url: "{% url 'estate:add-estate-contact' %}",
        method: 'POST',
        data: $(this).serialize(),
        success: function(response) {
            if (response.success) {
                swal({
                    title: "Success!",
                    text: response.message,
                    icon: "success",
                    buttons: false,
                    timer: 2000,
                // }).then(function() {
                //     $('#exampleModal').modal('hide');
                //     let url = `{% url 'cmu_users:profile_list' usertype_slug="cmu-users" %}`;
                //     // Reload the user list
                //     $.ajax({
                //         url: url,
                //         method: 'GET',
                //         success: function(response) {
                //             $('#user-list-container').html(response.html);
                //         }
                //     });
                });
            } else {
                // Display errors if form is invalid
                if (response.errors) {
                    console.log("emailErrors", response.errors);

                    // // Display the email error message in the #email-errors element
                    // // $('#email-errors').html(generateErrorHTML(response.errors));

                    // displayFieldErrors(response.errors);

                    // Display a modal with the errors
                    Swal.fire({
                        title: "",
                        text: "Please check the highlighted fields for errors.",
                        icon: "error",
                    });
                } else {
                    Swal.fire({
                        title: "",
                        text: "Failed to create user",
                        icon: "error",
                        
                    });
                }
            }
        }
    });
});

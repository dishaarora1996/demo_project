<script>
    function submitForm(formId) {
        const form = $(`#${formId}`);
        const actionUrl = form.attr('action');
        const formData = new FormData(form[0]);  // FormData to handle form fields
        
        $.ajax({
            url: actionUrl,  // Form action URL
            method: 'POST',
            data: formData,  // Form data
            processData: false,  // Required for FormData
            contentType: false,  // Prevent jQuery from setting content-type header
            headers: {
                'X-CSRFToken': '{{ csrf_token }}',  // CSRF token for Django
            },
            success: function(response) {
                if (response.success) {
                    // Handle success case, like showing success message
                    console.log("Form submitted successfully!");
                    // You can also add a success message or reload data
                    swal({
                        title: "Success!",
                        text: "Form submitted successfully!",
                        icon: "success",
                        buttons: false,
                        timer: 2000,
                    });
                } else {
                    // Handle validation errors and inject them into form
                    // Assume response.errors contains the field-specific errors
                    console.log(response.errors);
                    displayFieldErrors(response.errors);
                }
            },
            error: function(xhr, status, error) {
                // Handle any server errors or network failures
                console.error('Error:', error);
                swal({
                    title: "Error!",
                    text: "An unexpected error occurred. Please try again.",
                    icon: "error",
                });
            }
        });
    }

function displayFieldErrors(formId, errors) {
    for (const [field, messages] of Object.entries(errors)) {
        // Assuming each form field has a corresponding error div
        $(`#${formId} #${field}-error`).html(messages.join('<br>')).addClass('text-danger');
    }
}

 displayFieldErrors('form2', response.errors);
line 521

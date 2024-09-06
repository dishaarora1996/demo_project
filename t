
def add_estate(request):
    estate_id = None
    if request.method == 'POST':
        print("post")
        estate_garden_form = EstateGardenForm(request.POST)
        if estate_garden_form.is_valid():
            estate_garden = estate_garden_form.save(commit=False)
            estate_garden.cmu_user = request.user.cmu_user
            estate_garden.save()
            estate_id = estate_garden.id
            return JsonResponse({'success': True, 'estate_id': estate_id})
        else:
            return JsonResponse({'success': False}, 'errors: form.errors')
        print("POST estate_garden", estate_garden_form)

    else:
        estate_garden_form = EstateGardenForm()
        print("GET estate_garden", estate_garden_form)

    
    estate_garden_contact_form = EstateGardenContactForm()    
    context = {
        "estate_garden_form": estate_garden_form,
        "estate_garden_contact_form": estate_garden_contact_form,

        "estate_id": estate_id

    }
    
    return CommonMixin.render(request, 'estate/add-estate-garden.html', context)

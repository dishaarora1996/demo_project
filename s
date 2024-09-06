<div class="tab-content" id="pills-tabContent">
            <div class="tab-pane fade show active" id="pills-1" role="tabpanel"
                aria-labelledby="pills-1-tab" tabindex="0">

                <!-- ==================form-inner-content garden-info=============== -->
                <div class="form-innr-cntnt">
                    <form action= "{% url 'estate:add-estate' %}" method="POST">
                        {% csrf_token %}
                        <div class="ppc-form">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="form-group mb-3">
                                        <label>Name of Tea Estate <span>*</span> </label>
                                        {{ estate_garden_form.name }}
                                        {{ estate_garden_form.name.errors }}
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group mb-3">
                                        <label>Full Address <span>*</span> </label>
                                        {{ estate_garden_form.full_address }}
                                        {{ estate_garden_form.full_address.errors }}
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <div class="form-group mb-3">
                                        <label>State <span>*</span></label>
                                        
                                        {{ estate_garden_form.state }}
                                        {{ estate_garden_form.state.errors }}
                                        
                                    </div>
                                </div>


                                <div class="col-lg-4">
                                    <div class="form-group mb-3">
                                        <label>District <span>*</span></label>
                                        {{ estate_garden_form.district }}
                                        {{ estate_garden_form.district.errors }}
                                        
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <div class="form-group mb-3">
                                        <label>Area / Tehsil / Block <span>*</span></label>
                                        {{ estate_garden_form.area_tehsil_block }}
                                        {{ estate_garden_form.area_tehsil_block.errors }}
                                        
                                    </div>
                                </div>

                                <div class="form-sbmt">
                                    <button type="reset" class="btn reset"><img
                                            src="{% static 'assets/images/reset.png' %}" alt="">RESET</button>
                                    <button type="submit" class="btn save"><img
                                            src="{% static 'assets/images/save.png' %}" alt="">SAVE</button>
                                    <!-- <button type="submit" class="btn finalize"><img
                                            src="{% static 'assets/images/check.png' %}" alt="">Finalize</button> -->

                                </div>



                            </div>
                        </div>
                    </form>
                </div>

            </div>
            <div class="tab-pane fade" id="pills-2" role="tabpanel" aria-labelledby="pills-2-tab"
                tabindex="0">
            
                 <!-- ==================form-inner-content contact-info=============== -->
                 <div class="form-innr-cntnt">
                    <form action= "{% url 'estate:add-estate-contact' %}" method="POST">
                        {% csrf_token %}
                        
                        <input type="hidden" value="{{estate_id}}">
                        <div class="ppc-form">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group mb-3">
                                        <label>Managers’ Name  <span>*</span> </label>
                                        {{ estate_garden_contact_form.managers_name }}
                                        {{ estate_garden_contact_form.managers_name.errors }}
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group mb-3">
                                        <label>Phone No. <span>*</span> </label>
                                        {{ estate_garden_contact_form.rajdip_nandi }}
                                        {{ estate_garden_contact_form.rajdip_nandi.errors }}
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group mb-3">
                                        <label>Rajdip Nandi<span>*</span> </label>
                                        {{ estate_garden_contact_form.phone_no }}
                                        {{ estate_garden_contact_form.phone_no.errors }}
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group mb-3">
                                        <label>SPOC Phone No.<span>*</span> </label>
                                        {{ estate_garden_contact_form.spoc_phone_no }}
                                        {{ estate_garden_contact_form.spoc_phone_no.errors }}
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group mb-3">
                                        <label>Official Email  <span>*</span> </label>
                                        {{ estate_garden_contact_form.official_email }}
                                        {{ estate_garden_contact_form.official_email.errors }}
                                    </div>
                                </div>

                                <div class="col-lg-6">
                                    <div class="form-group mb-3">
                                        <label>Alternate Email  </label>
                                        {{ estate_garden_contact_form.alternate_email }}
                                        {{ estate_garden_contact_form.alternate_email.errors }}
                                    </div>
                                </div>



                                <div class="form-sbmt">
                                    <button type="submit" class="btn reset"><img
                                            src="{% static 'assets/images/reset.png' %}" alt="">RESET</button>
                                    <button type="submit" class="btn save"><img
                                            src="{% static 'assets/images/save-here.png' %}" alt="">SAVE</button>
                                    <!-- <button type="submit" class="btn finalize"><img
                                            src="{% static 'assets/images/check.png' %}" alt="">Finalize</button> -->

                                </div>



                            </div>
                        </div>
                    </form>
                </div>   
            
            
            

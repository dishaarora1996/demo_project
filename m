from django.db import models

class Estate(models.Model):
    name = models.CharField("Name of Tea Estate", max_length=255)
    full_address = models.TextField("Full Address")
    state = models.CharField("State", max_length=100)
    district = models.CharField("District", max_length=100)
    area_tehsil_block = models.CharField("Area/Tehsil/Block", max_length=100)
    
    total_garden_area = models.DecimalField("Total Garden Area (in ha)", max_digits=10, decimal_places=2)
    total_area_under_tea = models.DecimalField("Total area under Tea (in ha)", max_digits=10, decimal_places=2)
    total_area_under_social_forestry = models.DecimalField("Total area under social forestry (in ha)", max_digits=10, decimal_places=2, null=True, blank=True)
    other_area = models.DecimalField("Other Area", max_digits=10, decimal_places=2)
    
    has_regen_practices = models.BooleanField("Is there any ReGen practices going on?", default=False)

    def __str__(self):
        return self.name

class Contact(models.Model):
    estate = models.OneToOneField(Estate, on_delete=models.CASCADE, related_name='contact')
    managers_name = models.CharField("Managers' Name", max_length=255)
    rajdip_nandi = models.CharField("Rajdip Nandi", max_length=255)
    phone_no = models.CharField("Phone No.", max_length=20)
    spoc_phone_no = models.CharField("SPOC Phone No.", max_length=20)
    official_email = models.EmailField("Official Email")
    alternate_email = models.EmailField("Alternate Email", blank=True, null=True)

class TeaProduction(models.Model):
    estate = models.OneToOneField(Estate, on_delete=models.CASCADE, related_name='tea_production')
    green_leaf_own = models.DecimalField("Total Green Leaf (Own) (in Kg)", max_digits=10, decimal_places=2)
    green_leaf_purchased = models.DecimalField("Total Green Leaf (Purchased / brought leaf) (in Kg)", max_digits=10, decimal_places=2)

class QuarterlyTeaProduction(models.Model):
    QUARTER_CHOICES = [
        (1, '1st Quarter'),
        (2, '2nd Quarter'),
        (3, '3rd Quarter'),
        (4, '4th Quarter'),
    ]
    tea_production = models.ForeignKey(TeaProduction, on_delete=models.CASCADE, related_name='quarterly_production')
    quarter = models.IntegerField(choices=QUARTER_CHOICES)
    year = models.IntegerField("Year")
    own_production = models.DecimalField("Total Made Tea (Own) (in Kg)", max_digits=10, decimal_places=2)
    purchased_production = models.DecimalField("Total Made Tea (Purchased / brought leaf) (in Kg)", max_digits=10, decimal_places=2)

    class Meta:
        unique_together = ('tea_production', 'quarter', 'year')

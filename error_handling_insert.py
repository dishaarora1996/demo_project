from django.core.exceptions import ObjectDoesNotExist
from django.db import IntegrityError, transaction
from django.utils import timezone
from random import choice

def handle(self, *args, **kwargs):
    bulk_create_list = []

    for i in range(10000):
        try:
            # Fetch or assign foreign key objects
            organization = Organization.objects.get(id=ORGANIZATION_ID)
            requested_by = PmsUser.objects.get(id=REQUESTED_BY_ID)
            site = SiteMaster.objects.get(id=SITE_ID)
            store = StoreMaster.objects.get(id=STORE_ID)
            department = Department.objects.get(id=DEPARTMENT_ID)
            project = ProjectMaster.objects.get(id=PROJECT_ID)

            # Create the material request object
            material_request = MaterialRequestMaster(
                organization=organization,
                requested_by=requested_by,
                site=site,
                store=store,
                department=department,
                project=project,
                request_code=f"REQ-{i+1}",
                date=timezone.now().date(),
                time=timezone.now(),
                is_fulfilled=False,
                remarks=f"Auto-generated request {i+1}",
                stock_type=choice(STOCK_TYPE),
                status=choice(APPROVE_STATUS),
            )
            bulk_create_list.append(material_request)

        except ObjectDoesNotExist as e:
            # Handle case where foreign key object doesn't exist
            print(f"Skipping record {i+1}: {e}")
            continue  # Skip to the next record

        except IntegrityError as e:
            # Handle integrity errors (e.g., unique constraint violations)
            print(f"Failed to create record {i+1}: {e}")
            continue

    # After catching individual errors, insert valid records in bulk
    try:
        with transaction.atomic():
            MaterialRequestMaster.objects.bulk_create(bulk_create_list, batch_size=1000)
        print("All valid records inserted successfully!")
    
    except IntegrityError as e:
        print(f"Error during bulk insert: {e}")

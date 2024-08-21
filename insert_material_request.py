from procurement.models import MaterialRequestMaster
from django.utils import timezone
from random import choice

# Define sample data for required fields
APPROVE_STATUS = ['pending', 'checked', 'cancelled', 'close', 'approved', 'rejected']
STOCK_TYPE = ['material', 'machinery']
ORGANIZATION_ID = 1  # Use existing organization ID from your database
REQUESTED_BY_ID = 1  # Use existing user ID from your database
SITE_ID = 1  # Use existing site ID
STORE_ID = 1  # Use existing store ID
DEPARTMENT_ID = 1  # Use existing department ID
PROJECT_ID = 1  # Use existing project ID
FINANCIAL_YEAR_ID = 1  # Use existing financial year ID

# Create the list of objects to be bulk created
bulk_create_list = []

for i in range(10000):
    material_request = MaterialRequestMaster(
        organization_id=ORGANIZATION_ID,
        requested_by_id=REQUESTED_BY_ID,
        site_id=SITE_ID,
        store_id=STORE_ID,
        department_id=DEPARTMENT_ID,
        project_id=PROJECT_ID,
        request_code=f"REQ-{i+1}",
        date=timezone.now().date(),
        time=timezone.now(),
        is_fulfilled=False,
        remarks=f"Auto-generated request {i+1}",
        stock_type=choice(STOCK_TYPE),
        status=choice(APPROVE_STATUS),
        checked_remarks="Checked remark",
        approved_remarks="Approved remark",
        rejected_remarks="Rejected remark",
        sanctioned_remarks="Sanctioned remark",
        financialyear_id=FINANCIAL_YEAR_ID,
        checked_by_id=REQUESTED_BY_ID,
        cancelled_by_id=REQUESTED_BY_ID,
        close_by_id=REQUESTED_BY_ID,
        approved_by_id=REQUESTED_BY_ID,
        rejected_by_id=REQUESTED_BY_ID,
        checked_by_date=timezone.now(),
        cancelled_by_date=timezone.now(),
        close_by_date=timezone.now(),
        approved_by_date=timezone.now(),
        rejected_by_date=timezone.now(),
    )
    bulk_create_list.append(material_request)

# Insert all objects in bulk with a specified batch size
MaterialRequestMaster.objects.bulk_create(bulk_create_list, batch_size=1000)

print("Inserted 10,000 records successfully!")

from django.core.management.base import BaseCommand
from procurement.models import MaterialRequestItems
import random
from datetime import datetime

class Command(BaseCommand):
    help = 'Insert 10000 records into MaterialRequestItems table'

    def handle(self, *args, **kwargs):
        priorities = ['low', 'medium', 'high']
        statuses = ['pending', 'checked', 'cancelled', 'close', 'approved', 'rejected']
        
        # Creating 10000 records
        bulk_data = []
        for _ in range(10000):
            record = MaterialRequestItems(
                organization_id=random.randint(1, 100),  # Assuming random organization IDs
                material_request_id=random.randint(1, 100),  # Assuming random material request IDs
                requested_material_id=random.randint(1, 100),  # Assuming random material IDs
                requested_machine_id=random.randint(1, 100),  # Assuming random machine IDs
                wbs_material_id=random.randint(1, 100),  # Assuming random WBS material IDs
                wbs_indirect_cost_id=random.randint(1, 100),  # Assuming random WBS indirect cost IDs
                wbs_plantmachinery_id=random.randint(1, 100),  # Assuming random plant machinery IDs
                uom_id=random.randint(1, 100),  # Assuming random UOM IDs
                size_part_grade='Grade A',
                quantity_unit=random.uniform(1.0, 100.0),
                weight_unit=random.uniform(1.0, 100.0),
                requested_for_type='Type A',
                requested_for='For A',
                department='Department A',
                charge_type='Type A',
                is_returnable=bool(random.getrandbits(1)),
                priority=random.choice(priorities),
                due_date=datetime.now(),
                is_fulfilled=bool(random.getrandbits(1)),
                checked_remarks='Checked remark',
                approved_remarks='Approved remark',
                rejected_remarks='Rejected remark',
                rate=random.uniform(1.0, 100.0),
                brand='Brand A',
                specification='Spec A',
                budgeted_qty=random.uniform(1.0, 100.0),
                total_received_update=random.uniform(1.0, 100.0),
                stock_on_site=random.uniform(1.0, 100.0),
                sanctioned_qty=random.uniform(1.0, 100.0),
                sanctioned_remarks='Sanctioned remark',
                approved_status=random.choice(statuses),
                # Add more fields as necessary based on your model
            )
            bulk_data.append(record)
        
        MaterialRequestItems.objects.bulk_create(bulk_data)
        self.stdout.write(self.style.SUCCESS('Successfully inserted 10,000 records.'))

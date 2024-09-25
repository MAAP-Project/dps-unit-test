from datetime import datetime
import sys
import os
import time

date = datetime.now().isoformat()
print(f"Started running at {date}")
# Expecting the job running on the maap-dps-sandbox queue to timeout after 10 mins
for i in range(0,15):
    print(f"Sleeping for 60sec, iteration {i}")
    time.sleep(60)
    
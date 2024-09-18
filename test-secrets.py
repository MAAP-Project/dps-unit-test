from datetime import datetime
import sys
import os
from maap.maap import MAAP
maap = MAAP()

output_dir = sys.argv[1]
secret_name = sys.argv[2]
with open(os.path.join(output_dir, "write-dummy-secret.txt"), 'w') as fw:
    fw.write(secret_name + " value: " + maap.secrets.get_secret(secret_name))
    fw.write(" Output secret value successfully!")

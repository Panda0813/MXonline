"""
WSGI config for MXonline project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/2.0/howto/deployment/wsgi/
"""

import os

from django.core.wsgi import get_wsgi_application
import time
import traceback
import signal
import sys

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "MXonline.settings")

# 处理Apache异常raise RuntimeError("populate() isn't reentrant")\r
try:
    application = get_wsgi_application()
except Exception:
    # Error loading applications
    if 'mod_wsgi' in sys.modules:
        traceback.print_exc()
        os.kill(os.getpid(), signal.SIGINT)
        time.sleep(2.5)

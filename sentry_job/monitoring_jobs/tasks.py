import sentry_sdk

from .celery import app
from sentry_sdk.crons import monitor


# 60 saniyede bir çalışacak Celery task
@app.task()
@monitor(monitor_slug='monitoring-jobs')  # Sentry Cron Monitor slug
def task_one():
    msg = "60 seconds job completed"
    print(msg)
    return msg


# 60 saniyede bir çalışacak Celery task
@app.task()
@monitor(monitor_slug='monitoring-jobs')  # Sentry Cron Monitor slug
def task_two():
    msg = "60 seconds job started"
    print(msg)

    # Burada bilinçli olarak hata fırlatıyoruz
    result = 1 / 0  # ZeroDivisionError

    return f"Result: {result}"

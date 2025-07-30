from .celery import app


@app.task()
def task_one():
    print("10 seconds jub completed")
    return "10 seconds jub completed"


@app.task()
def task_two():
    print("10 seconds jub uncompleted")
    return "10 seconds jub uncompleted"


@app.task()
def task_three():
    print("60 seconds jub completed")
    return "60 seconds jub completed"


@app.task()
def task_four():
    print("60 seconds jub uncompleted")
    return "60 seconds jub uncompleted"
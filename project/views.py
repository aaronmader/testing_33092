import random

from django.http import HttpResponse
from django.views.decorators.cache import cache_page

@cache_page(1)
def index(request):
    return HttpResponse("hello world! {}".format(
        "".join(random.choice("abcdefghijklmnopqrstuvwxyz ") for i in range(10000))
        ))

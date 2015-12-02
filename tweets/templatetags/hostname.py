from django import template

import socket

register = template.Library()

@register.simple_tag
def hostname():
    return socket.gethostname()

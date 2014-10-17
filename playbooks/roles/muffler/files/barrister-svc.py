#!/usr/bin/env python

import sys
import os
import os.path
import logging
import json
import tempfile
from barrister.parser import parse
from bottle import post, request, response, run

#############################

def translate(fname):
    f = open(fname)
    output = ""
    try:
    	output = json.dumps(parse(f, fname))
        response.content_type = 'application/json'
    except:
	output = "Error parsing IDL input: %s\n" % sys.exc_info()[1]
        response.content_type = 'text/plain'
        response.status = 500
    f.close()
    return output

def single_file(idl_txt):
    (f, fname) = tempfile.mkstemp()
    f = os.fdopen(f, "w")
    f.write(idl_txt)
    f.close()
    output = translate(fname)
    os.remove(fname)
    return output

def multi_file(form):
    i = 0
    main_file = None
    to_delete = []
    dir = tempfile.mkdtemp()
    while True:
        fname_key   = "idl.%d.filename" % i
        content_key = "idl.%d.content" % i
        if form.has_key(fname_key) and form.has_key(content_key):
            fname = os.path.join(dir, form[fname_key])
            to_delete.append(fname)
            f = open(fname, "w")
            f.write(form[content_key])
            f.close()
            if not main_file:
                main_file = fname
        else:
            break
        i += 1
    output = translate(main_file)
    for f in to_delete:
        os.remove(f)
    os.rmdir(dir)
    return output

#
@post('/')
def contact():
    # Read the raw POST data 
    f = dict(request.forms)
    if f.has_key("idl.0.filename") and f.has_key("idl.0.content"):
        return multi_file(f)
    else:
        return single_file(request.forms.idl)

if __name__ == '__main__':
    # initialize the Python logger. totally optional.
    logging.basicConfig()

    # Starts the Bottle app
    run(host='localhost', port=7188, quiet=True)

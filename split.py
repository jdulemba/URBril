#! /bin/env python
from argparse import ArgumentParser
import json

parser = ArgumentParser()
parser.add_argument('json', help='posix regex query')
parser.add_argument('run', type=int, help='posix regex query')
args = parser.parse_args()

def dumps(obj, indent = 4, separators = (',', ': '), **kwargs):
    return json.dumps(obj, indent=indent, separators=separators, **kwargs)

def convert(input):
    '''converts json unicode strings into bytecode strings'''
    if isinstance(input, dict):
        return dict([(convert(key), convert(value)) for key, value in input.iteritems()])
    elif isinstance(input, list):
        return [convert(element) for element in input]
    elif isinstance(input, unicode):
        return input.encode('utf-8')
    else:
        return input  

def loads( input, object_hook=convert, **kwargs):
    return json.loads( input, object_hook=object_hook, **kwargs )

jmap = loads(open(args.json).read())
bef = {i:j for i, j in jmap.iteritems() if int(i) <= args.run}
aft = {i:j for i, j in jmap.iteritems() if int(i) > args.run}

with open('before.json', 'w') as out:
   out.write(dumps(bef))

with open('after.json', 'w') as out:
   out.write(dumps(aft))


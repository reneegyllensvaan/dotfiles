#!/usr/bin/env python3
import json
import sys

def flatten(node):
    if isinstance(node, list):
        for n in node:
            for v in flatten(n):
                yield v
    else:
        result = dict()
        flatten_keys = list()
        # Reject special keys, build the core struct for this object
        for k, v in node.items():
            if k.startswith('__flatten'):
                flatten_keys.append(k)
            elif k == '__expand':
                continue
            else:
                result[k] = v
        if flatten_keys or '__expand' in node:
            out = result.copy()
            for flatten_key in flatten_keys:
                for v in flatten(node[flatten_key]):
                    out.update(v)
            if '__expand' in node:
                for v in flatten(node['__expand']):
                    out2 = out.copy()
                    out2.update(v)
                    yield out2
            else:
                yield out
        else:
            yield result


import time
before = time.time()
output = list(flatten(json.loads(sys.stdin.read())['data']))
writeCsv = True
if writeCsv:
    import csv
    if output:
        writer = csv.DictWriter(sys.stdout, list(output[0].keys()))
        writer.writeheader()
        for row in output:
            writer.writerow(row)
else:
    print(json.dumps(output))
print("time = {}".format(time.time() - before))

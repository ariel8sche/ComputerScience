#!/usr/bin/env python3
"""
parse_malloc_output.py

Uso:
  python3 parse_malloc_output.py run_best_noC_s0.txt

Extrae por operación:
 - número de operación
 - tipo (Alloc/Free)
 - dirección devuelta
 - estado de la free list (lista de (addr,sz))
Calcula: max_free_block y num_free_blocks por operación,
y guarda CSV con columnas: op_idx,kind,ret_addr,max_free_block,num_free_blocks
"""

import sys
import re
import csv
from ast import literal_eval

def parse_freelist_line(line):
    # Ejemplo línea: "Free List [ Size 3 ]: [ addr:1000 sz:3 ][ addr:1003 sz:97 ]"
    parts = re.findall(r'\[ addr:(\d+)\s+sz:(\d+)\s*\]', line)
    fl = [(int(a), int(s)) for a,s in parts]
    return fl

def parse_file(fname):
    ops = []
    with open(fname) as f:
        lines = [l.rstrip('\n') for l in f]
    i = 0
    current_op = None
    while i < len(lines):
        L = lines[i].strip()
        # detect alloc line
        m_alloc = re.match(r'ptr\[\d+\] = Alloc\((\d+)\) returned ([-\d]+)', L)
        if m_alloc:
            size = int(m_alloc.group(1))
            ret = int(m_alloc.group(2))
            current_op = {'kind':'alloc','size':size,'ret':ret}
            # next lines may contain "Free List ..." 
            # find next line with "Free List"
            j = i+1
            fl = None
            while j < len(lines) and fl is None:
                if 'Free List' in lines[j]:
                    fl = parse_freelist_line(lines[j])
                j += 1
            current_op['freelist'] = fl if fl is not None else []
            ops.append(current_op)
            i += 1
            continue
        m_free = re.match(r'Free\(ptr\[\d+\]\) returned ([-\d]+)', L)
        if m_free:
            ret = int(m_free.group(1))
            current_op = {'kind':'free','ret':ret}
            j = i+1
            fl = None
            while j < len(lines) and fl is None:
                if 'Free List' in lines[j]:
                    fl = parse_freelist_line(lines[j])
                j += 1
            current_op['freelist'] = fl if fl is not None else []
            ops.append(current_op)
            i += 1
            continue
        i += 1
    return ops

def metrics_from_ops(ops):
    rows = []
    for idx,op in enumerate(ops):
        fl = op.get('freelist',[])
        max_free = max([s for (a,s) in fl]) if fl else 0
        num_free = len(fl)
        rows.append({
            'op_idx': idx+1,
            'kind': op['kind'],
            'ret': op.get('ret', -1),
            'max_free': max_free,
            'num_free': num_free
        })
    return rows

def main():
    if len(sys.argv) < 2:
        print("Uso: parse_malloc_output.py <file1> [<file2> ...]")
        sys.exit(1)
    outcsv = 'parsed_metrics.csv'
    writer = None
    for fname in sys.argv[1:]:
        ops = parse_file(fname)
        rows = metrics_from_ops(ops)
        # write CSV with prefix file name
        base = fname.replace('.txt','')
        csvname = base + '.metrics.csv'
        with open(csvname,'w',newline='') as cf:
            fieldnames = ['op_idx','kind','ret','max_free','num_free']
            w = csv.DictWriter(cf, fieldnames=fieldnames)
            w.writeheader()
            for r in rows:
                w.writerow(r)
        print("Escribí", csvname)
    print("Terminado.")

if __name__ == '__main__':
    main()

#!/gpfs01/astro/packages/anaconda/default/bin/python
import numpy as np, argparse, healpy
from enlib import enmap
#import enmap
parser = argparse.ArgumentParser()
parser.add_argument("ifile")
parser.add_argument("ofile")
parser.add_argument("-d", "--downgrade", type=int, default=1)
parser.add_argument("-N", "--nside",     type=int, default=0)
args = parser.parse_args()

imap  = enmap.read_map(args.ifile)
if args.downgrade > 1:
    imap = enmap.downgrade(imap, args.downgrade)
omap  = imap.to_healpix(nside=args.nside)
healpy.write_map(args.ofile, omap)

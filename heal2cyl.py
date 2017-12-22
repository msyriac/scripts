from __future__ import print_function
import numpy as np, argparse, healpy as hp
from enlib import enmap
from orphics import maps
parser = argparse.ArgumentParser()
parser.add_argument("ifile")
parser.add_argument("ofile")
parser.add_argument("-r", "--res", type=float, default=None,help="Resolution in arcminutes.")
parser.add_argument("-c", "--coords", type=str, default="j2000")
args = parser.parse_args()

imap  = hp.read_map(args.ifile)
assert imap.ndim==1, "Can't convert multi-component healpix maps"

if args.res is None:
    npix = imap.size
    full_sky_radian_squares = 4.*np.pi
    area_pix = full_sky_radian_squares/npix
    res = np.sqrt(area_pix)
else:
    res = args.res * np.pi/180./60.
    
shape, wcs = enmap.fullsky_geometry(res=res, shape=None, dims=(), proj="car")
print(shape)

omap = maps.enmap_from_healpix(shape,wcs,imap,hp_coords=args.coords,interpolate=True)
print("Done converting. Saving...")
enmap.write_map(args.ofile, omap)

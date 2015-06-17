#!/bin/sh

# set -x  # uncomment for DEBUG purposes

WORKDIR=/work
BLOOMUTILCMD=/usr/local/bin/bloomutil

cd $WORKDIR

echo "[i] Downloading NSRL Reduced Sets..."
NSRL_URL="http://www.nsrl.nist.gov/"
NSRL_ZIP=rds.zip
NSRL_FILE=NSRLFile.txt
NSRL_MD5FILE=NSRLFile.md5
MIN_SET=$(wget -O - ${NSRL_URL}Downloads.htm 2> /dev/null | \
  grep -m 1  "Minimal set" | \
  grep -o '<a href=['"'"'"][^"'"'"']*['"'"'"]' | \
  sed -e 's/^<a href=["'"'"']//' -e 's/["'"'"']$//')
wget $NSRL_URL$MIN_SET -O $NSRL_ZIP
echo "[i] Unzip NSRL Database zip to $WORKDIR ..."
unzip $NSRL_ZIP $NSRL_FILE -d $WORKDIR
echo "[i] Deleting $NSRL_ZIP ..."
rm -f $NSRL_ZIP
echo "[i] Extracting MD5..."
cut -d, -f2 $NSRL_FILE | cut -d\" -f2 | sed 1d > $NSRL_MD5FILE

echo "[i] Downloading Mandiant work set..."
MWHITELISTURL=https://github.com/kost/m-whitelist/raw/master/m-whitelist-1.0.zip
MWLFILE=m-whitelist-1.0.txt
MWLZIP=m-whitelist.zip
wget $MWHITELISTURL -O $MWLZIP
echo "[i] Unzip NSRL Database zip to $WORKDIR ..."
unzip $MWLZIP -d $WORKDIR
echo "[i] Deleting work zip..."
rm -f $MWLZIP

BLOOMUTILCFG=/home/user/.bloomutil
echo "bloomfile=$WORKDIR/work.bloom" > $BLOOMUTILCFG
echo "unhex=1" >> $BLOOMUTILCFG

echo "[i] Build bloomfilter databases ..."
cd $WORKDIR && $BLOOMUTILCMD -v -c $NSRL_MD5FILE $MWLFILE 
echo "[i] Listing created files ..."
ls -l $WORKDIR

echo "[i] Deleting large database files ..."
rm -rf $WORKDIR/$NSRL_FILE $WORKDIR/$NSRL_MD5FILE
rm -rf $WORKDIR/$MWLFILE

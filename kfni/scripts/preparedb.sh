#!/bin/sh

# set -x  # uncomment for DEBUG purposes

WORKDIR=/bloom
BLOOMFN=filenamesi.bloom
BLOOMUTILCMD=/usr/local/bin/bloomutil

cd $WORKDIR

echo "[i] Downloading NSRL Reduced Sets..."
NSRL_URL="http://www.nsrl.nist.gov/"
NSRL_ZIP=rds.zip
NSRL_FILE=NSRLFile.txt
NSRL_WORKFILE=NSRLFile.work
MIN_SET=$(wget -O - ${NSRL_URL}Downloads.htm 2> /dev/null | \
  grep -m 1  "Minimal set" | \
  grep -o '<a href=['"'"'"][^"'"'"']*['"'"'"]' | \
  sed -e 's/^<a href=["'"'"']//' -e 's/["'"'"']$//')
wget $NSRL_URL$MIN_SET -O $NSRL_ZIP
echo "[i] Unzip NSRL Database zip to $WORKDIR ..."
unzip $NSRL_ZIP $NSRL_FILE -d $WORKDIR
echo "[i] Deleting $NSRL_ZIP ..."
rm -f $NSRL_ZIP
echo "[i] Extracting useful data..."
awk -F "\"*,\"*" '{print $4}' $NSRL_FILE | sed 1d > $NSRL_WORKFILE

BLOOMUTILCFG=/home/user/.bloomutil
echo "bloomfile=$WORKDIR/$BLOOMFN" > $BLOOMUTILCFG
echo "ignorecase=1" >> $BLOOMUTILCFG

echo "[i] Build bloomfilter databases ..."
cd $WORKDIR && $BLOOMUTILCMD -v -p 10000 -c $NSRL_WORKFILE $MWLFILE 
echo "[i] Listing created files ..."
ls -l $WORKDIR

echo "[i] Deleting large database files ..."
rm -rf $WORKDIR/$NSRL_FILE $WORKDIR/$NSRL_WORKFILE

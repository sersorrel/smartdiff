# smartdiff

smartdiff is a program to monitor SMART data over time (for example, the
number of reallocated sectors, the number of unrecoverable errors, and
the amount of data written to the drive). The exact data available will
depend on your drive.

## Installation

smartdiff is a short shell script; you can download the file and place
it in your `$PATH`, or clone the repository and run `sudo make install`
to place it in `/usr/local`.

In terms of dependencies, smartdiff requires the following:

- a POSIX-compliant shell and POSIX utilities
- a `date` that supports the `--iso-8601` option
- the `column` utility
- smartmontools
- git

On a standard Debian-based system, installing the `smartmontools` and
`git` packages should be sufficient.

## Usage

As root, run smartdiff with the disk you would like to monitor. On the
first run, the output will look slightly odd, as there is no previous
state to compare with; on all subsequent runs, any changes to SMART data
will be highlighted.

An example:

```
$ sudo smartdiff /dev/sda
SMART overall-health self-assessment test result: PASSED
ID#  ATTRIBUTE_NAME           FLAG    VALUE           WORST  THRESH  TYPE      UPDATED  WHEN_FAILED  RAW_VALUE
1    Raw_Read_Error_Rate      0x002f  100             100    000     Pre-fail  Always   -            0
5    Reallocated_Sector_Ct    0x0032  100             100    010     Old_age   Always   -            0
9    Power_On_Hours           0x0032  100             100    000     Old_age   Always   -            605
12   Power_Cycle_Count        0x0032  100             100    000     Old_age   Always   -            168
171  Program_Fail_Cnt         0x0032  100             100    000     Old_age   Always   -            0
172  Erase_Fail_Cnt           0x0032  100             100    000     Old_age   Always   -            0
173  Avg_Blk_Erase_Cnt        0x0032  100             100    000     Old_age   Always   -            5
174  Unexp_Pwr_Loss_Cnt       0x0032  100             100    000     Old_age   Always   -            4
180  Unused_Rsvd_Blk_Cnt_Tot  0x0033  000             000    000     Pre-fail  Always   -            38
183  Runtime_Bad_Block        0x0032  100             100    000     Old_age   Always   -            0
184  End-to-End_Error         0x0032  100             100    000     Old_age   Always   -            0
187  Reported_Uncorrect       0x0032  100             100    000     Old_age   Always   -            0
194  Temperature_Celsius      0x0022  [-049-]{+047+}  034    000     Old_age   Always   -            [-51-]{+53+}                  (Min/Max  0/66)
196  Reallocated_Event_Count  0x0032  100             100    000     Old_age   Always   -            0
197  Current_Pending_Sector   0x0032  100             100    000     Old_age   Always   -            0
198  Offline_Uncorrectable    0x0030  100             100    000     Old_age   Offline  -            0
199  UDMA_CRC_Error_Count     0x0032  100             100    000     Old_age   Always   -            0
202  Pct_Lifetime_Remaining   0x0030  100             100    001     Old_age   Offline  -            0
206  Write_Error_Rate         0x000e  100             100    000     Old_age   Always   -            0
210  RAIN_Recover_Cnt         0x0032  100             100    000     Old_age   Always   -            0
246  Host_Sectors_Written     0x0032  100             100    000     Old_age   Always   -            [-2611813458-]{+2612140346+}
247  Host_NAND_Pages_Written  0x0032  100             100    000     Old_age   Always   -            [-44817466-]{+44823997+}
248  FTL_NAND_Pages_Written   0x0032  100             100    000     Old_age   Always   -            [-57082362-]{+57082408+}
```

As smartmontools does not (and cannot) contain a comprehensive database
of attribute names, smartdiff comes with several additional attribute
names that will be automatically inserted into the output if your
version of smartmontools does not know about an attribute that your
drive reports (note, attributes differ between drives, so smartdiff's
idea of what an attribute is may not be accurate for your drive).

## Limitations

Due to the ad-hoc nature of SMART data, there may be attributes that
smartdiff and smartmontools have different names for, or attributes that
neither of them know about. If you encounter one of these and you know
what the attribute means, please contribute it to smartmontools itself.

smartdiff was written for the author's own use, and is tuned to work
with their specific drive. It may not work, or may work incorrectly,
when used with other drives.

## Copyright

Copyright © 2018 Ash Holland. Licensed under the EUPL (1.2 or later).

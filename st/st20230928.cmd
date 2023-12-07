#!../bin/linux-aarch64/streamioc

#- You may have to change streamioc to something else
#- everywhere it appears in this file

< envPaths

epicsEnvSet "P" "$(P=BL32U)"
epicsEnvSet "R" "$(R=CCG01)"
epicsEnvSet "IP" "$(IP=192.168.127.101)"
epicsEnvSet "S" "$(S=A1)"

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/streamioc.dbd"
streamioc_registerRecordDeviceDriver pdbbase

## TCP port
drvAsynIPPortConfigure("TCPPORT1","192.168.127.254:4001",0,0,0)
#drvAsynIPPortConfigure("TCPPORT2","192.168.127.254:4002",0,0,0)

drvAsynIPPortConfigure("TCPPORT_$(P)_01","$(IP):4001",0,0,0)
drvAsynIPPortConfigure("TCPPORT_$(P)_02","$(IP):4002",0,0,0)
drvAsynIPPortConfigure("TCPPORT_$(P)_03","$(IP):4003",0,0,0)
drvAsynIPPortConfigure("TCPPORT_$(P)_04","$(IP):4004",0,0,0)
drvAsynIPPortConfigure("TCPPORT_$(P)_05","$(IP):4005",0,0,0)
drvAsynIPPortConfigure("TCPPORT_$(P)_06","$(IP):4006",0,0,0)
drvAsynIPPortConfigure("TCPPORT_$(P)_07","$(IP):4007",0,0,0)
drvAsynIPPortConfigure("TCPPORT_$(P)_08","$(IP):4008",0,0,0)
drvAsynIPPortConfigure("TCPPORT_$(P)_09","$(IP):4009",0,0,0)
drvAsynIPPortConfigure("TCPPORT_$(P)_10","$(IP):4010",0,0,0)
drvAsynIPPortConfigure("TCPPORT_$(P)_11","$(IP):4011",0,0,0)

## Load record instances
#dbLoadRecords("db/xxx.db","user=bl3")

## TCP port
# dbLoadRecords("spsioc/blank.db","PORT='TCPPORT'")
dbLoadRecords("spsioc/Pfeiffer_TPG300.db","PORT='TCPPORT1',P=BL32Ua,R=MBE_CCG,S=A1")
#dbLoadRecords("spsioc/Pfeiffer_TPG256A.db","PORT='TCPPORT2'")

dbLoadRecords("spsioc/Pfeiffer_TPG300.db","PORT='TCPPORT_$(P)_01',P=$(P),R=CCG01,S=A1")
dbLoadRecords("spsioc/Pfeiffer_TPG300.db","PORT='TCPPORT_$(P)_02',P=$(P),R=CCG02,S=A1")
dbLoadRecords("spsioc/Pfeiffer_TPG300.db","PORT='TCPPORT_$(P)_03',P=$(P),R=CCG03,S=A1")
dbLoadRecords("spsioc/Pfeiffer_TPG300.db","PORT='TCPPORT_$(P)_04',P=$(P),R=CCG04,S=A1")
dbLoadRecords("spsioc/Pfeiffer_TPG300.db","PORT='TCPPORT_$(P)_05',P=$(P),R=CCG05,S=A1")
dbLoadRecords("spsioc/Pfeiffer_TPG300.db","PORT='TCPPORT_$(P)_06',P=$(P),R=CCG06,S=A1")
dbLoadRecords("spsioc/Pfeiffer_TPG300.db","PORT='TCPPORT_$(P)_07',P=$(P),R=CCG07,S=B1")
dbLoadRecords("spsioc/Pfeiffer_TPG300.db","PORT='TCPPORT_$(P)_08',P=$(P),R=CCG08,S=A1")
dbLoadRecords("spsioc/Pfeiffer_TPG300.db","PORT='TCPPORT_$(P)_09',P=$(P),R=CCG09,S=A1")
dbLoadRecords("spsioc/Pfeiffer_TPG300.db","PORT='TCPPORT_$(P)_10',P=$(P),R=CCG10,S=A1")
dbLoadRecords("spsioc/Pfeiffer_TPG300.db","PORT='TCPPORT_$(P)_11',P=$(P),R=CCG11,S=A1")


cd "${TOP}/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=bl3"

;
; Zone file for bitmechanic.com
;
$TTL 2h
@     IN  SOA    turbo.bitmechanic.com. hostmaster.bitmechanic.com. (
                   2014050401 ; Serial
                         3600 ; Refresh
                          600 ; Retry
                      6000000 ; Expire
                        3600) ; Minimum TTL
;
		IN	NS	turbo.bitmechanic.com.
		IN      NS      utopia.booyaka.com.
		MX	10	turbo.bitmechanic.com.
;
;
@		A	209.40.199.163
crankshaft	A	66.180.163.17
turbo           A       209.40.199.163
gadget          A       64.79.204.82
barrister       A       108.166.79.232
muffler         A       107.170.219.64
alternator	CNAME	crankshaft
ns		CNAME	crankshaft
mail		CNAME	turbo
www		CNAME	turbo
ftp		CNAME	crankshaft
pv              CNAME   crankshaft
fanmedia        CNAME   crankshaft
loc		CNAME	crankshaft
;
;
; SPF config - added Sept 13 2006 (James)
;
bitmechanic.com.	IN	TXT	"v=spf1 ip4:209.40.199.163 ip4:75.172.71.191 ip4:64.79.204.82 a mx include:gmail.com ~all"
;mail			IN	TXT	"v=spf1 a -all"
@                       IN      TXT     "google-site-verification=2Fs1Xly9jl_psUHXeWI0O3a6FBrjoNAg1F53X-ntYQ4"
;
sparkplug	A	66.93.60.156
*.sparkplug	CNAME	sparkplug
gearbox		CNAME	209.233.17.95
scout-ernie     CNAME   4.18.204.139
churchill       A       209.209.9.239
blockhead       A      	71.212.73.14
choiceusa       A       12.228.11.39
office          A       75.172.71.191
napster         A       12.228.11.39
bonnie          A       12.228.11.39
danecook        A       12.228.11.39
mbfurniture     A       12.228.11.39
thrills         A       12.228.11.39
mailboatrecords A       24.19.23.100
uhf             A       66.180.163.17
energy          CNAME   turbo
fbh             CNAME   crankshaft
acacia          A       69.57.154.30
wbc             CNAME   blockhead
roubaix         A       10.1.0.104
old             A       67.40.222.209
immi            CNAME   crankshaft
patrick         A       216.254.14.206
soccer          A       66.180.163.17
wootang         CNAME   turbo
woo-deux        CNAME   turbo
realtired       CNAME   turbo
centralfc       A       66.180.163.17
potatopatrol    A       66.180.163.17
rampsoccer      A       66.180.163.17
wherewhen       A       66.180.163.17
carrier         A       209.210.203.113
carrier-test    A       128.167.97.58
rbm             A       147.202.69.122
behospitable    A       147.202.69.122
rbmprod         A       72.32.10.221
teamhuge        CNAME   turbo
wasabi          CNAME   turbo
worlddomination A       66.180.163.17
blog            CNAME   turbo
genslerqa       A       67.192.52.163
genslerstage    A       67.192.52.163
genslerprod     A       67.192.52.162
genslerdemo     A       67.192.52.163
imprevbms       CNAME   gadget
imprevsoa       CNAME   gadget
omcdev          CNAME   gadget
hudson          CNAME   gadget
new             CNAME   turbo
imprev-ab       A       207.150.194.201
imprev-trunk    A       207.150.194.200
odc.imprev-ab    CNAME   imprev-ab
client.imprev-ab CNAME  imprev-ab
admin.imprev-ab  CNAME  imprev-ab
support.imprev-ab CNAME imprev-ab
odc.imprev-trunk    CNAME  imprev-trunk
client.imprev-trunk CNAME imprev-trunk
admin.imprev-trunk  CNAME imprev-trunk
dbpedia-dev     A       207.150.194.175
missionrunner    CNAME   gadget
mockprintmail   A    173.203.208.175
pathways        A    209.114.32.155
miles           A    209.114.32.155
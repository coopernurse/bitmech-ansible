;
; Zone file for bitmechanic.com
;
$TTL 2h
@     IN  SOA    turbo.bitmechanic.com. hostmaster.bitmechanic.com. (
                   2014111601 ; Serial
                         3600 ; Refresh
                          600 ; Retry
                      6000000 ; Expire
                        3600) ; Minimum TTL
;
		IN	    NS	    muffler.bitmechanic.com.
		IN      NS      utopia.booyaka.com.
		MX	    10	    muffler.bitmechanic.com.
;
;
@               A       107.170.219.64
turbo           A       209.40.199.163
gadget          A       64.79.204.82
muffler         A       107.170.219.64
;
;
; SPF config - added Sept 13 2006 (James)
;
bitmechanic.com.	IN	TXT	"v=spf1 ip4:107.170.219.64 a mx include:gmail.com ~all"
@                   IN  TXT "google-site-verification=2Fs1Xly9jl_psUHXeWI0O3a6FBrjoNAg1F53X-ntYQ4"
;
mail            CNAME   muffler
www             CNAME   muffler
barrister       CNAME   muffler
energy          CNAME   muffler
blog            CNAME   muffler
imprevbms       CNAME   muffler
imprevsoa       CNAME   muffler
miles           A       209.114.32.155

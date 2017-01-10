import ssl
import sys
import urllib.request

with open(sys.argv[2], 'wb') as out:
    out.write(
        urllib.request.urlopen(
            sys.argv[1],
            context=ssl.SSLContext(ssl.PROTOCOL_TLSv1_2)
        ).read()
    )

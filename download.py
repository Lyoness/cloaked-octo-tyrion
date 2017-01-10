import ssl
import sys
import urllib.request


def main(sysargs=sys.argv[:]):
    print(sys.version)

    url = sysargs[1]
    dest = sysargs[2]
    print('---> {} => {}'.format(url, dest))

    with open(sys.argv[2], 'wb') as out:
        result = out.write(
            urllib.request.urlopen(
                sys.argv[1],
                context=ssl.SSLContext(ssl.PROTOCOL_TLSv1_2)
            ).read()
        )
        print('     wrote bytes={}'.format(result))


if __name__ == '__main__':
    sys.exit(main())

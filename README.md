# openssl-ucc
The script helps to generate self-signed [UCC certificate] based on `openssl.modified.cnf`.
The file `openssl.modified.cnf` is mostly being used for generation of certificate requests.

## Example
`bash generate-crt.sh -d 365` - will generate `server.key` and `server.crt`.

## Generate certificate based on your own sites
In order to generate certificate based on `openssl.modified.cnf` for your sites you should do the following:

1. Open the file `openssl.modified.cnf`.
2. Find section `[alt_names]`.
2. Add/Change/Remove `DNS.1`, `DNS.2` in the format `DNS.N = example2.com` where `N` is number.
3. Save file.
4. Run script `generate-crt.sh`.
5. Follow instructions.

### Script's Options
The script is very simple and straightforward. Currently, the following commands are supported:
`-d` or `--days` – sets the number of days how long the certificate will be valid.
`-c` or `--config` - sets the config name/path for `openssl.modified.cnf`.

[UCC certificate]: https://www.sslshopper.com/unified-communications-uc-ssl-certificates.html

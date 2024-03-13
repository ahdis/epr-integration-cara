curl --request POST \
  --url https://test.ahdis.ch/eprik-cara/camel/cara/Repository/services/RepositoryService \
  --header 'content-type: multipart/related; boundary="uuid:1be94ab5-ed6e-4526-a11a-da6205ef585e"; type="application/xop+xml"; start="<root.message@cxf.apache.org>"; start-info="application/soap+xml;charset=utf-8"' \
  --header 'user-agent: vscode-restclient' \
  --header 'accept-encoding: gzip, deflate' \
  --data-binary @iti-41-gassmann-int-eprik-iti41-curl.bin
# simplism-faas

## Wasm plug-in

- https://github.com/simplism-registry/simplism-faas

## Deployment on Koyeb

🚧 WIP

## Deployment on Clever Cloud

- https://k33g.hashnode.dev/simplism-faas-on-clever-cloud

## Spawn Simplism processes

```bash
ADMIN_SPAWN_TOKEN=this-is-your-token
ADMIN_DISCOVERY_TOKEN=this-is-another-token

ORGANISATION="simplism-registry"
PROJECT="say-hello"
WASM_FILE="say_hello.wasm"
VERSION="0.0.0"

curl -X POST \
https://simplism-faas-bots-garden.koyeb.app/spawn \
-H "admin-spawn-token:${ADMIN_SPAWN_TOKEN}" \
-H 'Content-Type: application/json; charset=utf-8' \
--data-binary @- << EOF
{
    "wasm-file":"${WASM_FILE}", 
    "wasm-url":"https://github.com/${ORGANISATION}/${PROJECT}/releases/download/v${VERSION}/${WASM_FILE}",
    "wasm-function":"handle", 
    "http-port":"9091", 
    "discovery-endpoint":"http://localhost:8080/discovery", 
    "admin-discovery-token":"${ADMIN_DISCOVERY_TOKEN}",
    "information": "✋ I'm the say_hello service",
    "service-name": "say-hello"
}
EOF

PROJECT="hello"
WASM_FILE="hello.wasm"
VERSION="0.0.0"

curl -X POST \
https://simplism-faas-bots-garden.koyeb.app/spawn \
-H "admin-spawn-token:${ADMIN_SPAWN_TOKEN}" \
-H 'Content-Type: application/json; charset=utf-8' \
--data-binary @- << EOF
{
    "wasm-file":"${WASM_FILE}", 
    "wasm-url":"https://github.com/${ORGANISATION}/${PROJECT}/releases/download/v${VERSION}/${WASM_FILE}",
    "wasm-function":"handle", 
    "http-port":"9092", 
    "discovery-endpoint":"http://localhost:8080/discovery", 
    "admin-discovery-token":"${ADMIN_DISCOVERY_TOKEN}",
    "information": "✋ I'm the hello service",
    "service-name": "hello"
}
EOF


curl https://simplism-faas-bots-garden.koyeb.app/discovery \
-H "admin-discovery-token:${ADMIN_DISCOVERY_TOKEN}"

curl https://simplism-faas-bots-garden.koyeb.app/service/say-hello \
-d 'Bob Morane'

curl https://simplism-faas-bots-garden.koyeb.app/service/hello \
-d 'Bob Morane'

```





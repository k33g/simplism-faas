FROM k33g/simplism:0.0.7

ENV ADMIN_DISCOVERY_TOKEN=${ADMIN_DISCOVERY_TOKEN}
ENV ADMIN_SPAWN_TOKEN=${ADMIN_SPAWN_TOKEN}
EXPOSE 8080
CMD [ "/simplism",                  \
      "listen",                     \
      "simplism-faas.wasm",         \
      "handle",                     \
      "--http-port",                \
      "8080",                       \
      "--log-level",                \
      "info",                       \
      "--service-discovery",        \
      "true",                       \
      "--information",              \
      "simplism faas 💜",           \
      "--spawn-mode",               \
      "true",                       \
      "--wasm-url",                 \
      "https://github.com/simplism-registry/simplism-faas/releases/download/v0.0.0/simplism-faas.wasm" \
    ]


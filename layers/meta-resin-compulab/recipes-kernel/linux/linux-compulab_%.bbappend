inherit kernel-resin

RESIN_CONFIGS_append = " overlay"
RESIN_CONFIGS[overlay] = " \
    CONFIG_OVERLAY_FS=y \
"

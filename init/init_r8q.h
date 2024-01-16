#ifndef INIT_SEC_H
#define INIT_SEC_H

#include <string.h>

enum device_variant {
    VARIANT_G780G = 0,
    VARIANT_G781B,
    VARIANT_MAX
};

typedef struct {
    std::string model;
    std::string codename;
} variant;

static const variant international_models = {
    .model = "SM-G780G",
    .codename = "r8q"
};

static const variant international_models_5g = {
    .model = "SM-G781B",
    .codename = "r8q"
};

static const variant *all_variants[VARIANT_MAX] = {
    &international_models,
    &international_models_5g,
};

#endif // INIT_SEC_H

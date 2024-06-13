#ifndef INIT_SM8350_H
#define INIT_SM8350_H

#include <string.h>

enum device_variant {
    VARIANT_A528B = 0,
    VARIANT_A528N,
    VARIANT_M526B,
    VARIANT_M526BR,
    VARIANT_A736B,
    VARIANT_MAX
};

typedef struct {
    std::string model;
    std::string codename;
} variant;

static const variant international_models_a52sxq = {
    .model = "SM-A528B",
    .codename = "a52sxq"
};

static const variant asia_models_a52sxq = {
    .model = "SM-A528N",
    .codename = "a52sxq"
};

static const variant international_models_m52xq = {
    .model = "SM-M526BR",
    .codename = "m52xq"
};

static const variant america_models_m52xq = {
    .model = "SM-M526B",
    .codename = "m52xq"
};

static const variant international_models_a73xq = {
    .model = "SM-A736B",
    .codename = "a73xq"
};

static const variant *all_variants[VARIANT_MAX] = {
    &international_models_a52sxq,
    &asia_models_a52sxq,
    &international_models_m52xq,
    &america_models_m52xq,
    &international_models_a73xq
};

#endif // INIT_SM8350_H

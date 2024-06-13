#ifndef INIT_SM8350_H
#define INIT_SM8350_H

#include <string.h>

enum device_variant {
    VARIANT_G990B = 0,
    VARIANT_G990B2
};

typedef struct {
    std::string model;
    std::string codename;
} variant;

static const variant international_models_r9q = {
    .model = "SM-G990B",
    .codename = "r9q"
};

static const variant international_models_r9q2 = {
    .model = "SM-G990B2",
    .codename = "r9q2"
};

static const variant *all_variants[VARIANT_MAX] = {
    &international_models_r9q,
    &international_models_r9q2
};

#endif // INIT_SM8350_H
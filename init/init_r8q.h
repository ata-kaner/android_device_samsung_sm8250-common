#ifndef INIT_R8Q_H
#define INIT_R8Q_H

#include <string.h>

enum device_variant {
    VARIANT_R8QXX = 0,
    VARIANT_R8QXXX,
};

typedef struct {
    std::string model;
    std::string codename;
} variant;

static const variant international_models_r8qxx = {
    .model = "SM-G780G",
    .codename = "r8qxx"
};

static const variant international_models_r8qxxx = {
    .model = "SM-G781B",
    .codename = "r8qxxx"
};

static const variant *all_variants[VARIANT_MAX] = {
    &international_models_r8qxx,
    &international_models_r8qxxx
};

#endif // INIT_R8Q_H

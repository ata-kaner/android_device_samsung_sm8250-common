/*
 * Copyright (C) 2026 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <camera/CameraMetadata.h>
#include <camera/CameraUtils.h>
#include <stdint.h>
#include <utils/Errors.h>

using android::CameraMetadata;
using android::CameraUtils;
using android::status_t;

extern "C" {

// Android 13 3-argument CameraUtils::getRotationTransform(const CameraMetadata&, int, int32_t*)
// required by Samsung's libcore2nativeutil.camera.samsung.so.
status_t _ZN7android11CameraUtils20getRotationTransformERKNS_14CameraMetadataEiPi(
        const CameraMetadata& staticInfo, int mirrorMode, int32_t* transform) {
    return CameraUtils::getRotationTransform(
            staticInfo, mirrorMode, /*enableTransformInverseDisplay=*/false, transform);
}

}  // extern "C"

#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2025 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.fixups_lib import (
    lib_fixups,
    lib_fixups_user_type,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'device/samsung/sm8250-common',
    'hardware/qcom-caf/sm8250',
    'hardware/qcom-caf/wlan',
    'hardware/samsung',
    'vendor/qcom/opensource/commonsys/display',
    'vendor/qcom/opensource/commonsys-intf/display',
    'vendor/qcom/opensource/dataservices',
    'vendor/qcom/opensource/display',
]


def lib_fixup_system_suffix(lib: str, partition: str, *args, **kwargs):
    return f'{lib}_system' if partition == 'system' else lib


lib_fixups: lib_fixups_user_type = {
    **lib_fixups,
    (
        'libBeauty_v4.camera.samsung',
        'libFace_Landmark_API.camera.samsung',
        'libHprFace_GAE_api.camera.samsung',
        'libHpr_RecGAE_cvFeature_v1.0.camera.samsung',
        'libOpenCv.camera.samsung',
        'libbeautyshot.arcsoft',
        'libexifa.camera.samsung',
        'libimage_enhancement.arcsoft',
        'libmpbase',
        'libpadm',
        'libsavscmn',
    ): lib_fixup_system_suffix,
}

blob_fixups: blob_fixups_user_type = {
    'system/lib64/libcore2nativeutil.camera.samsung.so': blob_fixup()
        .add_needed('libshim_camerautils.so'),
    'system/priv-app/sec_camerax_service/sec_camerax_service.apk': blob_fixup()
        .apktool_patch('blob-patches/sec_camerax_service'),
    'vendor/bin/hw/vendor.samsung.hardware.snap-service': blob_fixup()
        .remove_needed('vendor.samsung.hardware.hyper-V2-ndk_platform.so'),
    'vendor/etc/init/vendor.samsung.hardware.snap-default.rc': blob_fixup()
        .regex_replace('interface aidl default', 'interface aidl vendor.samsung.hardware.snap.ISehSnap/secsnap'),
    ('vendor/lib/mediadrm/libwvdrmengine.so', 'vendor/lib/libwvhidl.so'): blob_fixup()
        .add_needed('libcrypto_shim.so'),
    'vendor/lib64/libarcsoft_multi_frame_video_hdr.so': blob_fixup()
        .clear_symbol_version('remote_handle_close')
        .clear_symbol_version('remote_handle_invoke')
        .clear_symbol_version('remote_handle_open'),
    'vendor/lib64/libdpps.so': blob_fixup()
        .replace_needed('libtinyxml2.so', 'libtinyxml2-v34.so'),
    ('vendor/lib64/libhypermotion_core.so', 'vendor/lib64/libsensorlistener.so', 'vendor/lib64/libvdis_core.so'): blob_fixup()
        .add_needed('libshim_sensorndkbridge.so'),
    'vendor/lib64/libscaler_hw.unifunc.so': blob_fixup()
        .add_needed('libui_shim.so'),
    'vendor/lib64/unihal_main@2.1.so': blob_fixup()
        .add_needed('libshim_sensorndkbridge.so')
        .add_needed('libui_shim.so'),
    ('vendor/lib64/hw/gatekeeper.mdfpp.so', 'vendor/lib64/libkeymaster_helper.so', 'vendor/lib64/libskeymaster4device.so'): blob_fixup()
        .replace_needed('libcrypto.so', 'libcrypto-v33.so'),
    'vendor/lib64/libSecC2ComponentStore.so': blob_fixup()
        .add_needed('libcodec2_shim.so'),
    'vendor/lib64/libsec-ril-impl.so': blob_fixup()
        .binary_regex_replace(b'ril.dds.call.ongoing', b'vendor.calls.slot_id')
        .replace_needed('libril_sem.so', 'libril-samsung.so'),
}  # fmt: skip

module = ExtractUtilsModule(
    'sm8250-common',
    'samsung',
    blob_fixups=blob_fixups,
    lib_fixups=lib_fixups,
    namespace_imports=namespace_imports,
)

if __name__ == '__main__':
    utils = ExtractUtils.device(module)
    utils.run()

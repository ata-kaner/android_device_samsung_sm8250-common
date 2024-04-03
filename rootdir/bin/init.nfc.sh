#! /vendor/bin/sh
#
# Copyright (C) 2023 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

sku=`getprop ro.boot.hardware.sku`
if [ "$sku" = "sn110t" ]; then
    start vendor.nfc_hal_service
    start vendor.secure_element_hal_service
else
    start nfc_hal_service
    start vendor.secure_element_hal_service-gto
fi

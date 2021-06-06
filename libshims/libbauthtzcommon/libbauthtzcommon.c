/*
 * Copyright (C) 2017 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "libbauthtzcommon_shim"
#define LOG_NDEBUG 0

#include <cutils/log.h>

int BAuth_Hat_OP(int arg0 __unused, int arg1 __unused, int arg2 __unused, int arg3 __unused, int arg4 __unused, int arg5 __unused)
{
    ALOGW("SHIM: hijacking %s!", __func__);

    /*
     * This function is supposed to pass the hardware authentication token
     * (HAT) to the mobicore trustlet.
     */

    return 0;
}

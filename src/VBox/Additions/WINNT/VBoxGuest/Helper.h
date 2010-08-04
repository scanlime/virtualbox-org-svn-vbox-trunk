/** @file
 *
 * VBoxGuest -- VirtualBox Win32 guest support driver
 *
 * Copyright (C) 2006-2010 Oracle Corporation
 *
 * This file is part of VirtualBox Open Source Edition (OSE), as
 * available from http://www.virtualbox.org. This file is free software;
 * you can redistribute it and/or modify it under the terms of the GNU
 * General Public License (GPL) as published by the Free Software
 * Foundation, in version 2 as it comes in the "COPYING" file of the
 * VirtualBox OSE distribution. VirtualBox OSE is distributed in the
 * hope that it will be useful, but WITHOUT ANY WARRANTY of any kind.
 */

#ifndef _H_VBOXGUESTHELPER
#define _H_VBOXGUESTHELPER

extern "C"
{
/**
 * Helper to scan the PCI resource list and remember stuff.
 *
 * @param pResList  Resource list
 * @param pDevExt   Device extension
 * @return NT status code
 */
NTSTATUS VBoxScanPCIResourceList(PCM_RESOURCE_LIST pResList, PVBOXGUESTDEVEXT pDevExt);

/**
 * Helper to map VMMDev Memory.
 *
 * @param pDevExt   VMMDev device extension
 * @return NT status code
 */
NTSTATUS hlpVBoxMapVMMDevMemory (PVBOXGUESTDEVEXT pDevExt);

/**
 * Helper to unmap VMMDev Memory.
 *
 * @param pDevExt   VMMDev device extension
 */
void hlpVBoxUnmapVMMDevMemory (PVBOXGUESTDEVEXT pDevExt);

/**
 * Helper for mapping the Windows version to the OS type understood by the host.
 *
 * @return The OS type.
 * @param winVer   Windows version to translate.
 */
VBOXOSTYPE hlpVBoxWinVersionToOSType (winVersion_t winVer);

#ifdef VBOX_WITH_GUEST_BUGCHECK_DETECTION
/**
 * Helper for registering the bugcheck callback rountine(s).
 *
 * @param pDevExt   VMMDev device extension
 */
void hlpRegisterBugCheckCallback (PVBOXGUESTDEVEXT pDevExt);

/**
 * Helper for deregistering the bugcheck callback rountine(s).
 *
 * @param pDevExt   VMMDev device extension
 */
void hlpDeregisterBugCheckCallback (PVBOXGUESTDEVEXT pDevExt);
#endif
}

#endif // _H_VBOXGUESTHELPER

//========================================================================================
//  $File: //a3t/argon/branches/v1/1.0/dev/sdk/samples/flex/textLayout_ui/src/bxf/ui/toolkit/ITrackerInterface.as $
//  $DateTime: 2009/12/22 14:38:02 $
//  $Revision: #1 $
//  $Change: 733743 $
//
//  ADOBE CONFIDENTIAL
// ___________________
//
//  Copyright 2008 Adobe Systems Incorporated
//  All Rights Reserved.
//
// NOTICE:  All information contained herein is, and remains
// the property of Adobe Systems Incorporated and its suppliers,
// if any.  The intellectual and technical concepts contained
// herein are proprietary to Adobe Systems Incorporated and its
// suppliers and may be covered by U.S. and Foreign Patents,
// patents in process, and are protected by trade secret or copyright law.
// Dissemination of this information or reproduction of this material
// is strictly forbidden unless prior written permission is obtained
// from Adobe Systems Incorporated.
//========================================================================================

package com.adobe.bxf.ui.toolkit
{
	import flash.events.MouseEvent;

	public interface ITrackerInterface {

		/**	Override to get cursor adjust hook and mouse down.
		 * @param inMouseEvent mouse info.
		 * @param inCursorAdjust true if this is a mouse up track.*/
		function BeginTracking(inMouseEvent:MouseEvent, inCursorAdjust:Boolean):void;

		/**	Override to get mouse move.
		 * @param inMouseEvent mouse info.*/
		function ContinueTracking(inMouseEvent:MouseEvent):void;

		/**	Override to get mouse up.
		 * @param inMouseEvent mouse info.*/
		function EndTracking(inMouseEvent:MouseEvent):void;
	}
}
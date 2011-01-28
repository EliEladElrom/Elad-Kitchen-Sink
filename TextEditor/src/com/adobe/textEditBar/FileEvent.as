//========================================================================================
//  $File: //a3t/argon/branches/v1/1.0/dev/sdk/samples/flex/textLayout_editBar/src/textEditBar/FileEvent.as $
//  $DateTime: 2009/12/22 14:38:02 $
//  $Revision: #1 $
//  $Change: 733743 $
//
//  ADOBE CONFIDENTIAL
//
//  Copyright 2007-08 Adobe Systems Incorporated. All rights reserved.
//
//  NOTICE:  All information contained herein is, and remains
//  the property of Adobe Systems Incorporated and its suppliers,
//  if any.  The intellectual and technical concepts contained
//  herein are proprietary to Adobe Systems Incorporated and its
//  suppliers and may be covered by U.S. and Foreign Patents,
//  patents in process, and are protected by trade secret or copyright law.
//  Dissemination of this information or reproduction of this material
//  is strictly forbidden unless prior written permission is obtained
//  from Adobe Systems Incorporated.
//
//========================================================================================
package com.adobe.textEditBar
{
import flash.events.Event;
import flash.net.FileReference;

public class FileEvent extends Event
{
	public var fileName:FileReference;

	public const FILE_CHOOSE:String = "fileChoose";

	public function FileEvent(newFileName:FileReference, type:String = FILE_CHOOSE,
							  bubbles:Boolean = false,
							  cancelable:Boolean = false)
	{
		super(type, bubbles, cancelable);
		fileName = newFileName;
	}

	override public function clone():Event
	{
		return new FileEvent(fileName, type, bubbles, cancelable);
	}
}		// end class
}		// end package
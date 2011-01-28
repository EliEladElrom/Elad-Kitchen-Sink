//========================================================================================
//  $File: //a3t/argon/branches/v1/1.0/dev/sdk/samples/flex/textLayout_ui/src/bxf/ui/inspectors/IPropertyEditor.as $
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
package com.adobe.bxf.ui.inspectors
{
	import flash.events.IEventDispatcher;

	// dispatches PropertyEditEvents on changes
	public interface IPropertyEditor extends IEventDispatcher
	{
		function setValueAsString(value:String, inPropType:String):void;
		/**
		 * setMultiValue is for use when a multiple selection contains different values
		 * for the property. values should be Array of strings.
		*/
		function setMultiValue(values:Array, inPropType:String):void;
	}
}
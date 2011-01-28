//========================================================================================
//  $File: //a3t/argon/branches/v1/1.0/dev/sdk/samples/flex/textLayout_ui/src/bxf/ui/inspectors/IPropertiesEditor.as $
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

	public interface IPropertiesEditor extends IEventDispatcher
	{
		/**An instance of an IPropertiesEditor can be cached and re-used across multiple instances of the same
			object type.  The 'reset()' function is called on an existing property editor when a different
			instance of the component is selected.  The intent is that any internal state related to a previous
			editing session is removed and the editor is in a condition similar to it was upon initial
			construction */
		function reset():void;

		function get properties():Object;	// associative array of property IDs and their values.

		function rebuildUI():void;

		//function draw():void;	// Use this for any custom drawing. Dynamic renderer needs it; dont' think anyone else does
	}
}
//========================================================================================
//  $File: //a3t/argon/branches/v1/1.0/dev/sdk/samples/flex/textLayout_ui/src/bxf/ui/inspectors/PropertyEditEvent.as $
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
package com.adobe.bxf.ui.inspectors
{
	import mx.events.PropertyChangeEvent;

	public class PropertyEditEvent extends PropertyChangeEvent
	{
		/// This event type means a temporary change, like you might consume for live feedback
		public static const VALUE_EDITED:String = new String("valueEdited");

		/// This event type means a committed change - Enter hit, drage ended, whatever.
		public static const VALUE_CHANGED:String = new String("valueCommitted");

		/// This event type means we have detected that the user is hovering, editing, etc.
		/// Only "property" may be set in this case
		public static const VALUE_ACTIVE:String = new String("valueActive");

		/// This event type means opposite of VALUE_FOCUSSED
		/// Only "property" may be set in this case
		public static const VALUE_INACTIVE:String = new String("valueInactive");

		public function PropertyEditEvent(type:String, property:Object=null, newValue:Object=null)
		{
			// These parts of mx.events.PropertyChangeEvent, we don't currently use
			const bubbles:Boolean = false;
			const cancelable:Boolean = false;
			const kind:String = null;
			const source:Object = null;
			const oldValue:Object = null;

			super(type, bubbles, cancelable, kind, property, oldValue, newValue, source);
		}

	}
}
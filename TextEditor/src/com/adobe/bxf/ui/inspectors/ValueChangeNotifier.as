//========================================================================================
//  $File: //a3t/argon/branches/v1/1.0/dev/sdk/samples/flex/textLayout_ui/src/bxf/ui/inspectors/ValueChangeNotifier.as $
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
	import flash.events.IEventDispatcher;

	/**
	 * Used by the property (and soon action argument) editors to communicate changes back
	 * to the client.  As of inital writing, it calls callback functions, but that will be
	 * migrating to events. Consolidating it here makes that easier.
	 **/
	public class ValueChangeNotifier
	{
		public function ValueChangeNotifier(inPropName:String, dispatcher:IEventDispatcher)
		{
			mPropName = inPropName;
			mDispatcher = dispatcher;
		}

		public function ValueEdited(newValue:Object):void
		{
			mDispatcher.dispatchEvent(new PropertyEditEvent(PropertyEditEvent.VALUE_EDITED, mPropName, newValue));
		}

		public function ValueCommitted(newValue:Object):void
		{
			mDispatcher.dispatchEvent(new PropertyEditEvent(PropertyEditEvent.VALUE_CHANGED, mPropName, newValue));
		}

		private var mPropName:String;
		private var mDispatcher:IEventDispatcher;

	}
}